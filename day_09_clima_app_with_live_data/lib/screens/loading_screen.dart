import '/services/location.dart';
import '/screens/location_screen.dart';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initState runs only once when app starts (useful for getting something like user's location)
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    FixedLocation location = FixedLocation();
    Map<String, dynamic> weatherData = await location.getDecodedData();

    // pass information over to another screen/page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
