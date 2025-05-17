// import 'package:foodtek/model/user_location.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationRepository {
//   Future<UserLocation?> getUserLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     print('Location Permission: $permission'); // تأكيد الإذن
//
//     if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       return UserLocation(latitude: position.latitude, longitude: position.longitude);
//     }
//     return null;
//   }
// }

// location_repository.dart
import 'package:foodtek/model/user_location.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future<UserLocation?> getUserLocation() async {
    try {
      // 1. التحقق من تفعيل خدمة الموقع
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        return null;
      }

      // 2. التحقق من الأذونات
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return null;
        }
      }

      // 3. جلب الموقع الحالي
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 4. التحقق من إحداثيات صالحة
      if (position.latitude == 0.0 && position.longitude == 0.0) {
        return null;
      }

      return UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print('Location Error: $e');
      return null;
    }
  }
}