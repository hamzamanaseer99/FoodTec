import 'package:foodtek/model/user_location.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future<UserLocation?> getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print('Location Permission: $permission'); // تأكيد الإذن

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return UserLocation(latitude: position.latitude, longitude: position.longitude);
    }
    return null;
  }
}
