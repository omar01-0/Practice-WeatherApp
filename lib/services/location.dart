import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  GeolocationStatus status;

  Location({this.latitude, this.longitude});

  Geolocator locate = Geolocator();

  Future getLocationData() async {
    locate.forceAndroidLocationManager = true;
    try {
      Position position = await locate.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Failed to get Location Data');
    }
  }

  Future checkGps() async {
    if (await Geolocator().isLocationServiceEnabled()) {
      status = GeolocationStatus.granted;
    } else
      status = GeolocationStatus.denied;

    print(status);
  }

  void updateStatus(GeolocationStatus statusi) {
    if (status != statusi) status = statusi;
  }
}
