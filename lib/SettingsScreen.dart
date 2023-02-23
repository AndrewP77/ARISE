import 'package:arise/LocationField.dart';
import 'package:arise/NameField.dart';
import 'package:flutter/material.dart';
import 'package:arise/AlarmDatabase.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen> {
  static const List<String> silence_min = [
    '3 minutes',
    '5 minutes',
    '8 minutes'
  ];
  // var name = DatabaseHelper.instance.getProfile();
  Profile profile = Profile(name: 'hi', id: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Settings',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: <Widget>[
          FutureBuilder(
              future: DatabaseHelper.instance.getProfile(),
              builder: (context, snapshot) {
                return ListTile(
                    title: const Text('Profile'),
                    // subtitle: Text('your name'),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      var nameController = TextEditingController(
                          text: snapshot.data!.isEmpty
                              ? 'enter'
                              : snapshot.data!.first.name);
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0))),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: FutureBuilder(
                                  future: DatabaseHelper.instance.getProfile(),
                                  builder: (context, snapshot) {
                                    return Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const SizedBox(height: 50),
                                            Text(
                                              'Profile',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            TextFormField(
                                              controller: nameController,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16.0),
                                                  child: ElevatedButton(
                                                    //style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).errorColor),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 16.0,
                                                      horizontal: 16.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        profile.name =
                                                            nameController.text;
                                                        profile.id = 1;
                                                        DatabaseHelper.instance
                                                            .updateProfile(
                                                                profile);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ));
                                  },
                                ),
                              ));
                    });
              }),
          const Divider(),
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
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const MyStatefulWidget(),
                            ],
                          ),
                        ),
                      );
                    });
              }),
          const Divider(),
          ListTile(
              title: const Text("Auto-Silence"),
              trailing: const Icon(Icons.arrow_right),
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
                              child: ListView(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 16),
                            children: [
                              ListTile(
                                title: const Text("3 minutes"),
                                onTap: () {
                                  setState(() {
                                    // alarmInfo.daysActive = 'Once';
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text("5 minutes"),
                                onTap: () {
                                  setState(() {
                                    // alarmInfo.daysActive = Days.getFormatted(
                                    //      [0, 1, 2, 3, 4, 5, 6],
                                    //      compact: true);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text("8 minutes"),
                                onTap: () {},
                              )
                            ],
                          )));
                    });
              }),
          const Divider(),
          ListTile(
              title: const Text('Contact Us'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                AlertDialog alert = const AlertDialog(
                  title: Text('Contact Us'),
                  content: Text(
                    "Don't",
                  ),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }),
          Divider(),
          ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text('About'),
                  content: Text(
                      'ARISE! version 1.1. \nThe latest version is installed. \nMIT license. \n'),
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
              }),
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
