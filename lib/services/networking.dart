import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future<dynamic> getData() async {
    print('URL : $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String weatherData = response.body;
      var decodedWeatherData = jsonDecode(weatherData);
      return decodedWeatherData;
    } else {
      print('failed to load data');
    }
  }
}
