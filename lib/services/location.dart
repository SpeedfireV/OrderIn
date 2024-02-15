import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  Future<Position?> getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
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
      navigateToLocationSettings();
      log("User didn't give access to location.");
    }
  }

  Future navigateToLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future AddressByCoordinates(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    log(placemarks.toString());
    return placemarks;
  }
}
