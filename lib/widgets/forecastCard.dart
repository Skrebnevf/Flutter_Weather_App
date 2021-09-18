import 'package:flutter/material.dart';
import 'package:weather_app/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedData(date);
  var dayOfWeek = '';
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  dayOfWeek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$dayOfWeek',
              style: TextStyle(fontSize: 25, color: Colors.white, shadows: [Shadow(color: Colors.black38, offset: Offset(2.0, 2.0), blurRadius: 9)])),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$tempMin °С',
                        style: TextStyle(fontSize: 30, color: Colors.white, shadows: [Shadow(color: Colors.black38, offset: Offset(2.0, 2.0), blurRadius: 9)])),
                  ),
                  Image.network(icon, scale: 1.2,)
                ],
              )
            ],
          )
        ],
      ),
    ],
  );
}
