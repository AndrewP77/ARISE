import 'dart:ui';
import 'package:arise/AlarmInfo.dart';

import 'data.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String title;
  bool isActive;
  List<Color> gradientColors;
  String daysActive;

  AlarmInfo(this.alarmDateTime, {this.title='', this.isActive=false, this.gradientColors=Gradients.neutral, this.daysActive="Once"});
}