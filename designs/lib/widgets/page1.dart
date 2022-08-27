import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import 'widgets.dart';

class Page1 extends StatelessWidget {
  Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        BaseScreen(),
      ],
    );
  }

  // Future<Column> getTemperature() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _currentPosition;
  //   String _address;
  //   Location location = new Location();
  //   final now = Jiffy();
  //   Future<Weather> futureW;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       // return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       // return;
  //     }
  //   }
  //   _currentPosition = await location.getLocation();
  //   futureW =
  //       fetchWeather(_currentPosition.latitude!, _currentPosition.longitude!);

  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       const SizedBox(
  //         height: 100,
  //       ),
  //       TemperatureText(futureWeather: futureW),
  //       const SizedBox(
  //         height: 15,
  //       ),
  //       Text(
  //         now.EEEE,
  //         style: const TextStyle(
  //           fontSize: 40,
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       Expanded(child: Container()),
  //       const Icon(
  //         Icons.keyboard_arrow_down,
  //         size: 100,
  //         color: Colors.white,
  //       )
  //     ],
  //   );
  // }

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${latitude.toDouble()}&lon=${longitude.toDouble()}&appid=5e22eb0700e2225ae27d5ac7923abbf7'),
    );
    if (response.statusCode == 200) {
      return Weather.fromJson(response.body);
    } else {
      throw Exception('Failed to get weather data');
    }
  }
}
