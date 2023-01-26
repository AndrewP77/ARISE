import 'AlarmInfo.dart';
import 'data.dart';
import 'TaskSelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class EditAlarmWidget extends StatefulWidget {
  const EditAlarmWidget(this.alarm, {super.key});
  final AlarmInfo alarm;

  AlarmInfo get getAlarm => alarm;

  @override
  _EditAlarmWidgetState createState() => _EditAlarmWidgetState(alarm);
}

class _EditAlarmWidgetState extends State<EditAlarmWidget> {
  final AlarmInfo alarmInfo;
  _EditAlarmWidgetState(this.alarmInfo);

  late String title = alarmInfo.title;
  late String daysActive = alarmInfo.daysActive;
  late DateTime alarmDateTime = alarmInfo.alarmDateTime;
  late String ringtone = alarmInfo.ringtone;
  late String difficulty = alarmInfo.difficulty;
  late bool vibration = alarmInfo.vibration;
  late List<String> categories = List.from(alarmInfo.categories);
  set setTitle(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
        scrolledUnderElevation: 0,
        title: const Text('Edit Alarm'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                //push all the changes
                alarmInfo.title = title;
                alarmInfo.alarmDateTime = alarmDateTime;
                alarmInfo.daysActive = daysActive;
                alarmInfo.difficulty = difficulty;
                alarmInfo.vibration = vibration;
                alarmInfo.categories = categories;
                alarmInfo.update();
                if (!alarms.contains(alarmInfo)) alarms.add(alarmInfo);
              });
            },
            icon: const Icon(Icons.done),
            tooltip: 'Save Alarm',
          )
        ],
      ),
      body: Column(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          TimePickerSpinner(
              time: alarmDateTime,
              normalTextStyle: TextStyle(
                  fontSize: 24, color: Theme.of(context).highlightColor),
              highlightedTextStyle:
                  TextStyle(fontSize: 24, color: Colors.white),
              alignment: Alignment.center,
              is24HourMode: true,
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange: (time) {
                setState(() {
                  alarmDateTime = time;
                });
              }),
          ListTile(
              title: const Text('Label'),
              subtitle: Text(title),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                var titleController = TextEditingController(text: title);
                //titleController.addListener(() {setState(() {title = titleController.text;});});
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
                  builder: (context) => Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    //child: SizedBox(
                    //height: 300,
                    //child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 50),
                          Text(
                            'Add alarm label',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextFormField(
                            controller: titleController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: ElevatedButton(
                                  //style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      title = titleController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          const Divider(),
          ListTile(
              title: Text('Alarm Sound'),
              subtitle: Text(ringtone),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          //height: 250,
                          child: ListView.builder(
                              //padding: EdgeInsets.zero,
                              //children: alarms.map((alarm) {
                              itemCount: ringtones.length,
                              itemBuilder: (context, index) {
                                final name = ringtones[index];
                                return ListTile(
                                  title: Text(name),
                                  onTap: () {
                                    setState(() {
                                      ringtone = name;
                                      Navigator.of(context).pop();
                                    });
                                  },
                                );
                              }));
                    });
              }),
          const Divider(),
          ListTile(
              title: Text('Repeat'),
              subtitle: Text(alarmInfo.daysActive),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: 250,
                          child: Center(
                              child: ListView(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 16),
                            children: [
                              ListTile(
                                title: const Text("Once"),
                                onTap: () {
                                  setState(() {
                                    alarmInfo.daysActive = 'Once';
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text("Daily"),
                                onTap: () {
                                  setState(() {
                                    alarmInfo.daysActive = Days.getFormatted(
                                        [0, 1, 2, 3, 4, 5, 6],
                                        compact: true);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text("Monday to Friday"),
                                onTap: () {
                                  setState(() {
                                    alarmInfo.daysActive = Days.getFormatted(
                                        [1, 2, 3, 4, 5],
                                        compact: true);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text("Custom"),
                                onTap: () {},
                              )
                            ],
                          )));
                    });
              }),
          const Divider(),
          ListTile(
              title: const Text('Challenges'),
              subtitle: Text(difficulty),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Wrapper w = Wrapper();
                w.difficulty = difficulty;
                w.categories = categories;
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => TaskSelectionWidget(w)))
                    .then((value) {
                  setState(() {
                    categories = w.categories;
                    difficulty = w.difficulty;
                  });
                });
              }),
          const Divider(),
          ListTile(
            title: const Text('Vibration'),
            trailing: Switch(
              value: vibration,
              onChanged: (bool value) {
                setState(() {
                  vibration = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

//used to pass by reference objects that are normally passed by value
//can be expanded to contain other stuff too
class Wrapper {
  String difficulty = '';
  List<String> categories = [];
}
