import 'package:arise/LocationField.dart';
import 'package:arise/NameField.dart';
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

      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Settings', style: TextStyle(fontFamily: 'Inter'),),
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back),
      ),
      body:
      ListView(
        padding: EdgeInsets.all(22),
        children: <Widget>[

          ListTile(
            title: Text('Profile', style: TextStyle(fontFamily: 'Inter')),
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
                      height: 300,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Profile',
                              style:
                              Theme.of(context).textTheme.headlineSmall,
                            ),
                            const LocationField(),
                            const NameField(),
                          ],
                        ),
                      ),
                    );
                  });
            }
          ),
          
          Divider(),
          ListTile(
            title: Text('Volume', style: TextStyle(fontFamily: 'Inter')),
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
                              const MyStatefulWidget(),
                            ],
                          ),
                        ),
                      );
                    });
              }
          ),
          const Divider(),
          const ListTile(
            title: Text('Auto-Silence'),
            trailing: Icon(Icons.arrow_right),
          ),
          const Divider(),
          ListTile(
            title: const Text('Contact Us'),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              AlertDialog alert = const AlertDialog(
                title: Text('Contact Us'),
                content: Text('If you have any questions or problems while using ARISE! contact us through the following page: \nhttps://github.com/AndrewP77/ARISE',
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