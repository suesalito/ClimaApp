import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getLocation() async {
  // Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high) will return Future<Postion>
  // so when you use await that means you want to confirm to wait for the real result position so that you can use
  // Position Class to receive the value out of the function
  // if no await is definded, you will have to use Future<Postion> to get the return value of the function instead.
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  print(position);
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            //Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
