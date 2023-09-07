import 'package:flutter/material.dart';
import 'screens/track_gui_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Enthusiast App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Enthusiast Assistant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackGuiScreen()),
                );
              },
              child: Text('Track Day'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigation for other option
              },
              child: Text('Another Feature'),
            ),
          ],
        ),
      ),
    );
  }
}
