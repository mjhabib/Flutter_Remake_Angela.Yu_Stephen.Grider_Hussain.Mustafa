import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:coingecko_app/screens/details_screen.dart';
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
  String? selectedCoin = 'bitcoin';

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
    List<String> coins = ['bitcoin', 'ethereum', 'tether', 'cardano', 'ripple'];
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
      value: selectedCoin,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCoin = value;
        });
      },
    );
  }

  Widget getData() {
    return FutureBuilder(
      future: httpService.sendRequestByHttp('coins/$selectedCoin'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data.toString());
          Map<String, dynamic> exchangeRates =
              data['market_data']['current_price'];
          num usdPrice = data['market_data']['current_price']['usd'];
          num change24h = data['market_data']['price_change_percentage_24h'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(
                          prices: exchangeRates,
                          coin: selectedCoin,
                        );
                      },
                    ),
                  );
                },
                child: coinImage(data['image']['large']),
              ),
              currentPrice(usdPrice),
              percentageChange(change24h),
              descriptionCard(data['description']['en']),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }

  Widget coinImage(String imgURL) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      height: height * 0.15,
      width: width * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imgURL)),
      ),
    );
  }

  Widget currentPrice(num rate) {
    return Text(
      '${rate.toStringAsFixed(2)} USD',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget percentageChange(num change) {
    return Text(
      '${change.toString()}%',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget descriptionCard(String description) {
    return Container(
      color: Color.fromRGBO(83, 88, 206, 0.5),
      margin: EdgeInsets.symmetric(vertical: height * 0.05),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.01,
      ),
      height: height * 0.45,
      width: width * 0.9,
      child: Text(description, style: TextStyle(color: Colors.white)),
    );
  }
}
