import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var discription = forecastList[0].weather[0].description.toUpperCase();
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.4,
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          children: [
            Container(
                child: Text(
              '$temp °С',
              style: TextStyle(
                fontSize: 54,
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.black38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 9)
                ],
              ),
            )),
            Text('$discription',
                style: TextStyle(fontSize: 18, color: Colors.black, shadows: [
                  Shadow(
                      color: Colors.black38,
                      offset: Offset(1.0, 1.5),
                      blurRadius: 9)
                ]))
          ],
        )
      ],
    ));
  }
}
