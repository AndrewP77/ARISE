// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AlarmListScreen.dart';

class TitleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TitleScreen();
  }
}

class _TitleScreen extends State<TitleScreen> {
  int splashTime = 1;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashTime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return const AlarmListScreenWidget();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xfffff9e7),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(
                  width: 294,
                  height: 52,
                  child: Text(
                    "ARISE!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 126,
                  height: 30,
                  child: Text(
                    "wakey wakey!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )));
  }
}
