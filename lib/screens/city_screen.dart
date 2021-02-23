import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Type your city',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.white70,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      cityName = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                      icon: Icon(
                        Icons.location_city_rounded,
                        color: Colors.black87,
                        size: 50.0,
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black87,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 30.0),
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
