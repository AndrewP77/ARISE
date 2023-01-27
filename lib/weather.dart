import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  
  var temp;
  var minTemp;
  var maxTemp;
  var humidity;
  String weather = '';
  var id;
  String cityName = '';
  String weatherIcon = 'black';
  var apikey = 'ae77c576cebbe63e4827266ae057451b';
  var lat;
  var lon;

  
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
            forceAndroidLocationManager: true, desiredAccuracy: LocationAccuracy.high);

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
    });

  }

   String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'thunder';
    } else if (condition < 400) {
      return 'drizzle';
    } else if (condition == 500) {
      return 'rain';
    } else if (condition < 600) {
      return 'heavy_rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'fog';
    } else if (condition == 800) {
      return 'sun';
    } else  {//(condition <= 804) {
      return 'cloud';
    } 
  }

  @override
  void initState() {
    Location();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        body: Container( 
          alignment: Alignment.center,
          color: Colors.black,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget> [
                  Container(
                    child: Text(cityName, style: TextStyle(color: Colors.white)),
                  ),
                  //Text('$day', style: TextStyle(color: Colors.white)),
                ]
              ),
              Image.asset('assets/images/$weatherIcon.png',height: 160,),
              Column(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(left: 25.0),
                  child: Text('$temp°', style: TextStyle(color: Colors.white))),
                  Text(weather, style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/thermometer_low.png',height: 50,),
                  Text('$minTemp°', style: TextStyle(color: Colors.white)),
                  Image.asset('assets/images/thermometer_high.png',height: 50,),
                  Text('$maxTemp°', style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
          
        ),
      ),
    );
  }
   
}



