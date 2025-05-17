import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/chat%20screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../cubit/cart_cubit.dart';
import '../../cubit/location_cubit.dart';
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
  int _currentStep = 1;
  String selectedAddressTitle = 'Loading...'.tr();
  bool delivered = true;

  @override
  void initState() {
    super.initState();
    markers.add(
      const Marker(
        markerId: MarkerId("delivery"),
        position: LatLng(31.963158, 35.930359),
        infoWindow: InfoWindow(title: "Delivery Hero"),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(31.963158, 35.930359),
                zoom: 14,
              ),
              onMapCreated: (controller) => mapController = controller,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers: markers,
            ),
            Positioned(
              top: responsiveHeight(context, 50),
              left: responsiveWidth(context, 20),
              right: responsiveWidth(context, 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      //BackButton(color: isDarkMode ? Colors.black : Colors.black),
                      Expanded(
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(40),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Find your location".tr(),hintStyle: TextStyle(
                              color: Color(0xff878787),
                              fontSize: responsiveWidth(context, 12)
                            ),
                              prefixIcon: const Icon(Icons.search, color: Color(0xff25AE4B)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: isDarkMode ? Colors.white54 : Color(0xffD6D6D6),
                                ),                              ),
                              filled: true,
                              fillColor: isDarkMode ? Colors.grey[900] : Colors.white,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            ),
                            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),

                            onSubmitted: (_) => _searchAddress(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 10)),

                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomSheet(context, isDarkMode),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 24),
        vertical: responsiveHeight(context, 16),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, isDarkMode),
            SizedBox(height: responsiveHeight(context, 12)),
            _buildStepsIndicator(context),
            SizedBox(height: responsiveHeight(context, 12)),
            _buildDeliveryPersonInfo(isDarkMode),
            const Divider(thickness: 0.5),
            _buildLocationSection(context, isDarkMode),
            if (delivered) ...[
              SizedBox(height: responsiveHeight(context, 16)),
              _buildConfirmButton(context),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${"On the way".tr()}!",
          style: TextStyle(
            fontSize: responsiveWidth(context, 16),
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrderDetailsScreen()),
          ),
          child: Text(
            'All details'.tr(),
            style: TextStyle(
              fontSize: responsiveWidth(context, 12),
              fontWeight: FontWeight.bold,
              color: const Color(0xff25AE4B),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepsIndicator(BuildContext context) {
    List<String> steps = ['Order Placed'.tr(), 'On The Way'.tr(), 'Delivered'.tr()];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(steps.length, (index) {
        final bool isCompleted = _currentStep > index;
        final bool isActive = _currentStep == index;

        Color textColor = isCompleted || isActive ? const Color(0xff25AE4B) : Colors.grey;
        Gradient? barGradient = isCompleted
            ? const LinearGradient(colors: [Color(0xff25AE4B), Color(0xff25AE4B)])
            : isActive
            ? const LinearGradient(colors: [Color(0xff25AE4B), Colors.grey])
            : const LinearGradient(colors: [Colors.grey, Colors.grey]);

        return Expanded(
          child: Column(
            children: [
              Text(
                steps[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsiveWidth(context, 10),
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: barGradient,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }


  Widget _buildDeliveryPersonInfo(bool isDarkMode) {
    return Row(
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
                  style: TextStyle(
                      fontSize: responsiveWidth(context, 10),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff878787))),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Aleksandr V.',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 12),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Color(0xff878787),
                    ),
                  ),
                  SizedBox(width: responsiveWidth(context, 8)),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: responsiveWidth(context, 4)),
                  Text('4.9',
                      style: TextStyle(
                          fontSize: responsiveWidth(context, 12),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Color(0xff878787),
                      )),
                ],
              ),
            ],
          ),
        ),
        _buildIconButton(Icons.call, Colors.green),
        SizedBox(width: responsiveWidth(context, 12)),
        _buildIconButton(Icons.chat, const Color(0xffF2AB58)),
      ],
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
        },
        icon: Icon(icon, color: color, size: responsiveWidth(context, 22)),
      ),
    );
  }



  Widget _buildLocationSection(BuildContext context, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.only(top: responsiveHeight(context, 10)),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.green, size: 20),
          SizedBox(width: responsiveWidth(context, 12)),
          Expanded(
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                String locationText = 'Loading location...'.tr();

                if (state is LocationLoading) {
                  locationText = 'Loading location...'.tr();
                } else if (state is LocationLoaded) {
                  return FutureBuilder<List<Placemark>>(
                    future: placemarkFromCoordinates(
                      state.location.latitude,
                      state.location.longitude,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading address...'.tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 10),
                            color: isDarkMode ? Colors.white70 : Color(0xff878787),
                          ),
                        );
                      } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text(
                          'Unable to fetch address'.tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 10),
                            color: isDarkMode ? Colors.white70 : Color(0xff878787),
                          ),
                        );
                      } else {
                        final place = snapshot.data!.first;
                        final address = '${place.street}, ${place.locality}';
                        return Text(
                          address,
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 10),
                            color: isDarkMode ? Colors.white70 : Color(0xff878787),
                          ),
                        );
                      }
                    },
                  );
                } else if (state is LocationError) {
                  locationText = 'Location not available'.tr();
                }

                return Text(
                  locationText,
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 12),
                    color: isDarkMode ? Colors.white70 : Color(0xff878787),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff25AE4B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 12)),
      ),
      onPressed: () => _showConfirmationDialog(context),
      child: Center(
        child: Text(
          "Confirm Receipt".tr(),
          style: TextStyle(
            fontSize: responsiveWidth(context, 16),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Confirm Receipt".tr(),
            style:  TextStyle(
                fontWeight: FontWeight.bold,
            fontSize: responsiveWidth(context, 16)
            ),
        ),
        content: Text("Are you sure you received your order?".tr(),
        style: TextStyle(fontSize:responsiveWidth(context, 12) ),),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              context.read<CartCubit>().clearCart();
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                    (route) => false,
              );
            },
            child: Text("received confirmation".tr(),
                style:  TextStyle(color: Colors.white,
                    fontSize: responsiveWidth(context, 12))
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel".tr(), style:  TextStyle(color: Colors.red,
                fontSize: responsiveWidth(context, 12))),
          ),
        ],
      ),
    );
  }
}
