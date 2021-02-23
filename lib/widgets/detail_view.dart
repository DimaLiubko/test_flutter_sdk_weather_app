import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';
import 'package:test_flutter_sdk_weather_app/utils/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var pressure = snapshot.data.main.pressure * 0.750062;
    var humidity = snapshot.data.main.humidity;
    var wind = snapshot.data.wind.speed;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
