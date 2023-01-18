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
                  fontSize: 24, color: Theme.of(context).highlightColor),
              highlightedTextStyle:
                  TextStyle(fontSize: 24, color: Colors.white),
              alignment: Alignment.center,
              is24HourMode: true,
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange:
                  null /*(time) {
                  setState(() {
                    _dateTime = time;
                  }
                      */
              ),
          ListTile(
              title: Text('Label'),
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
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
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
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
          ListTile(
              title: Text('Repeat'),
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
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
          ListTile(
              title: Text('Challenges'),
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
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}
