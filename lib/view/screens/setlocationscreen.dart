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
  String selectedAddressTitle = 'Loading...'; // متغير لتخزين العنوان المختار

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(

        children: [
          // خريطة جوجل
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation ?? LatLng(31.963158, 35.930359), // الموقع أو عمان
                zoom: 14,
              ),
              onMapCreated: (controller) => mapController = controller,
              myLocationEnabled: true,
              onTap: _onMapTapped,
              markers: markers,
            ),
          ),

          // خانة البحث
          Positioned(
            top: 70, // تغيير الموضع ليكون أسفل قليلاً
            left: 20,
            right: 20,
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
              decoration: InputDecoration(
                hintText: "Find your location".tr(),
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor, // لون الخلفية حسب الثيم
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor, // لون الإطار حسب الثيم
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (_) => _searchAddress(),
            ),

          ),

          // عرض العنوان في Card
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // الجدول (Card) الذي يعرض العنوان المختار
                Card(
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      selectedAddressTitle, // عرض العنوان المختار هنا
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // زر تأكيد الموقع مع تحسين التصميم
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
                    minimumSize: Size(double.infinity, 50), // عرض كامل وارتفاع 50
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Confirm Location'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


