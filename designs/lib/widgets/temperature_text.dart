import 'package:designs/models/models.dart';
import 'package:designs/provider/weather_provider.dart';
import 'package:flutter/material.dart';

class TemperatureText extends StatefulWidget {
  //final Future<Weather> futureWeather;

  final latitude;
  final longitude;
  final WeatherProvider weatherProvider = WeatherProvider();
  late final Future<Weather> _futureWeather;

  TemperatureText(
      {super.key, required this.latitude, required this.longitude}) {
    _futureWeather = weatherProvider.fetchWeather(latitude, longitude);
  }

  @override
  State<TemperatureText> createState() => TemperatureTextState();
}

class TemperatureTextState extends State<TemperatureText> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: widget._futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            '${double.parse((snapshot.data!.main.temp - 273.15).toStringAsFixed(1)).toString()}º',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
