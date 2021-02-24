import 'dart:convert';
import 'dart:developer';

import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';
import 'package:test_flutter_sdk_weather_app/utils/constans.dart';

import 'package:http/http.dart' as http;
import 'package:test_flutter_sdk_weather_app/utils/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName, bool isCity}) async {
    Location location = Location();

    await location.getCurrentLocation();

    Map<String, String> parameters;

    if (isCity == true) {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };

      parameters = queryParametrs;
    } else {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };

      parameters = queryParametrs;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('requsts: ${uri.toString()}');

    var respons = await http.get(uri);

    print('requsts: ${respons?.body}');

    if (respons.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(respons.body));
    } else {
      return Future.error('Error response');
    }
  }
}
