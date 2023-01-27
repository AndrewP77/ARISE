import 'dart:ui';
import 'AlarmDatabase.dart';

class AlarmInfo {
  int? id;
  late DateTime alarmDateTime;
  String title;
  String isActive;
  bool vibration;
  late List<Color> gradientColors;
  String daysActive;
  String difficulty;
  String ringtone;
  List<String> categories = [];


  AlarmInfo.withoutA({
    this.title = 'title',
    this.isActive = 'true',
    this.difficulty = 'None',
    this.daysActive = 'Once',
    this.ringtone = 'Default',
    this.vibration = true, }) {
    update(); //?
  }
  AlarmInfo(this.alarmDateTime, {
    this.title = 'title',
    this.isActive = 'true',
    this.difficulty = 'None',
    this.daysActive = 'Once',
    this.ringtone = 'Default',
    this.vibration = true, }) {
    update(); //?
  }

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo.withoutA(
    title: json["title"],
    isActive: json["isActive"],
    difficulty: json["difficulty"],
    daysActive: json["daysActive"],
    ringtone: json["ringtone"],
    vibration: json["vibration"]
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
  };

  void update() {
    if (categories.isEmpty) {
      difficulty = 'None';
    }
    switch(difficulty) {
      case 'Easy':
        gradientColors = Gradients.easy;
        break;
      case 'Medium':
        gradientColors = Gradients.medium;
        break;
      case 'Hard':
        gradientColors = Gradients.hard;
        break;
      default:
        gradientColors = Gradients.neutral;
    }
  }
  // String get getTitle => title;
  // DateTime get getAlarmDateTime => alarmDateTime;
  // String get getDaysActive => daysActive;
}