import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/API/weather_api.dart';
import 'package:test_flutter_sdk_weather_app/models/weather_forecast_daily.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_flutter_sdk_weather_app/widgets/city_view.dart';
import 'package:test_flutter_sdk_weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'Kyiv';

  @override
  void initState() {
    super.initState();

    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather.weather[0].main);
    // });
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
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50.0),
                    TempView(snapshot: snapshot),
                  ],
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
