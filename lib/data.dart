//apo tutorial indou sto yt, idk vlepoume
//"In real application this will be coming from local db"


import 'package:flutter/cupertino.dart';

import 'AlarmInfo.dart';

class Gradients {
  static const List<Color> neutral = [
    Color(0xc2a2b9b5),
    Color(0xBE6F8D98),
  ];
  static List<Color> easy = [
    Color(0xB000C40F),
    Color(0xa5009609)
  ];
  static List<Color> medium = [
    Color(0xb8f18800),
    Color(0xb5c76401)];
  static List<Color> hard = [
    Color(0xC7DA0112),
    Color(0xb8940202)];
}

class Days {
  static List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  
  static String getFormatted(List<int> list, {bool compact = false}) {
    //compact mode returns first 3 letters of each day
    String result='';
    int count = 0;
    for (int element in list) {
      String temp = compact? days[element].substring(0, 3): days[element];
      result += temp + (((++count)!=list.length)? ', ': '');
    }
    return result;
  }
}

List<String> ringtones = [
  'Default',
  'the rest are random',
  'sdjcknsdkmak',
  'asjdchj',
  'sieuifj',
  'soidvnijsdnkjnjn',
  'rurnnnvhfhfn bnv',
  'itgjjvnbn',
  'biigbymnmy',
  'soeifmnmn',
  'oiok8miumj'
];
List<String> difficulties = ['Easy', 'Medium', 'Hard'];
List<Widget> difficultyWidgets = [Text('Easy'), Text('Medium'), Text('Hard')];
List<bool> selectedDifficulties = [true, false, false];

// List<AlarmInfo> alarms = [
//   AlarmInfo(DateTime.now().add(Duration(hours: 1)), title: 'test', daysActive: Days.getFormatted([0, 2, 4], compact: true)),
//   AlarmInfo(DateTime.now().add(Duration(hours: 2)), title: 'test easy', difficulty: 'Easy'),
//   AlarmInfo(DateTime.now().add(Duration(hours: 3)), title: 'test med', difficulty: 'Medium'),
//   AlarmInfo(DateTime.now().add(Duration(hours: 4)), title: 'test hard', difficulty: 'Hard')
// ];