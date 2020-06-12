import 'package:geolocator/geolocator.dart';

class Location {
  // comment since it is not private.
  // double = latitude;
  // double = longtitude;
  double _latitude;
  double _longtitude;

  //Location({this.latitude,this.longtitude});
  Future<void> getLocation() async {
    // Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high) will return Future<Postion>
    // so when you use await that means you want to confirm to wait for the real result position so that you can use
    // Position Class to receive the value out of the function
    // if no await is definded, you will have to use Future<Postion> to get the return value of the function instead.
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      _longtitude = position.longitude;
      //print(position);
      //print('test');
    } catch (e) {
      print(e);
    }

    //print(position);
  }

  Map<String, double> getPosition() {
    return {'Lat': _latitude, 'Long': _longtitude};
  }
}
