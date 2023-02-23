import 'dart:math';
import 'package:arise/RingingAlarm.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'GreetingScreen.dart';
import 'package:arise/RingingAlarm.dart';

//καθε φορα που κανει λαθος αλλαζει η πραξη δεν καταφερα να μενει η ιδια

class MathTask extends StatefulWidget {
  const MathTask({Key? key}) : super(key: key);

  @override
  _MathTaskState createState() => _MathTaskState();
}

class _MathTaskState extends State<MathTask> {
  int delayAfterCompletion = 2;
  var list = ['+', '-', '*', '/'];
  var difficulty = 'easy';  //πρεπει να τεθει απο αλλο αρχειο

  List<double> pickNumber(String diff) {
    if (diff == 'easy') {
      return [Random().nextInt(20) + 1, Random().nextInt(20) + 1];
    }
    else if (diff == 'medium') {
      return [Random().nextInt(40) + 1, Random().nextInt(40) + 1];
    }
    else{
      return [Random().nextInt(70) + 1, Random().nextInt(70) + 1];
    }
  }

  final value = TextEditingController();
  late List<double> numbers;

  void saveButton(numbers) {
      double m = max(numbers[0],numbers[1]);
      double n = min(numbers[0],numbers[1]);
        if (m + n == double.parse(value.text) || m - n == double.parse(value.text) || m * n == double.parse(value.text) || m / n == double.parse(value.text) ) {
         

          //go to greeting screen

        Future.delayed(Duration(seconds: delayAfterCompletion), () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => GreetingScreen())
          );
            });
        RingingAlarmWidget.player.setReleaseMode(ReleaseMode.stop);
        RingingAlarmWidget.player.stop();
        setState(() {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                    title: const Text('Correct!')
                ),
          );
        });
        }
        else {
          setState(() {
         showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 50,
                width:50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sorry try again',
                    ),

                    GestureDetector(
                      onTap: repeatQuestion,
                      child: Icon(Icons.rotate_left)
                    )
                  ]
                )
              ),
            );
          });
          });
    }


    value.text = ' ';
  }

  void repeatQuestion() {
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    var eq = list[Random().nextInt(list.length)];
    numbers = pickNumber(difficulty);

    return Scaffold(
        //backgroundColor:  Color.fromARGB(255, 26, 136, 90),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Solve the equation!', style: Theme.of(context).textTheme.titleMedium),
            const Divider(indent: 150, endIndent: 150,),
            Text(
              max(numbers[0],numbers[1]).toString() + ' ' + eq +' ' + min(numbers[0],numbers[1]).toString() + ' = ?',
              style: Theme.of(context).textTheme.displayMedium,
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(constraints:BoxConstraints.tight(const Size(200,50)),
                  child: TextFormField(
                   // style: TextStyle(fontSize: 35, color: Colors.white),
                    controller: value,
                  ),
                  )
                  ),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.done),
                    onPressed: () => saveButton(numbers),
                  ),
                  )
                ]
                ),
              ),
          ],
          ),
        ),

      
    );
  }
}
