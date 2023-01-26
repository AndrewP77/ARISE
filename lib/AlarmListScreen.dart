import 'dart:ui';

import 'package:arise/LightTask.dart';
import 'package:arise/MathTask.dart';
import 'package:arise/MicTask.dart';
import 'package:flutter/cupertino.dart';

import 'AlarmInfo.dart';
import 'package:arise/SettingsScreen.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'EditAlarm.dart';
import 'package:flutter/material.dart';

class AlarmListScreenWidget extends StatefulWidget {
  const AlarmListScreenWidget({Key? key}) : super(key: key);

  @override
  _AlarmListScreenWidgetState createState() => _AlarmListScreenWidgetState();
}

class _AlarmListScreenWidgetState extends State<AlarmListScreenWidget> {
  @override
  Widget build(BuildContext context) {
    AlarmInfo tempAlarm;
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
            .secondaryContainer, //const Color.fromRGBO(25, 28, 26, 1),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Points & Stats'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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
      body: ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index) {
            final alarm = alarms[index];
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
                  key: Key(alarm.getTitle),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      setState(() {
                        alarms.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Alarm dismissed')));
                    }
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
                            colors: alarm.gradientColors,
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
                                          .format(alarm.alarmDateTime)
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
                                    value: alarm.isActive,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        alarm.isActive = newValue;
                                      });
                                    }),
                                Text('Challenges: ${alarm.difficulty}')
                              ],
                            )
                          ]
                      )
                  )
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () => {
          tempAlarm = AlarmInfo(DateTime.now()),
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
}
