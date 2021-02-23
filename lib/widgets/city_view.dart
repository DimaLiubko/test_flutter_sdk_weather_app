import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';
import 'package:test_flutter_sdk_weather_app/utils/forecast_util.dart';

// import 'package:intl/intl.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data.name;
    var county = snapshot.data.sys.country;
    var formatterDate =
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt * 1000);

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $county',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            '${Util.getFormattedDate(formatterDate)}',
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
