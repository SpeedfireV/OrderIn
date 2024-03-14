import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<bool> checkLocationAvailability() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  static Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  static Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  static Future<Position?> getCurrentLocation() async {
    bool isLocationServiceEnabled = await checkLocationAvailability();
    LocationPermission permission = await checkPermission();
    if (isLocationServiceEnabled &&
        (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always)) {
      var location = await Geolocator.getCurrentPosition();
      log(location.toString());
      return location;
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        var location = await Geolocator.getCurrentPosition();

        log(location.toString());
        return location;
      }
      await navigateToLocationSettings();
      log("User didn't give access to location.");
    }
  }

  static Future<bool> navigateToLocationSettings() async {
    await Geolocator.openLocationSettings();
    return true;
  }

  static Future AddressByCoordinates(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks[0].street;
  }
}
