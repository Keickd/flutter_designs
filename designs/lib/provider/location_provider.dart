import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends StatelessWidget {
  const LocationProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<LocationPermission> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    return permission;
  }

  Future<Position> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
