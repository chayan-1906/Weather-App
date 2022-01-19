import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/services/main_widget.dart';
import 'package:weather/services/weather_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  Future<WeatherInfo> futureWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
          future: futureWeather,
          builder: (context, snapshot) {
            WeatherInfo snapshotData = snapshot.data;
            if (snapshot.hasData) {
              return MainWidget(
                location: snapshotData.location,
                temp: snapshotData.temp,
                tempMin: snapshotData.tempMin,
                tempMax: snapshotData.tempMax,
                weather: snapshotData.weather,
                humidity: snapshotData.humidity,
                windSpeed: snapshotData.windSpeed,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return MainWidget(
              location: snapshotData.location,
              temp: snapshotData.temp,
              tempMin: snapshotData.tempMin,
              tempMax: snapshotData.tempMax,
              weather: snapshotData.weather,
              humidity: snapshotData.humidity,
              windSpeed: snapshotData.windSpeed,
            );
          }),
    );
  }
}
