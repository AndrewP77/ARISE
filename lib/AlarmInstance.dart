import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//TODO: pass text/info
class AlarmInstanceWidget extends StatefulWidget {
  String alarmTitle = '';
  int alarmHour = 0, alarmMinute = 0;
  String alarmDays = 'Once', alarmDifficulty = 'None';
  bool alarmActive = true;
  AlarmInstanceWidget(this.alarmTitle, this.alarmHour, this.alarmMinute,  this.alarmDays,  this.alarmDifficulty,  this.alarmActive, {super.key}) {}

  @override
  _AlarmInstanceWidgetState createState() => _AlarmInstanceWidgetState(
      alarmTitle, alarmHour, alarmMinute, alarmDays, alarmDifficulty, alarmActive);
}

class _AlarmInstanceWidgetState extends State<AlarmInstanceWidget> {
  String title, days, difficulty;
  int hour, minute;
  bool isActive;
  _AlarmInstanceWidgetState(this.title, this.hour, this.minute, this.days, this.difficulty, this.isActive);
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
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(hour.toString().padLeft(2, '0') + ':' + minute.toString().padLeft(2, '0'), style: Theme.of(context).textTheme.headlineSmall),
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              Text(days, style: Theme.of(context).textTheme.bodyMedium),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Switch(
                    value: isActive,
                    onChanged: (bool newValue) {
                      setState(() {
                        isActive = newValue;
                      });
                    }
                ),
                Text('Challenges: $difficulty')
              ],
            )
          ])),
    );
  }
}
