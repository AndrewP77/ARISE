import 'package:arise/MathTask.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RingingAlarmWidget extends StatefulWidget {
  static AudioPlayer player = AudioPlayer();

  @override
  _RingingAlarmWidgetState createState() => _RingingAlarmWidgetState();
}

class _RingingAlarmWidgetState extends State<RingingAlarmWidget> {
  late Gradient background = LinearGradient(colors: [
    Theme
        .of(context)
        .colorScheme
        .primaryContainer,
    Theme
        .of(context)
        .primaryColorDark
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  @override
  Widget build(BuildContext context) {
    RingingAlarmWidget.player.play(AssetSource('sounds/tic_tac.mp3'));
    RingingAlarmWidget.player.setReleaseMode(ReleaseMode.loop);
    return Container(
        decoration: BoxDecoration(gradient: background),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat("HH:mm").format(DateTime.now()),
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
              ),
              Text(DateFormat("dd/MM").format(DateTime.now()),
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge),
              Container(
                  alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //   gradient: const LinearGradient(
                  // begin: Alignment.topLeft,
                  // end: Alignment.bottomRight,
                  // colors: [Color(0xff636c77), Color(0x00636c77)],
                  // ),
                  // borderRadius: BorderRadius.circular(23)),
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(80),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    'Wake up!',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MathTask()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Theme
                    .of(context)
                    .buttonTheme
                    .colorScheme
                    ?.onPrimary),
                child: Text('Start Challenge', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  RingingAlarmWidget.player.setReleaseMode(ReleaseMode.stop);
                  RingingAlarmWidget.player.stop();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Theme
                    .of(context)
                    .errorColor),
                child: Text('Snooze (-10 Points)', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge),
              ),
            ]
        )
    );
  }
}



