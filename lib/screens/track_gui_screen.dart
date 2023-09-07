import 'dart:math';
import 'package:flutter/material.dart';
import 'package:car_enthusiast/widgets/track_gui_header.dart';
import 'package:car_enthusiast/widgets/track_gui_display.dart';
import 'package:car_enthusiast/widgets/settings_modal.dart';

class TrackGuiScreen extends StatefulWidget {
  @override
  _TrackGuiScreenState createState() => _TrackGuiScreenState();
}

class _TrackGuiScreenState extends State<TrackGuiScreen> {
  double currentSpeed = 0;
  String speedUnit = 'KPH';
  String customTrackName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track GUI'),
      ),
      body: Stack(
        children: [
          // This will be the camera feed or solid color
          Container(color: Colors.grey),
          Column(
            children: <Widget>[
              TrackGuiHeader(),
              Text(
                  'Speed: ${convertSpeedUnit(currentSpeed).toStringAsFixed(2)} $speedUnit'),
              DropdownButton<String>(
                value: speedUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    speedUnit = newValue!;
                  });
                },
                items: <String>['KPH', 'MPH']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    customTrackName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Custom Track Name",
                ),
              ),
              Text("Selected Track: $customTrackName"),
              TrackGuiDisplay(),
              ElevatedButton(
                child: Text('Settings'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SettingsModal();
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  double convertSpeedUnit(double speedInMs) {
    if (speedUnit == 'KPH') {
      return speedInMs * 3.6;
    } else if (speedUnit == 'MPH') {
      return speedInMs * 2.23694;
    } else {
      return speedInMs;
    }
  }
}
