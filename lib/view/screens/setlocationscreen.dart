// import 'package:flutter/material.dart';
// import 'package:foodtek/view/screens/checkout_screen.dart';
// import 'package:foodtek/view/screens/payment_screen.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class SetLocationScreen extends StatefulWidget {
//   const SetLocationScreen({super.key});
//
//   @override
//   _SetLocationScreenState createState() => _SetLocationScreenState();
// }
//
// class _SetLocationScreenState extends State<SetLocationScreen> {
//   GoogleMapController? mapController;
//   LatLng? currentLocation;
//
//   Future<void> _getCurrentLocation() async {
//     if (currentLocation != null) return; // ✅ يمنع التكرار
//
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied.');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied.');
//     }
//
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       currentLocation = LatLng(position.latitude, position.longitude);
//       mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
//     });
//
//     // ✅ الانتقال لصفحة الدفع بعد أخذ الموقع
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => CheckoutScreen(userLocation: currentLocation!)),
//     );
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Set Your Location')),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(31.963158, 35.930359), // عمان كموقع مبدأي
//               zoom: 12,
//             ),
//             onMapCreated: (controller) {
//               mapController = controller;
//             },
//             myLocationEnabled: true,
//             markers: currentLocation != null
//                 ? {
//               Marker(
//                 markerId: MarkerId('currentLocation'),
//                 position: currentLocation!,
//               )
//             }
//                 : {},
//           ),
//           Positioned(
//             bottom: 30,
//             left: 20,
//             right: 20,
//             child: ElevatedButton(
//               onPressed: _getCurrentLocation,
//               child: Text('Set Your Location'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/checkout_screen.dart';
import 'package:foodtek/view/screens/payment_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  _SetLocationScreenState createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  GoogleMapController? mapController;
  LatLng? currentLocation;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {}; // لتخزين العلامات على الخريطة
  String selectedAddressTitle = 'Loading...'.tr(); // متغير لتخزين العنوان المختار

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // تحديد الموقع الحالي باستخدام Geolocator
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId('currentLocation'),
        position: currentLocation!,
      ));
    });

    // تحويل الإحداثيات إلى عنوان نصي
    _getAddressFromCoordinates(position.latitude, position.longitude);

    // تحريك الكاميرا إلى الموقع الحالي
    mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
  }

  // تحويل الإحداثيات إلى عنوان نصي
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

  // إذا كان المستخدم قد اختار عنوانًا من البحث
  void _searchAddress() async {
    String query = searchController.text;
    if (query.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(query);
        if (locations.isNotEmpty) {
          final location = locations.first;
          setState(() {
            currentLocation = LatLng(location.latitude, location.longitude);
            markers.clear(); // إخفاء أي علامات سابقة
            markers.add(Marker(
              markerId: MarkerId('searchedLocation'.tr()),
              position: currentLocation!,
            ));
          });
          _getAddressFromCoordinates(location.latitude, location.longitude); // تحويل الإحداثيات للعنوان
          mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
        }
      } catch (e) {
        print("Error searching address: $e");
      }
    }
  }

  // تحديد الموقع عند النقر على الخريطة
  void _onMapTapped(LatLng tappedLocation) {
    setState(() {
      currentLocation = tappedLocation;
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId('selectedLocation'),
        position: currentLocation!,
      ));

    });
    _getAddressFromCoordinates(tappedLocation.latitude, tappedLocation.longitude); // تحويل الإحداثيات للعنوان

  }

  @override
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // خريطة جوجل
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation ?? LatLng(31.963158, 35.930359),
                zoom: 14,
              ),
              onMapCreated: (controller) => mapController = controller,
              myLocationEnabled: true,
              onTap: _onMapTapped,
              markers: markers,
            ),
          ),

          // خانة البحث
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 30),
              vertical: responsiveHeight(context, 60),
            ),
            child: Row(
              children: [
                BackButton(color: isDark ? Colors.black : Colors.black),
                Expanded(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(40),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Find your location".tr(),hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff878787)
                      ),
                        prefixIcon: Icon(Icons.search, color: Color(0xff25AE4B)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white54 : Color(0xffD6D6D6),
                          ),
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
              ],
            ),
          ),

          // عرض العنوان + زر التأكيد
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Title
                  Text('Your Location'.tr(),
                    style: TextStyle(
                    fontSize: responsiveWidth(context, 12),
                    color: Color(0xff878787)
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      selectedAddressTitle,
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 12),
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Confirm Button
                  ElevatedButton(
                    onPressed: currentLocation == null
                        ? null
                        : () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            userLocation: currentLocation!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff25AE4B),
                    ),
                    child: Text(
                      'Set Location'.tr(),
                      style: TextStyle(fontSize: responsiveWidth(context, 14), color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


