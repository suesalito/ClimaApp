import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getCurrentLocation() async {
  Location location = Location();
  await location.getLocation(); // wait until the postion has been returned.

  //comment since non-private property can be directly changed. and make the variable in class location as private
  // then crate the get method
  // print(location.latitude);
  // print(location.longtitude);
  // location.latitude = 1;
  // print(location.latitude);
  // print(location.longtitude);

  print(location.getPosition());

  //print(location);
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getCurrentLocation();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            //Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            //getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
