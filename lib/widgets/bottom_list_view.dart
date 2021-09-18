import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/widgets/forecastCard.dart';

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
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black38, offset: Offset(2.0, 2.0), blurRadius: 9)]),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    decoration: BoxDecoration(color: Colors.red,
                    boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(3.0, 3.0), blurRadius: 3)],
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                    child: forecastCard(snapshot, index),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: snapshot.data!.list!.length),
        )
      ],
    );
  }
}
