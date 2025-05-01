import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class LocationMapWidget extends StatefulWidget {
  const LocationMapWidget({super.key});

  @override
  State<LocationMapWidget> createState() => _LocationMapWidgetState();
}

class _LocationMapWidgetState extends State<LocationMapWidget> {
  GoogleMapController? mapController;
  LatLng? currentLocation;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {};
  String selectedAddressTitle = 'Loading...'.tr();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      markers = {
        Marker(markerId: MarkerId('current'), position: currentLocation!)
      };
    });

    _getAddressFromCoordinates(position.latitude, position.longitude);
    mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
  }

  Future<void> _getAddressFromCoordinates(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          selectedAddressTitle = '${placemark.street}, ${placemark.locality}, ${placemark.country}';
        });
      }
    } catch (e) {
      print("Address error: $e");
    }
  }

  void _searchAddress() async {
    String query = searchController.text;
    if (query.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        setState(() {
          currentLocation = LatLng(loc.latitude, loc.longitude);
          markers = {
            Marker(markerId: MarkerId('searched'), position: currentLocation!)
          };
        });
        _getAddressFromCoordinates(loc.latitude, loc.longitude);
        mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
      }
    } catch (e) {
      print("Search error: $e");
    }
  }

  void _onMapTapped(LatLng tappedLocation) {
    setState(() {
      currentLocation = tappedLocation;
      markers = {
        Marker(markerId: MarkerId('tapped'), position: currentLocation!)
      };
    });
    _getAddressFromCoordinates(tappedLocation.latitude, tappedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // مربع البحث
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[900] : Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              onSubmitted: (_) => _searchAddress(),
            ),
          ),
        ),

        // العنوان الحالي
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            selectedAddressTitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // الخريطة
        SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation ?? LatLng(31.963158, 35.930359),
              zoom: 14,
            ),
            onMapCreated: (controller) => mapController = controller,
            myLocationEnabled: true,
            markers: markers,
            onTap: _onMapTapped,
          ),
        ),
      ],
    );
  }
}
