import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
      }
    }
    
class _SettingsScreen extends State<SettingsScreen>{
  // var _currentSliderValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontFamily: 'Inter'),),
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Profile'),
            trailing: Icon(Icons.arrow_right),
          ),
          Divider(),
          ListTile(
            title: Text('Volume'),
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
                        height: 150,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Control Volume',
                                style: Theme.of(context).textTheme.titleLarge,),
                              MyStatefulWidget(),
                            ],
                          ),
                        ),
                      );
                    });
              }
          ),
          Divider(),
          ListTile(
            title: Text('Auto-Silence'),
            trailing: Icon(Icons.arrow_right),
          ),
          Divider(),
          ListTile(
            title: const Text('Contact Us'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              AlertDialog alert = AlertDialog(
                title: const Text('Contact Us'),
                content: const Text('If you have any questions or problems while using ARISE! contact us through the following page: \nhttps://github.com/AndrewP77/ARISE',
                
                ),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          ),
          Divider(),
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              AlertDialog alert = AlertDialog(
                title: Text('About'),
                content: Text('ARISE! version 1.1. \nThe latest version is installed. \nMIT license. \n'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

  
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// private State class that goes with MyStatefulWidget
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static int _currentSliderValue = 40;
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        children: <Widget>[
          Slider(
            value: _currentSliderValue.toDouble(),
            min: 0,
            max: 100,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            },
          ),
          Text(_currentSliderValue.round().toString() + '%'),
        ],
      ),
    );
  }
}