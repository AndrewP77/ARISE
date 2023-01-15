import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class EditAlarmWidget extends StatefulWidget {
  const EditAlarmWidget({Key? key}) : super(key: key);

  @override
  _EditAlarmWidgetState createState() => _EditAlarmWidgetState();
}

class _EditAlarmWidgetState extends State<EditAlarmWidget> {
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
              normalTextStyle: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).highlightColor
              ),
              highlightedTextStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.white
              ),
              alignment: Alignment.center,
              is24HourMode: true,
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange: null /*(time) {
                  setState(() {
                    _dateTime = time;
                  }
                      */
              ),
          const ListTile(
            title: Text('Label'),
            subtitle: Text('text'),
            trailing: Icon(Icons.arrow_right),
          ),
          const ListTile(
            title: Text('Alarm Sound'),
            subtitle: Text('text'),
            trailing: Icon(Icons.arrow_right),
          ),
          const ListTile(
            title: Text('Repeat'),
            subtitle: Text('text'),
            trailing: Icon(Icons.arrow_right),
          ),
          const ListTile(
            title: Text('Challenges'),
            subtitle: Text('text'),
            trailing: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
