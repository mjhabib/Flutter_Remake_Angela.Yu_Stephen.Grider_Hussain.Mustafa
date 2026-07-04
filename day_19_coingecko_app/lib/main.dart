import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:coingecko_app/services/http_service.dart';

void main() async {
  await dotenv.load();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final httpService = HttpService();

  @override
  void initState() {
    super.initState();
    httpService.sendRequest('coins/bitcoin');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinGecko App',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(88, 60, 197, 1)),
      home: Scaffold(),
    );
  }
}
