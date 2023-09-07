import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:location/location.dart';

class TrackGuiDisplay extends StatefulWidget {
  @override
  _TrackGuiDisplayState createState() => _TrackGuiDisplayState();
}

class _TrackGuiDisplayState extends State<TrackGuiDisplay> {
  double? speed;
  double? gx;
  double? gy;
  double? gz;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        gx = event.x;
        gy = event.y;
        gz = event.z;
      });
    });
    _getLocation();
  }

  _getLocation() async {
    var location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      speed = _locationData.speed!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Speed: ${speed ?? 'Fetching'} m/s'),
        Text('Gx: ${gx ?? 'Fetching'}'),
        Text('Gy: ${gy ?? 'Fetching'}'),
        Text('Gz: ${gz ?? 'Fetching'}'),
      ],
    );
  }
}
