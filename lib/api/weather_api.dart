import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_dayli.dart';
import 'package:weather_app/utilities/constans.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? city, bool? isCity}) async {
    var querryParametrs = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': city,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, querryParametrs);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
