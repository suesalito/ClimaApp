import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  WeatherModel weatherModel = WeatherModel();
  double temparature;
  String condition;
  String city;
  String weatherMain;
  String message;

  updateUI(dynamic weatherData) {
    weatherMain = weatherData['weather'][0]['main'];
    condition = weatherModel.getWeatherIcon(weatherData['weather'][0]['id']);
    message = weatherModel.getMessage(weatherData['main']['temp'].toInt());
    temparature = weatherData['main']['temp'];
    city = weatherData['name'];

    print(condition);
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(), No need appbar since we will create interface ourselve,
      // and avoid user go back to loading screen.
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      //'32°',
                      '${temparature.toInt().toString()} °', // make it integer then String to display.
                      style: kTempTextStyle,
                    ),
                    Text(
                      //'☀️',
                      '$condition',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  //"It's 🍦 time in San Francisco!", // if you have ' in the text, you will use "" instead.
                  "$message in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// var dataMain = decodeData['weather'][0]['main'];
//     var dataCondition = decodeData['weather'][0]['id'];
//     var dataTemp = decodeData['main']['temp'];
//     var dataCityName = decodeData['name'];
