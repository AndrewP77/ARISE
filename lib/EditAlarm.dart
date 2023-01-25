import 'AlarmInfo.dart';

import 'CustomForm.dart';
import 'TaskSelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class EditAlarmWidget extends StatefulWidget {
  EditAlarmWidget(this.alarm, {super.key});
  final AlarmInfo alarm;

  @override
  _EditAlarmWidgetState createState() => _EditAlarmWidgetState(alarm);
}

class _EditAlarmWidgetState extends State<EditAlarmWidget> {
  final AlarmInfo tempAlarm;
  _EditAlarmWidgetState(this.tempAlarm);
  //final tempAlarm = AlarmInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Alarm'),
        centerTitle: true,
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.done),
            tooltip: 'Save Alarm',
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          TimePickerSpinner(
            time: tempAlarm.alarmDateTime,
              normalTextStyle: TextStyle(
                  fontSize: 24, color: Theme.of(context).highlightColor),
              highlightedTextStyle:
                  TextStyle(fontSize: 24, color: Colors.white),
              alignment: Alignment.center,
              is24HourMode: true,
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange: (time) {}
        /*
                  setState(() {
                    _dateTime = time;
                  }

         */
              ),
          ListTile(
              title: Text('Label'),
              subtitle: Text(tempAlarm.title),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    context: context,
                    builder: (context) => Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Add alarm label',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const CustomForm(),
                              ],
                            ),
                          ),
                        )));
              }),
          const Divider(),
          ListTile(
              title: Text('Alarm Sound'),
              subtitle: Text('text'),
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
                          child: ListView(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 16),
                              children: List.generate(15, (index) {
                                return ListTile(title: Text('Item $index'));
                              })));
                    });
              }),
          const Divider(),
          ListTile(
              title: Text('Repeat'),
              subtitle: Text(tempAlarm.daysActive),
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
                                title: Text("Once"),
                                onTap: () {
                                  setState(() {
                                    tempAlarm.daysActive = 'Once';
                                    Navigator.pop(context);
                                  });
                                  },
                              ),
                              ListTile(
                                title: Text("Daily"),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text("Monday to Friday"),
                                onTap: () {},
                              ),
                              ListTile(
                                title: Text("Custom"),
                                onTap: () {},
                              )
                            ],
                          )));
                    });
              }),
          const Divider(),
          ListTile(
              title: Text('Challenges'),
              subtitle: Text('text'),
              trailing: Icon(Icons.arrow_right),
              onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TaskSelectionWidget()))
                  })
        ],
      ),
    );
  }
}
