import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/home_screen.dart';

import 'services/weather_info.dart';

/* API KEY GENERATION
https://home.openweathermap.org/api_keys
https://openweathermap.org/current#zip
https://api.openweathermap.org/data/2.5/weather?zip=60005,us&appid=6fd693d778b8a3f3aa7867e8912c3b5b
 */

Future<WeatherInfo> fetchWeather() async {
  final zipCode = '60005';
  final apiKey = '6fd693d778b8a3f3aa7867e8912c3b5b';
  final requestUrl =
      'https://api.openweathermap.org/data/2.5/weather?zip=${zipCode},us&units=imperial&appid=${apiKey}';
  final response = await http.get(Uri.parse(requestUrl));
  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error loading request URL info');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
