import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';


class MicTask extends StatefulWidget {
  const MicTask({Key? key}) : super(key: key);
  
  @override
  _MicTaskState createState() => _MicTaskState();
}

class _MicTaskState extends State<MicTask> {

  late stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;
  String _text = ' ';
  String test = 'say something';    //array with strings and choose random?
 
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

 

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        //onStatus: (val) => print('onStatus: $val'),
        //onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(microseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,  
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        )
      ),
      body:
      Container(
        child: Center(
         child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Text (
                //quote
                test,
              ),
              if (test == _text) ... [
                SingleChildScrollView(
                 reverse: true,
                 child: Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                  child: Text('correct'),
                )
               )
               
               //navigate to another screen
              ]
              else ... [
                SingleChildScrollView(
                 reverse: true,
                 child: Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                  child: Text('try again'),
                )
               )
                
              ],
             
            ]
             
          ),
        )
      )
    );

  }
   
}


