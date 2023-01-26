//apo tutorial indou sto yt, idk vlepoume
//"In real application this will be coming from local db"

import 'dart:ui';

import 'AlarmInfo.dart';

class Gradients {
  static const List<Color> neutral = [Color(0xff636c77), Color(0x0f636c77)];
  static List<Color> easy = [Color(0xff30C8B6), Color(0x0fffb463)];
  static List<Color> medium = [Color(0xffffa738), Color(0x0fDAf61f)];
  static List<Color> hard = [Color(0xffDA0610), Color(0x0fff8484)];
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

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), title: 'test', daysActive: Days.getFormatted([0, 2, 4], compact: true)),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), title: 'test easy', difficulty: 'Easy'),
  AlarmInfo(DateTime.now().add(Duration(hours: 3)), title: 'test med', difficulty: 'Medium'),
  AlarmInfo(DateTime.now().add(Duration(hours: 4)), title: 'test hard', difficulty: 'Hard')
];