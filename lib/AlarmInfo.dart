import 'dart:ui';
import 'data.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String title;
  bool isActive;
  late List<Color> gradientColors;
  String daysActive;
  String difficulty;

  AlarmInfo(this.alarmDateTime, {this.title='', this.isActive=false, this.difficulty='None', this.daysActive="Once"}) {
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
  DateTime get getAlarmDateTime => alarmDateTime;
  String get getDaysActive => daysActive;
}