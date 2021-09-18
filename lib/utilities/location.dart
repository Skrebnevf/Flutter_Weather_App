import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .timeout(Duration(seconds: 30));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw 'Somthing wrong :( $e';
    }
  }
}
