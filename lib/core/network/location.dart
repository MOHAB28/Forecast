import 'package:geolocator/geolocator.dart';

import '../error/exception.dart';

class Location {
  double? latitude;
  double? longitude;
  final GeolocatorPlatform geolocator;
  Location(this.geolocator);
  Future<void> getCurrentLocation() async {
    try {
      if (!await geolocator.isLocationServiceEnabled()) {
        throw LocationDisabledException();
      }
      LocationPermission permission;
      permission = await geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          throw LocationPermessionException();
        }
      }

      Position position = await geolocator.getCurrentPosition(
          locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.low));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      rethrow;
    }
  }
}
