import 'package:designs/models/models.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';

import '../provider/weather_provider.dart';
import 'widgets.dart';

class BaseScreen extends StatelessWidget {
  final now = Jiffy();
  late final Future<LocationData> _futurePosition;

  BaseScreen({
    Key? key,
  }) : super(key: key) {
    _futurePosition = _getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LocationData>(
      future: _futurePosition,
      builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            if (snapshot.hasData)
              TemperatureText(
                  latitude: snapshot.data!.latitude,
                  longitude: snapshot.data!.longitude),
            const SizedBox(
              height: 15,
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
      },
    );
  }

  Future<LocationData> _getPosition() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return _futurePosition;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return _futurePosition;
      }
    }

    return await location.getLocation();
  }
}
