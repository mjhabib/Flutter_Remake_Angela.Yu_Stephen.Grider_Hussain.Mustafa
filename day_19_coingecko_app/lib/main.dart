import 'dart:convert';
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
  late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      title: 'CoinGecko App',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(88, 60, 197, 1)),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [coinDropdown(), getData()],
            ),
          ),
        ),
      ),
    );
  }

  Widget coinDropdown() {
    List<String> coins = ['Bitcoin'];
    List<DropdownMenuItem<String>> items = coins.map((e) {
      return DropdownMenuItem(
        value: e,
        child: Text(
          e,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }).toList();

    return DropdownButton(
      icon: Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
      dropdownColor: Color.fromRGBO(83, 88, 206, 1),
      iconSize: 30,
      value: coins.first,
      items: items,
      onChanged: (value) {},
    );
  }

  Widget getData() {
    return FutureBuilder(
      future: httpService.sendRequest('coins/bitcoin'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data.toString());
          num usdPrice = data['market_data']['current_price']['usd'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [currentPrice(usdPrice)],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }

  Widget currentPrice(num rate) {
    return Text(
      '${rate.toStringAsFixed(2)} USD',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
