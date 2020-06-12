import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// void getLocationWeather() async {
//   String apiKey = 'c903578cf82d51468f45557051daa474';
//   double lat = location.getPosition()['Lat'];
//   double long = location.getPosition()['Long'];

//   print('$lat --- $long');
//   print('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
//   http.Response response =
//       await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

//   if (response.statusCode == 200) {
//     print(response.body);
//     String data = response.body;
//     var decodeData = jsonDecode(data);

//     // var dataMain = decodeData['weather'][0]['main'];
//     // var dataCondition = decodeData['weather'][0]['id'];
//     // var dataTemp = decodeData['main']['temp'];
//     // var dataCityName = decodeData['name'];
//     // print(dataMain);
//     // print(dataCityName);
//     // print(dataTemp);
//     // print(dataCondition);
//   } else {
//     print(response.statusCode);
//     print('Cannot get the weather');
//   }
// }

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  void getCurrentLocationData() async {
    await location.getLocation(); // wait until the postion has been returned.

    String apiKey = 'c903578cf82d51468f45557051daa474';
    double lat = location.getPosition()['Lat'];
    double long = location.getPosition()['Long'];

    NetworkHelper networkHelper =
        NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    //getLocationWeather();
    //print(location);
    var weatherData = await networkHelper.getData();
    var cityName = weatherData['name'];
    print(cityName);

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return LocationScreen();
    // }));

    // ** use the PushAndRemoveUntil method instead,
    // since you will not allow use to go back to the previous loading screen.

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    print('x');

    super.initState();
    getCurrentLocationData();
  }

  @override
  Widget build(BuildContext context) {
    //print('=====================');
    //getLocationWeather();
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 120,
      )),
    );
  }
}
