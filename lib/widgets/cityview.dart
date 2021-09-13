import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          Text(
            '${Util.getFormattedData(formattedDate)}',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
