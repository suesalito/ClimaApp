import 'package:clima/services/location.dart';

import 'package:clima/services/networking.dart';

class WeatherModel {
  getWeatherdata() async {
    Location location = Location();
    await location.getLocation(); // wait until the postion has been returned.

    String apiKey = 'c903578cf82d51468f45557051daa474';
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=';
    double lat = location.getPosition()['Lat'];
    double long = location.getPosition()['Long'];

    NetworkHelper networkHelper =
        // make it shorter by sending object thu ${nameofthefield}
        //NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');
        NetworkHelper(
            '$apiUrl${location.getPosition()['Lat']}&lon=${location.getPosition()['Long']}&appid=$apiKey&units=metric');
    //getLocationWeather();
    //print(location);
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
