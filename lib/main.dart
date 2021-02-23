import 'package:flutter/material.dart';
import 'package:test_flutter_sdk_weather_app/screens/location_screen.dart';

// import 'screens/weather_forecast_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WeatherForecastScreen(),
      home: LocationScreen(),
    );
  }
}
