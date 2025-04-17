import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/chat%20screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../homescreen.dart';

class LiveTrackScreen extends StatefulWidget {
  const LiveTrackScreen({super.key});

  @override
  State<LiveTrackScreen> createState() => _LiveTrackScreenState();
}

class _LiveTrackScreenState extends State<LiveTrackScreen> {
  GoogleMapController? mapController;
  LatLng? currentLocation;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {};
  String selectedAddressTitle = 'Loading...'.tr();
  int _currentStep = 1;
  bool delivered = true;

  Future<void> _getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          selectedAddressTitle = '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        });
      }
    } catch (e) {
      print('Error getting address: $e');
    }
  }

  void _searchAddress() async {
    String query = searchController.text;
    if (query.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(query);
        if (locations.isNotEmpty) {
          final location = locations.first;
          setState(() {
            currentLocation = LatLng(location.latitude, location.longitude);
            markers.clear();
            markers.add(Marker(
              markerId: MarkerId('searchedLocation'.tr()),
              position: currentLocation!,
            ));
          });
          _getAddressFromCoordinates(location.latitude, location.longitude);
          mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
        }
      } catch (e) {
        print("Error searching address: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: MarkerId("delivery"),
        position: LatLng(31.963158, 35.930359),
        infoWindow: InfoWindow(title: "Delivery Hero"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(31.963158, 35.930359),
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers: markers,
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 30),
                vertical: responsiveHeight(context, 60),
              ),
              child: Row(
                children: [
                  BackButton(),
                  Expanded(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(40),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Find your location".tr(),
                          prefixIcon: Icon(Icons.search, color: Color(0xff25AE4B)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Color(0xffD6D6D6)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                        onSubmitted: (_) => _searchAddress(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Sheet
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: responsiveHeight(context, 450),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 24),
          vertical: responsiveHeight(context, 16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "On the way".tr(),
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
                  ),
                  child: Text(
                    'All details'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff25AE4B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 16)),

            // Status Steps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusStep(context, label: 'Order Placed'.tr(), isActive: _currentStep >= 0, isCompleted: true),
                _buildStatusStep(context, label: 'On The Way'.tr(), isActive: _currentStep >= 1, isCompleted: false),
                _buildStatusStep(context, label: 'Delivered'.tr(), isActive: _currentStep >= 2, isCompleted: false),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 12)),

            // Progress Line
            Container(
              height: 2,
              margin: EdgeInsets.only(bottom: responsiveHeight(context, 8)),
              child: Stack(
                children: [
                  Container(width: double.infinity, color: Colors.grey[300]),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width * (_currentStep + 1) / 3,
                    color: const Color(0xff25AE4B),
                  ),
                ],
              ),
            ),

            // Delivery Hero Info
            Padding(
              padding: EdgeInsets.only(top: responsiveHeight(context, 12)),
              child: Row(children: [Expanded(child: _buildDeliveryPersonInfo())]),
            ),
            const Divider(thickness: 0.5),

            // User Location
            _buildLocationSection(),

            // Confirm Button if Delivered
            if (delivered) ...[
              SizedBox(height: responsiveHeight(context, 5)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff25AE4B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 12),
                  ),
                ),
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                child: Center(
                  child: Text(
                    "Confirm Receipt".tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(BuildContext context, {
    required String label,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Column(
      children: [
        Container(
          width: responsiveWidth(context, 24),
          height: responsiveWidth(context, 24),
          decoration: BoxDecoration(
            color: isCompleted ? const Color(0xff25AE4B)
                : isActive ? Colors.white : Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isActive ? const Color(0xff25AE4B) : Colors.transparent,
              width: 2,
            ),
          ),
          child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
        ),
        SizedBox(height: responsiveHeight(context, 4)),
        Text(
          label,
          style: TextStyle(
            fontSize: responsiveWidth(context, 12),
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryPersonInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green.withOpacity(0.2),
            child: ClipOval(
              child: Image.asset(
                "assets/images/deleviry_hero.png",
                fit: BoxFit.cover,
                width: 56,
                height: 56,
              ),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Delivery Hero'.tr(),
                    style: TextStyle(fontSize: responsiveWidth(context, 12),
                        fontWeight: FontWeight.bold, color: const Color(0xff878787))),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Aleksandr V.', style: TextStyle(fontSize: 14, color: Color(0xff2F2E36))),
                    SizedBox(width: responsiveWidth(context, 8)),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text('4.9', style: TextStyle(fontSize: responsiveWidth(context, 12),
                        color: const Color(0xffB8B8B8), fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
          _buildIconButton(Icons.call, Colors.green),
          SizedBox(width: responsiveWidth(context, 12)),
          _buildIconButton(Icons.chat, const Color(0xffF2AB58)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      width: responsiveWidth(context, 40),
      height: responsiveHeight(context, 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xffF5F5F5),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        icon: Icon(icon, color: color, size: responsiveWidth(context, 22)),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('your location'.tr(),
              style: TextStyle(fontSize: responsiveWidth(context, 12),
                  color: const Color(0xff878787), fontWeight: FontWeight.w500)),
          SizedBox(height: responsiveHeight(context, 12)),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.green, size: 20),
              SizedBox(width: responsiveWidth(context, 12)),
              Expanded(
                child: Text(
                  "123 Al-Madina Street, Abdali, Amman, Jordan".tr(),
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 12),
                    color: const Color(0xff6C7278),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Confirm Receipt".tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure you received your order?".tr()),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              },
              child: Text(
                "Yes, I received it!".tr(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel".tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
