import 'package:designs/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends StatelessWidget {
  const WeatherProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('WeatherProvider'),
      ),
    );
  }

  Future<Weather> fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=41&lon=-0.8&appid=5e22eb0700e2225ae27d5ac7923abbf7'),
    );
    if (response.statusCode == 200) {
      return Weather.fromJson(response.body);
    } else {
      throw Exception('Failed to get weather data');
    }
  }
}
