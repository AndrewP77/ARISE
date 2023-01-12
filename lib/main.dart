import 'package:flutter/material.dart';
import 'TitleScreen.dart';
//importing splash_screen.dart file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TitleScreen(),
    );
  }
}