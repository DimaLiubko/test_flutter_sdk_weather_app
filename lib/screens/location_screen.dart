import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_flutter_sdk_weather_app/API/weather_api.dart';
import 'package:test_flutter_sdk_weather_app/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();

    if (weatherInfo != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return WeatherForecastScreen(locationWeather: weatherInfo);
        }),
      );
    } else {
      print('Error while get location');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100.0,
        ),
      ),
    );
  }
}
