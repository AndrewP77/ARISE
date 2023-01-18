import 'package:flutter/material.dart';


//TODO: pass text/info
class AlarmInstanceWidget extends StatefulWidget {
  const AlarmInstanceWidget({Key? key}) : super(key: key);

  @override
  _AlarmInstanceWidgetState createState() => _AlarmInstanceWidgetState();
}

class _AlarmInstanceWidgetState extends State<AlarmInstanceWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff636c77), Color(0x00636c77)],
          ),
            //color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(23)
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(12),
        //color: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Text('Alarm Instance', style: Theme.of(context).textTheme.headlineSmall,)
      ),
    );
  }
}
