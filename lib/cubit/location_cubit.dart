
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/location_repository.dart';
import '../model/user_location.dart';

class LocationCubit extends Cubit<UserLocation?> {
  final LocationRepository locationRepository;

  LocationCubit(this.locationRepository) : super(null);

  Future<void> fetchLocation() async {
    final location = await locationRepository.getUserLocation();
    emit(location);
  }
}
