import 'package:flutter/material.dart';

import '/screens/city_screen.dart';
import '/services/location.dart';
import '/services/weather.dart';
import '/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final Map<String, dynamic> weatherData;
  const LocationScreen({super.key, required this.weatherData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp;
  late int condition;
  late String city;
  late String weatherIcon;
  late String weatherMessage;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    // since we're inside this 'State' class but our 'weatherData' lives inside the 'StatefulWidget' class which is a separate class, the only way we can have access to that data is by the "widget" property, which has access to its parent data.
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temp = 0;
        condition = 0;
        city = 'Nowhere!';
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        return;
      }
      temp = data["temp"];
      condition = data["id"];
      city = data["city"];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(temp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      FixedLocation location = FixedLocation();
                      Map<String, dynamic> weatherData = await location
                          .getDecodedData();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () async {
                      // since we used our Navigator.pop method in city_screen to pass some data back, we can now save that data in a variable by our Navigator.push.
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (typedName != null) {
                        CityLocation location = CityLocation(
                          cityName: typedName,
                        );
                        Map<String, dynamic> weatherData = await location
                            .getDecodedData();
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('${temp.toInt()}°', style: kTempTextStyle),
                    Text(weatherIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $city',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
