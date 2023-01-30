import 'dart:ui';
import 'data.dart';

class AlarmInfo {
  String alarmDateTime;
  String title;
  bool isActive;
  bool vibration;
  late List<Color> gradientColors;
  String daysActive;
  String difficulty;
  String ringtone;
  List<String> categories = [];

  AlarmInfo(this.alarmDateTime, {
    this.title='',
    this.isActive=false,
    this.difficulty='None',
    this.daysActive="Once",
    this.ringtone='Default',
    this.vibration=true}) {
    update();
  }

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
  String get getTitle => title;
  String get getAlarmDateTime => alarmDateTime;
  String get getDaysActive => daysActive;
}