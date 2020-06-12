import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestLoad extends StatefulWidget {
  @override
  _TestLoadState createState() => _TestLoadState();
}

double latitude;
double longtitude;

Future<void> getLocationTest() async {
  // Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high) will return Future<Postion>
  // so when you use await that means you want to confirm to wait for the real result position so that you can use
  // Position Class to receive the value out of the function
  // if no await is definded, you will have to use Future<Postion> to get the return value of the function instead.
  //try {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  latitude = position.latitude;
  longtitude = position.longitude;
  print(position);
  print('test');
  //} catch (e) {
  //  print(e);
  //}

  //print(position);
}

class _TestLoadState extends State<TestLoad> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print('1');
    (() async {
      print('1');
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longtitude = position.longitude;
      print(position);
      print('test');
    })();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('2');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('3');
    return Container();
  }
}
