import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: 360,
    height: 800,
    child: Material(
        color: Color(0xff2b2b2b),
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 48, ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    Container(
                        width: 360,
                        height: 67,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                SizedBox(
                                    width: 360,
                                    height: 67,
                                    child: Material(
                                        color: Color(0xff2b2b2b),
                                        child: Padding(
                                            padding: const EdgeInsets.only(top: 17, bottom: 20, ),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children:[
                                                    Container(
                                                        width: 34,
                                                        height: 23.64,
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                                Container(
                                                                    width: 34,
                                                                    height: 4,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.white, width: 3, ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 10.82),
                                                                Container(
                                                                    width: 34,
                                                                    height: 4,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.white, width: 3, ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 10.82),
                                                                Container(
                                                                    width: 34,
                                                                    height: 4,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.white, width: 3, ),
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                    SizedBox(width: 263),
                                                    Container(
                                                        width: 31,
                                                        height: 30.09,
                                                        padding: const EdgeInsets.only(bottom: 12, ),
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children:[
                                                                Transform.rotate(
                                                                    angle: 1.58,
                                                                    child: Container(
                                                                        width: double.infinity,
                                                                        height: 4,
                                                                        decoration: BoxDecoration(
                                                                            border: Border.all(color: Colors.white, width: 3, ),
                                                                        ),
                                                                    ),
                                                                ),
                                                                SizedBox(height: 261.19),
                                                                Container(
                                                                    width: 31,
                                                                    height: 4,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Colors.white, width: 3, ),
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        width: 322,
                        height: 112,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 322,
                                    height: 112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                            ),
                                        ],
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
                                    ),
                                    child: Stack(
                                        children:[
                                            Positioned(
                                                left: 22,
                                                top: 53,
                                                child: SizedBox(
                                                    width: 131,
                                                    height: 43,
                                                    child: Text(
                                                        "07:00",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 22,
                                                top: 22,
                                                child: Text(
                                                    "Wake up!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 180,
                                                top: 77,
                                                child: SizedBox(
                                                    width: 115,
                                                    height: 19,
                                                    child: Text(
                                                        "S M T W T F S",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0xff919191),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(right: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Color(0xffd9d9d9),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0xff919191), ),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0x33000000),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(left: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Colors.white,
                                                                                        elevation: 10, 
                                                                                       // color: Color(0x4c000000), 
                                                                                        shape: CircleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0x33000000), ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 98,
                                                top: 50,
                                                child: SizedBox(
                                                    width: 197,
                                                    height: 22,
                                                    child: Text(
                                                        "Challenges: Hard",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        width: 322,
                        height: 112,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 322,
                                    height: 112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                            ),
                                        ],
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
                                    ),
                                    child: Stack(
                                        children:[
                                            Positioned(
                                                left: 22,
                                                top: 53,
                                                child: SizedBox(
                                                    width: 131,
                                                    height: 43,
                                                    child: Text(
                                                        "08:30",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 22,
                                                top: 22,
                                                child: Text(
                                                    "Guitar lesson",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 180,
                                                top: 77,
                                                child: SizedBox(
                                                    width: 115,
                                                    height: 19,
                                                    child: Text(
                                                        "S M T W T F S",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0xff919191),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(right: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Color(0xffd9d9d9),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0xff919191), ),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0x33000000),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(left: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Colors.white,
                                                                                        elevation: 10, 
                                                                                        //color: Color(0x4c000000), 
                                                                                        shape: CircleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0x33000000), ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 98,
                                                top: 50,
                                                child: SizedBox(
                                                    width: 197,
                                                    height: 22,
                                                    child: Text(
                                                        "Challenges: Medium",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        width: 322,
                        height: 112,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 322,
                                    height: 112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                            ),
                                        ],
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
                                    ),
                                    child: Stack(
                                        children:[
                                            Positioned(
                                                left: 22,
                                                top: 53,
                                                child: SizedBox(
                                                    width: 131,
                                                    height: 43,
                                                    child: Text(
                                                        "18:00",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 22,
                                                top: 22,
                                                child: Text(
                                                    "Medicine reminder!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 200,
                                                top: 77,
                                                child: SizedBox(
                                                    width: 95,
                                                    height: 21,
                                                    child: Text(
                                                        "Once",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0xff919191),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(right: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Color(0xffd9d9d9),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0xff919191), ),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0x33000000),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(left: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Colors.white,
                                                                                        elevation: 10, 
                                                                                        // color: Color(0x4c000000), 
                                                                                        shape: CircleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0x33000000), ),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 98,
                                                top: 50,
                                                child: SizedBox(
                                                    width: 197,
                                                    height: 22,
                                                    child: Text(
                                                        "Challenges: None",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        width: 322,
                        height: 112,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 322,
                                    height: 112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                            ),
                                        ],
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
                                    ),
                                    child: Stack(
                                        children:[
                                            Positioned(
                                                left: 22,
                                                top: 53,
                                                child: SizedBox(
                                                    width: 131,
                                                    height: 43,
                                                    child: Text(
                                                        "06:30",
                                                        style: TextStyle(
                                                            color: Color(0x3fffffff),
                                                            fontSize: 40,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 22,
                                                top: 22,
                                                child: Text(
                                                    "Meeting at 10",
                                                    style: TextStyle(
                                                        color: Color(0x3fffffff),
                                                        fontSize: 16,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 200,
                                                top: 77,
                                                child: SizedBox(
                                                    width: 95,
                                                    height: 21,
                                                    child: Text(
                                                        "Once",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color(0xff919191),
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0xff919191),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(right: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Color(0xffd9d9d9),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0xff919191), ),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 98,
                                                top: 50,
                                                child: SizedBox(
                                                    width: 197,
                                                    height: 22,
                                                    child: Text(
                                                        "Challenges: INSANE!",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color(0xff919191),
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        width: 322,
                        height: 112,
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                                Container(
                                    width: 322,
                                    height: 112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color(0x3f000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                            ),
                                        ],
                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xff636c77), Color(0x00636c77)], ),
                                    ),
                                    child: Stack(
                                        children:[
                                            Positioned(
                                                left: 22,
                                                top: 53,
                                                child: SizedBox(
                                                    width: 131,
                                                    height: 43,
                                                    child: Text(
                                                        "14:30",
                                                        style: TextStyle(
                                                            color: Color(0x3fffffff),
                                                            fontSize: 40,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 22,
                                                top: 22,
                                                child: Text(
                                                    "Pick up the kids",
                                                    style: TextStyle(
                                                        color: Color(0x3fffffff),
                                                        fontSize: 16,
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 180,
                                                top: 77,
                                                child: SizedBox(
                                                    width: 115,
                                                    height: 19,
                                                    child: Text(
                                                        "S M T W T F S",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color(0x3fffffff),
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 255,
                                                top: 21,
                                                child: Container(
                                                    width: 40,
                                                    height: 24,
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                            SizedBox(
                                                                width: 40,
                                                                height: 24,
                                                                child: Material(
                                                                    color: Color(0xff919191),
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.only(right: 16, ),
                                                                        child: Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children:[
                                                                                SizedBox(
                                                                                    width: 24,
                                                                                    height: 24,
                                                                                    child: Material(
                                                                                        color: Color(0xffd9d9d9),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(width: 1, color: Color(0xff919191), ),
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            Positioned(
                                                left: 98,
                                                top: 50,
                                                child: SizedBox(
                                                    width: 197,
                                                    height: 22,
                                                    child: Text(
                                                        "Challenges: None",
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color(0xff919191),
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        ),
    ),
);
  }



}