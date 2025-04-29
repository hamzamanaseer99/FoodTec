import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/location_cubit.dart';
import 'package:foodtek/model/user_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:easy_localization/easy_localization.dart';


class LocationTitleWidget extends StatelessWidget {
  final ThemeData theme;

  const LocationTitleWidget({super.key, required this.theme});

  Future<String> _getAddressFromLocation(UserLocation location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return '${place.street}, ${place.locality}';
      } else {
        return 'Unknown location';
      }
    } catch (e) {
      return 'Unable to fetch address';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        String locationText = 'Loading...';

        if (state is LocationLoading) {
          locationText = 'Loading...';
        } else if (state is LocationLoaded) {
          return FutureBuilder<String>(
            future: _getAddressFromLocation(state.location),
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current location".tr(),
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.textTheme.bodySmall!.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    snapshot.data ?? 'Loading...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is LocationError) {
          locationText = 'Location not available';
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current location".tr(),
              style: TextStyle(
                fontSize: 12,
                color: theme.textTheme.bodySmall!.color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              locationText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge!.color,
              ),
            ),
          ],
        );
      },
    );
  }
}
