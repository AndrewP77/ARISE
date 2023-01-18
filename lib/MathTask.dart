import 'dart:math';
import 'package:flutter/material.dart';

//καθε φορα που κανει λαθος αλλαζει η πραξη δεν καταφερα να μενει η ιδια

class CreateEquation extends StatefulWidget {
  const CreateEquation({Key? key}) : super(key: key);

  @override
  _CreateEquationState createState() => _CreateEquationState();
}

class _CreateEquationState extends State<CreateEquation> {

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
    setState(() {
      double m = max(numbers[0],numbers[1]);
      double n = min(numbers[0],numbers[1]);
        if (m + n == double.parse(value.text) || m - n == double.parse(value.text) || m * n == double.parse(value.text) || m / n == double.parse(value.text) ) {
         

          //go to greeting screen προς το παρον παει σε αλλη πραξη
            

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: const Text('Correct!')
                ),
            );
        }
        else {
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
    }

    });
    value.text = ' ';
  }

  void repeatQuestion() {
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    var eq = list[Random().nextInt(list.length)];
    numbers = pickNumber(difficulty);

    return MaterialApp (
      home: Scaffold(
        //backgroundColor:  Color.fromARGB(255, 26, 136, 90),
        body:
        Container(
          child: Center(
            child: Column(         
            mainAxisAlignment: MainAxisAlignment.center,
            children: [    
              
              Text(
                max(numbers[0],numbers[1]).toString() + ' ' + eq +' ' + min(numbers[0],numbers[1]).toString() + ' = ',
                //style: TextStyle(fontSize: 55, color: Colors.white),
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
        ),
      ),
    );
  }
}
