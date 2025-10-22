import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/weather_model.dart';

class WeatherServices {
  final String apiKey = '93ca8965bb1cf73394123df2e68b7c6b';

  Future<Weather> featchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Weather Data");
    }
  }
}
