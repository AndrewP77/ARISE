import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';

//lamp_off same size as lamp_on
//added success message
//screen transition 2 seconds after task completion

class LightTask extends StatefulWidget {
  const LightTask({Key? key}) : super(key: key);
  
  @override
  _LightTaskState createState() => _LightTaskState();
}


class _LightTaskState extends State<LightTask> {
  int delayAfterCompletion = 2;
  String Message = 'Turn the light on!';
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
            Message = 'Success!';
            _luximage = 'Lamp_on.png';
            Future.delayed(Duration(seconds: delayAfterCompletion), () async {
              Navigator.of(context).pop();
            });
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
            Text(Message),
            Image.asset('assets/images/$_luximage'),
          ],
        ),
      ),
    );
  }
}