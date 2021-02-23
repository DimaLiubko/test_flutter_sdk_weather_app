import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/API/weather_api.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('OpenWeatherMap'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'All good',
                  style: Theme.of(context).textTheme.headline2,
                );
              } else {
                return Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.black87,
                    size: 100,
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }
}