import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var preassure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Util.getItem(Icons.thermostat, preassure.round(), 'mm Hg'),
        Util.getItem(Icons.cloud, humidity, '%'),
        Util.getItem(Icons.linear_scale, wind.toInt(), 'm/s'),
      ],
    ));
  }
}
