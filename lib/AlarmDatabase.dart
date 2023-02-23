

import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'data.dart';


class Alarm {
  int? id;
  DateTime? alarmDateTime;
  String title;
  int isActive;
  int vibration;
  List<Color> gradientColors;
  String daysActive;
  String difficulty;
  String ringtone;
  List<String> categories;
  bool isNew;

  Alarm (
  {
    this.id,
    this.alarmDateTime,
    this.title = 'title',
    this.isActive = 0,
    this.vibration = 1,
    this.daysActive = 'Once',
    this.difficulty = 'None',
    this.gradientColors = Gradients.neutral,
    this.ringtone = 'Default',
    this.categories = const ['none'],
    this.isNew = false,
  });



  factory Alarm.fromMap(Map<String, dynamic> json) => Alarm(
      id: json["id"],
      alarmDateTime: DateTime.parse(json["alarmDateTime"]),
      title: json["title"],
      isActive: json["isActive"],
      difficulty: json["difficulty"],
      daysActive: json["daysActive"],
      ringtone: json["ringtone"],
      vibration: json["vibration"],
      categories: [json["categories"]]
  );
  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "alarmDateTime": alarmDateTime!.toIso8601String(),
    "isActive": isActive,
    "difficulty": difficulty,
    "daysActive": daysActive,
    "ringtone": ringtone,
    "vibration": vibration,
    "categories": categories?.join(', '),
  };
}

class Profile {
  String name;
  int id;

  Profile (
      {
        this.name = 'your name',
        this.id = 1,
      });

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
  );
  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
  };
}


class Points {
  int total_points;
  int streak;
  int id;

  Points (
      {
        this.total_points = 265,
        this.id = 1,
        this.streak = 4
      });

  factory Points.fromMap(Map<String, dynamic> json) => Points(
    id: json["id"],
    total_points: json["total_points"],
    streak: json["streak"]
  );
  Map<String, dynamic> toMap() => {
    "total_points": total_points,
    "streak": streak,
    "id": id,
  };
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'arise7.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alarm_table(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          alarmDateTime STRING,
          isActive INT,
          difficulty STRING,
          daysActive TEXT,
          ringtone TEXT,
          vibration INT,
          categories TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE points_table (
          id INT PRIMARY KEY,
          total_points INT,
          streak INT
      )
      ''');
    await db.execute('''
      CREATE TABLE profile (
          name TEXT,
          id INT
    )
    ''');
    await db.execute(
      '''
      INSERT INTO profile values ('(your name)', 1) 
    '''
    );
    await db.execute(
        '''
      INSERT INTO points_table values (1, 155, 3) 
      '''
    );
  }

  // helper functions

  // getAlarms returns a list of the alarms in the database, or [] if empty
  Future<List<Alarm>> getAlarms() async {
    Database db = await instance.database;
    var alarms = await db.query('alarm_table', orderBy: 'title');
    List<Alarm> alarmList = alarms.isNotEmpty
        ? alarms.map((c) => Alarm.fromMap(c)).toList()
        : [];
    return alarmList;
  }

  Future<int> add(Alarm alarm) async {
    Database db = await instance.database;
    return await db.insert('alarm_table', alarm.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('alarm_table', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Alarm alarm) async {
    Database db = await instance.database;
    return await db.update('alarm_table', alarm.toMap(), where: 'id = ?', whereArgs: [alarm.id]);
  }

  Future<List<Profile>> getProfile() async {
    Database db = await instance.database;
    // await db.rawDelete('DELETE FROM alarm_table');
    var name = await db.query('profile', limit: 1);
    List<Profile> n = name.isNotEmpty
        ? name.map((c) => Profile.fromMap(c)).toList()
        : [];
    return n;
  }
  Future<int> updateProfile(Profile profile) async {
    Database db = await instance.database;
    return await db.update('profile', profile.toMap(), where: 'id =  ?', whereArgs: [profile.id]);
  }
  Future<List<Points>> getPoints() async {
    Database db = await instance.database;
    var name = await db.query('points_table', limit: 1);
    List<Points> n = name.isNotEmpty
        ? name.map((c) => Points.fromMap(c)).toList()
        : [];
    return n;
  }
  Future<int> updatePoints(Points points) async {
    Database db = await instance.database;
    return await db.update('points_table', points.toMap(), where: 'id =  ?', whereArgs: [1]);
  }
}