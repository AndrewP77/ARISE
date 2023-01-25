import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';

class LightTask extends StatefulWidget {
  const LightTask({Key? key}) : super(key: key);
  
  @override
  _LightTaskState createState() => _LightTaskState();
}


class _LightTaskState extends State<LightTask> {
  late Light _light;
  late StreamSubscription _subscription;
  String _luximage = 'Lamp_off.png';
  int th = 500;

  void stopListening() {
    _subscription.cancel();
  }

  void startListening() {
    _light = Light();

    _subscription = _light.lightSensorStream.listen((element) {
        var value = element;

        if (value > th) {
          stopListening();
          setState(() {
          _luximage = 'Lamp_on.png';
          });

        }
        else {
          setState(() {
            _luximage = 'Lamp_off.png';
          });
        }
      });
      
  }


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Turn the light on!'),
            Image.asset('assets/images/$_luximage'),
          ],
        ),
      ),
    );
  }
}