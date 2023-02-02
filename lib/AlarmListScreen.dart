import 'package:arise/LightTask.dart';
import 'package:arise/MathTask.dart';
import 'package:arise/MicTask.dart';
import 'package:arise/PointsScreen.dart';

//import 'package:timezone/data/latest.dart' as tz;

import 'package:arise/AlarmDatabase.dart';
import 'SettingsScreen.dart';
import 'package:intl/intl.dart';
import 'EditAlarm.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class AlarmListScreenWidget extends StatefulWidget {
  const AlarmListScreenWidget({Key? key}) : super(key: key);

  @override
  _AlarmListScreenWidgetState createState() => _AlarmListScreenWidgetState();
}

class _AlarmListScreenWidgetState extends State<AlarmListScreenWidget> {
  @override
  void initState() {
    super.initState();
    //tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    Alarm tempAlarm;
    return Scaffold(
      //backgroundColor: const Color.fromARGB(1, 26, 28, 25),
      appBar: AppBar(
          title: const Text('Alarms'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)))
          //backgroundColor: Colors.transparent,
          ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25))),
        backgroundColor: Theme.of(context)
            .colorScheme
            .secondaryContainer,
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Points & Stats'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PointsWidget()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsScreen()))
              },
            ),
            ListTile(
              title: const Text('Light Sensor Task'),
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LightTask()))
              },
            ),
            ListTile(
              title: const Text('Mic Task'),
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MicTask()))
              },
            ),
            ListTile(
              title: const Text('Math Task'),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateEquation()))
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Alarm>>(

            future: DatabaseHelper.instance.getAlarms(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Alarm>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                  child: Text('No alarms!'))
                  : ListView(
                children: snapshot.data!.map((alarm) {
                  return GestureDetector(
                      onTap: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (context) => EditAlarmWidget(alarm)))
                        .then((value) {
                      setState(() {
                        //refresh the page content
                      });
                    })
                  },

                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          DatabaseHelper.instance.remove(alarm.id!);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Alarm dismissed')));
                      },
                      secondaryBackground: Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete),
                      ),
                      background: Container(
                          margin: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.delete)),
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: colorUpdate(alarm.difficulty)
                             ),
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
                                      Text(
                                          DateFormat.Hm()
                                              .format(alarm.alarmDateTime!)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text(alarm.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      Text(alarm.daysActive,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ]),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Switch(
                                        value: alarm.isActive == 1 ? true : false,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            alarm.isActive = newValue == true ? 1 : 0;
                                            DatabaseHelper.instance.update(alarm);
                                          });
                                        }),
                                    Text('Challenges: ${alarm.difficulty}')
                                  ],
                                )
                              ]
                          )
                      )
                  )
                  );
                }).toList(),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () => {
          tempAlarm = Alarm(),
          tempAlarm.isNew = true,
          Navigator.of(context)
              .push(MaterialPageRoute(
              builder: (context) => EditAlarmWidget(tempAlarm)))
              .then((value) {
            setState(() {
              //refresh the page content
            });
          })
        },
        tooltip: 'Add Alarm',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  colorUpdate(difficulty) {
    switch(difficulty) {
      case 'Easy':
        return Gradients.easy;
      case 'Medium':
        return   Gradients.medium;
      case 'Hard':
        return Gradients.hard;
      default:
        return Gradients.neutral; }
  }
}
