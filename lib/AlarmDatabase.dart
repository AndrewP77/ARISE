import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'AlarmInfo.dart';

const String tableAlarm = 'alarm_t';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnDateTime = 'alarmDateTime';
const String columnActive = 'isActive';
const String columnDifficulty = 'difficulty';
const String columnDays = 'daysActive';
const String columnVibration = 'vibration';
const String columnRingtone = 'ringtone';


class Gradients {
  static const List<Color> neutral = [Color(0xff636c77), Color(0x0f636c77)];
  static List<Color> easy = [const Color(0xff30C8B6), const Color(0x0fffb463)];
  static List<Color> medium = [const Color(0xffffa738), const Color(0x0fDAf61f)];
  static List<Color> hard = [const Color(0xffDA0610), const Color(0x0fff8484)];
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
List<Widget> difficultyWidgets = [const Text('Easy'), const Text('Medium'), const Text('Hard')];
List<bool> selectedDifficulties = [true, false, false];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)), title: 'test', isActive: 'true', daysActive: Days.getFormatted([0, 2, 4], compact: true)),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)), title: 'test easy', difficulty: 'Easy'),
  AlarmInfo(DateTime.now().add(const Duration(hours: 3)), title: 'test med', difficulty: 'Medium'),
  AlarmInfo(DateTime.now().add(const Duration(hours: 4)), title: 'test hard', difficulty: 'Hard')
];

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    _alarmHelper ??= AlarmHelper._createInstance();
    return _alarmHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = "${dir}alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnTitle text not null,
          $columnActive string,
          $columnDateTime text not null,
          $columnDifficulty string,
          $columnRingtone text,
          $columnVibration string,
          $columnDays string
          )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await database;
    var result = await db.insert(tableAlarm, alarmInfo.toMap());
    if (kDebugMode) {
      print('result : $result');
    }
  }


  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = alarms;
    var db =  await database;
    var result = await db.query(tableAlarm);
    for (var element in result) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    }

    return _alarms;
  }

  Future<int> delete(int? id) async {
    var db = await database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}