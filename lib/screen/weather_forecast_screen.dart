import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/screen/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/cityview.dart';
import 'package:weather_app/widgets/ditail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;
  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'OpenWeatherMap',
          style: TextStyle(color: Colors.black, fontSize: 23, shadows: [
            Shadow(
                color: Colors.black38, offset: Offset(2.0, 2.0), blurRadius: 5)
          ]),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            TablerIcons.home,
            color: Colors.red.shade400,
            size: 29,
          ),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              TablerIcons.location,
              color: Colors.red.shade400,
              size: 31,
            ),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
          ),
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
                    child: Text(
                  'City not found\nPlease, enter correct city',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ));
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
