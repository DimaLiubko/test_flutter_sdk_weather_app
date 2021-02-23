import 'dart:convert';
import 'dart:developer';

import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';
import 'package:test_flutter_sdk_weather_app/utils/constans.dart';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String cityName}) async {
    var queryParametrs = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParametrs);

    log('requsts: ${uri.toString()}');

    var respons = await http.get(uri);

    print('requsts: ${respons?.body}');

    if (respons.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(respons.body));
    } else {
      throw Exception('Error response');
    }
  }
}
