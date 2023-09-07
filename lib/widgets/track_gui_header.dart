import 'package:flutter/material.dart';

class TrackGuiHeader extends StatefulWidget {
  @override
  _TrackGuiHeaderState createState() => _TrackGuiHeaderState();
}

class _TrackGuiHeaderState extends State<TrackGuiHeader> {
  String? selectedTrack;
  List<String> mockTracks = [
    'Track A',
    'Track B',
    'Track C',
    // ... Add more mock tracks
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter Track Name',
          ),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          hint: Text('Select a track'),
          value: selectedTrack,
          items: mockTracks.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedTrack = newValue;
            });
          },
        )
      ],
    );
  }
}
