import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();

Future getCurrentLocationData() async {
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
  @override
  void initState() {
    // TODO: implement initState
    //print('x');
    getCurrentLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('=====================');
    //getLocationWeather();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            //Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            //getLocation();
          },
          child: Text(location.getPosition()['Long'].toString()),
        ),
      ),
    );
  }
}
