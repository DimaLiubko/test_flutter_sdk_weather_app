import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({this.snapshot});
  @override
  Widget build(BuildContext context) {
    var icon = snapshot.data.weather[0].getIconUrl();
    var temp = snapshot.data.main.temp.toStringAsFixed(0);
    var description = snapshot.data.weather[0].description.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            icon,
            scale: 0.4,
            color: Colors.black87,
          ),
          SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Text(
                '$temp °C',
                style: TextStyle(color: Colors.black87, fontSize: 54.0),
              ),
              Text(
                '$description',
                style: TextStyle(color: Colors.black87, fontSize: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
