import 'package:flutter/cupertino.dart';
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
  'You snooze, you lose',
  'You sleep, you weep',
  'You nap, you get the slap',
  'You zizz, you stop to is',
  'You slumbered, your days are numbered',
  'the rest are random',
  'oiok8miumj',
  'sdjcknsdkmak',
  'asjdchj',
  'sieuifj',
];
List<String> difficulties = ['Easy', 'Medium', 'Hard'];
List<Widget> difficultyWidgets = [Text('Easy'), Text('Medium'), Text('Hard')];
List<bool> selectedDifficulties = [true, false, false];


List<List<String>> levelRewards = [
  ['New Challenge!', '1 Free Snooze!', 'New Ringtone!'],
  ['Improved Streak Rewards!', '2 Free Snoozes!', 'New Color Theme!'],
  ['New Challenge!', 'New Ringtone!'],
  ['1 Free Snooze!', 'New Ringtone!'],
  ['x1.1 points multiplier!', 'New Ringtone!'],
  ['1 Free Snooze!', 'New Ringtone!'],
  ['New Challenge!', 'New Ringtone!'],
  ['1 Free Snooze!', 'New Ringtone!'],
  ['New Challenge!', 'New Ringtone!'],
  ['1 Free Snooze!', 'New Ringtone!'],
  ['New Challenge!', 'New Ringtone!'],
  ['1 Free Snooze!', 'New Ringtone!'],
];

Map<int, String> streakRewards = {
  2: 'Reward 1',
  4: 'Reward 2',
  5: 'Reward 3',
  8: 'Reward 4',
  10: 'Reward 5',
  15: 'Reward 6',
};

List<int> levelThresholds = [
  0,
  20,
  50,
  100,
  150,
  210,
  280,
  380,
  520,
  630,
  760,
  900
];

List<String> tongueTwisters = [
'Peter Piper picked a peck of pickled peppers. A peck of pickled peppers Peter Piper picked. If Peter Piper picked a peck of pickled peppers, where’s the peck of pickled peppers Peter Piper picked?',
'Betty Botter bought some butter but she said the butter’s bitter. If I put it in my batter, it will make my batter bitter. But a bit of better butter will make my batter better, so it was better Betty Botter bought a bit of better butter',
'How much wood would a woodchuck chuck if a woodchuck could chuck wood? He would chuck, he would, as much as he could, and chuck as much wood as a woodchuck would if a woodchuck could chuck wood',
'She sells seashells by the seashore',
'How can a clam cram in a clean cream can?',
'I scream, you scream, we all scream for ice cream',
'I saw Susie sitting in a shoe shine shop',
'Susie works in a shoe shine shop. Where she shines she sits, and where she sits she shines',
'Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair. Fuzzy Wuzzy wasn’t fuzzy, was he?',
'Can you can a can as a canner can can a can?',
'You know New York, you need New York, you know you need unique New York',
'I saw a kitten eating chicken in the kitchen',
'If a dog chews shoes, whose shoes does he choose?',
'I thought I thought of thinking of thanking you',
'I wish to wash my Irish wristwatch',
'Near an ear, a nearer ear, a nearly eerie ear',
'Eddie edited it',
'Willi’s really weary',
'A big black bear sat on a big black rug',
'Tom threw Tim three thumb tacks',
'He threw three free throws',
'Nine nice night nurses nursing nicely',
'So this is the sushi chef',
'Four fine fresh fish for you',
'Wayne went to wales to watch walruses'
];