import 'dart:ui';

import 'package:arise/RingingAlarm.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'AlarmDatabase.dart';
import 'AlarmListScreen.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  var temp;
  var minTemp;
  var maxTemp;
  var humidity;
  late Gradient  background = LinearGradient(colors: [Theme.of(context).scaffoldBackgroundColor, Theme.of(context).scaffoldBackgroundColor]);
  String weather = '';
  String message = '';
  var id;
  String cityName = '';
  late String weatherIcon = 'black';
  var apikey = 'ae77c576cebbe63e4827266ae057451b';
  var lat;
  var lon;
  late String name;
  // Points points = Points();
  getPoints() async {
    Database db = await DatabaseHelper.instance.database;
    var name = await db.query('points_table', limit: 1);
    List<Points> n = name.isNotEmpty
        ? name.map((c) => Points.fromMap(c)).toList()
        : [];
    Points points = n.first;
    points.total_points += 20;
    DatabaseHelper.instance.updatePoints(points);
  }
  getName() async {
    Database db = await DatabaseHelper.instance.database;
    var prof = await db.query('profile', limit: 1);
    List<Profile> n = prof.isNotEmpty
        ? prof.map((c) => Profile.fromMap(c)).toList()
        : [];
    Profile profile = n.first;
    name = profile.name;
  }

  // late int totalPoints;

  _GreetingScreenState() {
    getPoints();
  }


  Future<bool> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable the services')));
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.')));
    return false;
    } 
  return true;
  }

  Future<void> Location() async {
    try {
      final hasPermission = await _determinePosition();
      if (hasPermission) {
        Position position = await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true, desiredAccuracy: LocationAccuracy.low);

        lat = position.latitude;
        lon = position.longitude;
        get_weather();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> get_weather() async {
    http.Response response = await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric"));
    var results = jsonDecode(response.body);
    await getName();

    setState(() {
      temp = results['main']['temp'];
      temp = temp.toInt();

      maxTemp = results['main']['temp_max'];
      maxTemp = maxTemp.toInt();

      minTemp = results['main']['temp_min'];
      minTemp = minTemp.toInt();

      cityName = results['name'];
      humidity = results['main']['humidity'];
      weather = results['weather'][0]['main'];
      id = results['weather'][0]['id'];
      weatherIcon = getWeatherIcon(id);  
      message = "Hello, $name.\n${getMessage(temp)}";
    });

  }

   String getWeatherIcon(int condition) {
    if (condition < 300) {
      setState(() {
        background =
            const RadialGradient(colors: [Colors.indigoAccent, Colors.deepPurple], center: Alignment.centerLeft);
      });
      return 'thunder';
    } else if (condition < 400) {
        setState(() {
          background =
              const RadialGradient(
                colors: [Color(0xff6d7ccc), Color(0xffb1e6fe)],
                center: Alignment.topCenter,
                radius: 0.8,
              );
        });
      return 'drizzle';
    } else if (condition == 500) {
      setState(() {
        background =
            const RadialGradient(
              colors: [Color(0xffb9b9b9), Color(0xff747474)],
              center: Alignment.topCenter,
              radius: 0.8,
            );
      });
      return 'rain';
    } else if (condition < 600) {
      setState(() {
        background =
            const RadialGradient(
              colors: [Color(0xffb9b9b9), Color(0xff607d8b)],
              center: Alignment.topCenter,
              radius: 0.8,
            );
      });
      return 'heavy_rain';
    } else if (condition < 700) {
      setState(() {
        background =
            const RadialGradient(
              colors: [Color(0xffa2a2a2), Color(0xffd1dadf)],
              center: Alignment.center,
              radius: 0.8,
            );
      });
      return 'snow';
    } else if (condition < 800) {
      setState(() {
        background =
        const RadialGradient(colors: [Colors.white, Colors.white54], center: Alignment.topCenter);
      });
      return 'fog';
    } else if (condition == 800) {
      setState(() {
        background = const RadialGradient(
          colors: [Color(0xffffef62), Color(0xff8bdafe), Color(0xff2095f3)],
          center: Alignment.topRight,
          radius: 1.4,
        );
      });
      return 'sun';
    } else  {//(condition <= 804) {
      setState(() {
        background =
            const RadialGradient(
              colors: [Color(0xffb9b9b9), Color(0xffb9c8cf)],
              center: Alignment.bottomCenter,
              radius: 0.8,
            );
      });
      return 'cloud';
    } 
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
  
  late Future<void> _loc;
  
  @override
  void initState() {
    super.initState();
    _loc = Location();
    
  }

  @override
  Widget build(BuildContext context) {
    RingingAlarmWidget.player.setReleaseMode(ReleaseMode.stop);
    RingingAlarmWidget.player.stop();
  return Scaffold (
    appBar: AppBar(
      leading: GestureDetector(
        child: const Icon(Icons.home),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AlarmListScreenWidget()),
          );
        },
      ),
      backgroundColor: Colors.transparent,

    ),
    extendBodyBehindAppBar: true,
    body: FutureBuilder(
      future: _loc,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {       
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
        }
        else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } 

        return  Container(
          decoration: BoxDecoration(gradient: background),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [ 
                Column(
                  children: [
                    Text(
                    DateFormat("HH:mm").format(DateTime.now()),
                    style: TextStyle( fontSize: 100,),
                    ),
                    Text(DateFormat("EEE, dd/MM").format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleLarge)
                  ]
                ),
                ],
                ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(message, 
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,),
            ),
            Row(
              children: <Widget> [
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children :[
                  Text('$temp°', style: Theme.of(context).textTheme.displayMedium),//),
                  Text(weather, style: Theme.of(context).textTheme.titleLarge),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/thermometer_low.png',height: 40,),
                  Text('$minTemp°', style: Theme.of(context).textTheme.titleLarge),
                  Image.asset('assets/images/thermometer_high.png',height: 40,),
                  Text('$maxTemp°', style: Theme.of(context).textTheme.titleLarge),
                ],
                )
                ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Text(' '+ cityName, style: Theme.of(context).textTheme.titleLarge)
                    ],
                    ),
                ),
                ],
                ),
                ),
                Expanded(
                  child: Image.asset('assets/images/$weatherIcon.png',height: 160,),
                ),
                  //Text('$day', style: TextStyle(color: Colors.white)),
                ]
              ),
          ],
            )
        );
      }
    ),
   );
  }
}