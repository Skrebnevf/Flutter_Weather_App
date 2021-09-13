import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/cityview.dart';
import 'package:weather_app/widgets/ditail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName = 'London';
  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecast(city: _cityName);
    // forecastObject.then((weather) {
    //   print(weather.list![0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('OpenWeatherMap'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.my_location)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.location_city))
        ],
      ),
      body: ListView(
        children: [
          Container(
              child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(height: 50),
                    CityView(snapshot: snapshot),
                    SizedBox(
                      height: 50,
                    ),
                    TempView(snapshot: snapshot),
                    SizedBox(
                      height: 50,
                    ),
                    DetailView(
                      snapshot: snapshot,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtomListView(snapshot: snapshot),
                  ],
                );
              } else {
                return Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.black,
                    size: 100,
                  ),
                );
              }
            },
          )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
