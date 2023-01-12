// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainScreen.dart';


class TitleScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TitleScreen();
  }
}

class _TitleScreen extends State<TitleScreen>{
  int splashtime = 3; 
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context){
              return MainScreen();       
        }
        ));
    }); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
      width: 360,
      height: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xfffff9e7),
      ),
      padding: const EdgeInsets.only(top: 187, bottom: 531, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          SizedBox(
            width: 294,
            height: 52,
            child: Text(
              "ARISE!\n\n",
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
      ),
    );
  }
}