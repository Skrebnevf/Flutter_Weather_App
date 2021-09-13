import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';

class ButtomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  ButtomListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7 - Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
