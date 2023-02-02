import 'package:flutter/material.dart';
import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'data.dart';
import 'GreetingScreen.dart';

class MicTask extends StatefulWidget {
  const MicTask({Key? key}) : super(key: key);
  
  @override
  _MicTaskState createState() => _MicTaskState();
}

class _MicTaskState extends State<MicTask> {
  int delayAfterCompletion = 2;
  late stt.SpeechToText _speech;
  bool _done = false;
  bool _isListening = false;
  //double _confidence = 1.0;
  String _recognizedText = ' ';
  String message = '';
  late String referenceText;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    referenceText = removePunctuation((tongueTwisters..shuffle()).first);
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
          // partialResults: false,
          onResult: (val) => setState(() {
            _recognizedText = val.recognizedWords.toLowerCase();
            if (referenceText == _recognizedText) {
              setState(() {
                _done = true;
                message = 'Correct!';
                _speech.stop();
                _isListening = false;
              });
            }
            _route();
            // if (val.hasConfidenceRating && val.confidence > 0) {
            //   _confidence = val.confidence;
            // }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
    // setState(() {
    //   _done = true;
    //   _route();
    // });
  }
  
  void _route() async{
   if(_done) {
      if (referenceText == _recognizedText) {
        setState(() {
          message = 'Correct!';
          _speech.stop();
          _isListening = false;
        });
       Future.delayed(Duration(seconds: delayAfterCompletion), () async {
              Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => GreetingScreen()),
          );
              //TODO: pressing back in greeting screen returns you here
            });
      }}
      else {
        setState(() {
          message = 'Try again...';
          //_speech.stop();
          //_isListening = false;
        });
               //  SingleChildScrollView(
               //   reverse: true,
               //   child: Container(
               //    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
               //    child: Text('try again'),
               //  )
               // );
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
          onPressed: () {_recognizedText =''; _listen();},
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        )
      ),
      body: Center(
       child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Say:', style: Theme.of(context).textTheme.titleMedium,),
            const Divider(indent: 150, endIndent: 150,),
            Text (referenceText, style: Theme.of(context).textTheme.titleLarge,),
            Text(message),
            Text('Recognized text: $_recognizedText'),
            //Text('Reference text: $referenceText'),
          ]
        ),
      )
    );
  }

  removePunctuation(String str) {
    return str.toLowerCase()
        .replaceAll("?", "")
        .replaceAll("'", "")
        .replaceAll(",", "")
        .replaceAll(".", "")
        .replaceAll("!", "");
  }
}


