import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  NetworkHelper(this.url);

  Future getData() async {
    // http.Response response =
    //     await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      String data = response.body;
      return jsonDecode(data);
      // var dataMain = decodeData['weather'][0]['main'];
      // var dataCondition = decodeData['weather'][0]['id'];
      // var dataTemp = decodeData['main']['temp'];
      // var dataCityName = decodeData['name'];

      // print(dataMain);
      // print(dataCityName);
      // print(dataTemp);
      // print(dataCondition);
    } else {
      print(response.statusCode);
      print('Cannot get the weather');
    }
  }
}
