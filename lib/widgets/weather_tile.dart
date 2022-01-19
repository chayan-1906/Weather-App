import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;

  const WeatherTile({
    Key key,
    @required this.iconData,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: Colors.purple),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16.0,
          color: Color(0xFF9E9E9E),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
