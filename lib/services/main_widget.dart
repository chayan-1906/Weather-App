import 'package:flutter/material.dart';
import 'package:weather/widgets/weather_tile.dart';

class MainWidget extends StatelessWidget {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  const MainWidget({
    Key key,
    this.location,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weather,
    this.humidity,
    this.windSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: height / 2,
          width: width,
          color: Color(0xFFF1F1F1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  '${temp.toInt()}°',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.purple,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                'High of ${tempMax.toInt()}°, Low of ${tempMin.toInt()}°',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF9E9E9E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                WeatherTile(
                  iconData: Icons.thermostat_outlined,
                  title: 'Temperature',
                  subtitle: '${temp.toInt()}°C',
                ),
                WeatherTile(
                  iconData: Icons.filter_drama_outlined,
                  title: 'Weather',
                  subtitle: weather,
                ),
                WeatherTile(
                  iconData: Icons.wb_sunny_outlined,
                  title: 'Humidity',
                  subtitle: '$humidity%',
                ),
                WeatherTile(
                  iconData: Icons.waves_outlined,
                  title: 'Wind Speed',
                  subtitle: '${windSpeed.toInt()} MpH',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
