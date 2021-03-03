import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/API/weather_api.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';

import 'package:test_flutter_sdk_weather_app/screens/city_screen.dart';
import 'package:test_flutter_sdk_weather_app/widgets/city_view.dart';
import 'package:test_flutter_sdk_weather_app/widgets/detail_view.dart';
import 'package:test_flutter_sdk_weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName;

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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('OpenWeatherMap'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CityScreen()),
              );

              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          )
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50.0),
                    TempView(snapshot: snapshot),
                    SizedBox(height: 50.0),
                    DetailView(snapshot: snapshot),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'City not found\nPlease, enter correct city',
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
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
