import 'package:flutter/material.dart';

//TODO: pass text/info
class AlarmInstanceWidget extends StatefulWidget {
  String alarmTitle = '',
      alarmTime = '00:00',
      alarmDays = 'Once',
      alarmDifficulty = 'None';
  AlarmInstanceWidget(String title, time, days, difficulty, {super.key}) {
    alarmTitle = title;
    alarmTime = time;
    alarmDays = days;
    alarmDifficulty = difficulty;
  }

  @override
  _AlarmInstanceWidgetState createState() => _AlarmInstanceWidgetState(
      alarmTitle, alarmTime, alarmDays, alarmDifficulty);
}

class _AlarmInstanceWidgetState extends State<AlarmInstanceWidget> {
  String title, time, days, difficulty;
  _AlarmInstanceWidgetState(this.title, this.time, this.days, this.difficulty);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff636c77), Color(0x00636c77)],
              ),
              //color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(23)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(12),
          //color: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            Column(children: [
              Text(time, style: Theme.of(context).textTheme.headlineSmall),
              Text(title, style: Theme.of(context).textTheme.headlineSmall)
            ])
          ])),
    );
  }
}
