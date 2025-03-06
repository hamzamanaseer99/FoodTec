
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/location_repository.dart';
import '../model/user_location.dart';

class LocationCubit extends Cubit<UserLocation?> {
  final LocationRepository locationRepository;

  LocationCubit(this.locationRepository) : super(null);

  Future<void> fetchLocation() async {
    emit(null); // مسح القيمة السابقة
    UserLocation? location = await locationRepository.getUserLocation();
    if (location != null) {
      print('Location Fetched: Lat=${location.latitude}, Lon=${location.longitude}');
      emit(location);
    } else {
      print('Failed to get location');
    }

  }
}
