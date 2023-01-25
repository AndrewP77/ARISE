import 'AlarmInfo.dart';
import 'package:arise/AlarmInstance.dart';
import 'package:arise/SettingsScreen.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'EditAlarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmListScreenWidget extends StatefulWidget {
  const AlarmListScreenWidget({Key? key}) : super(key: key);

  @override
  _AlarmListScreenWidgetState createState() => _AlarmListScreenWidgetState();
}

class _AlarmListScreenWidgetState extends State<AlarmListScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(1, 26, 28, 25),
      appBar: AppBar(
        title: const Text('Alarms'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25)
            )
        ),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()))
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: alarms.map((alarm) {
          return GestureDetector(
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditAlarmWidget(alarm)))
            },
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
                          Text(DateFormat.Hm().format(alarm.alarmDateTime).toString(), style: Theme.of(context).textTheme.headlineSmall),
                          //Text(hour.toString().padLeft(2, '0') + ':' + minute.toString().padLeft(2, '0'), style: Theme.of(context).textTheme.headlineSmall),
                          Text(alarm.title, style: Theme.of(context).textTheme.bodyMedium),
                          Text(alarm.daysActive, style: Theme.of(context).textTheme.bodyMedium),
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
                            }
                        ),
                        //Text('Challenges: $difficulty')
                      ],
                    )
                  ]))
          );
        }).toList(),
    //List.generate(5, (index) {
          //return AlarmInstanceWidget('Alarm $index', index, index, 'Once', 'None', true);
        //}),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditAlarmWidget(AlarmInfo(DateTime.now()))))
        },
        tooltip: 'Add Alarm',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
