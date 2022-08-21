import 'dart:core';

import 'package:designs/models/weather.dart';
import 'package:designs/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [_Background(), _BaseScreen()],
      ),
    );
  }
}

class _BaseScreen extends StatefulWidget {
  const _BaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<_BaseScreen> {
  final WeatherProvider weatherProvider = const WeatherProvider();
  late Future<Weather> futureWeather;
  final now = Jiffy();

  @override
  void initState() {
    super.initState();
    futureWeather = weatherProvider.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        _TemperatureText(futureWeather: futureWeather),
        const SizedBox(
          height: 30,
        ),
        Text(
          now.EEEE,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),
        const Icon(
          Icons.keyboard_arrow_down,
          size: 100,
          color: Colors.white,
        )
      ],
    );
  }
}

class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
    Key? key,
    required this.futureWeather,
  }) : super(key: key);

  final Future<Weather> futureWeather;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: futureWeather,
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

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: const Image(
        image: AssetImage('assets/scroll-1.png'),
        alignment: Alignment.topCenter,
        height: double.infinity,
      ),
    );
  }
}
