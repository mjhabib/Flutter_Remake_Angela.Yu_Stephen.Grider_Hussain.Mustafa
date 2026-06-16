import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // initState runs only once when app starts (useful for getting something like user's location)
  // @override
  // void initState() {
  //   super.initState();
  // // do something
  // }

  FixedLocation position = FixedLocation();
  late double latitude = position.latitude;
  late double longitude = position.longitude;

  // access .env variable using dotenv package
  final owmAPIKey = dotenv.get('OPENWEATHERMAP_API_KEY');
  late String owmEndpoint =
      "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$owmAPIKey";

  // send a http get request using 'http' package
  void getData(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      String data = response.body;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData(owmEndpoint);
    return Scaffold();
  }
}
