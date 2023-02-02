import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';
import 'GreetingScreen.dart';

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
  int th = 15;
  RadialGradient background = const RadialGradient(colors: [Colors.grey, Colors.white38]);
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
            background = RadialGradient(colors: const [Colors.white, Colors.amber], radius: 0.7);
            Message = 'Success!';
            _luximage = 'Lamp_on.png';
            Future.delayed(Duration(seconds: delayAfterCompletion), () async {
              Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => GreetingScreen()),
          );
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
    return Container(
        decoration: BoxDecoration(gradient: background),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Message, style: Theme.of(context).textTheme.displaySmall,),
            Image.asset('assets/images/$_luximage'),
          ],
        ),
    );
  }
}