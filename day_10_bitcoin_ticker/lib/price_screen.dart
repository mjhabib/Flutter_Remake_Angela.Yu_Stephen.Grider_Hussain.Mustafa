import '/coin_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // our default currency
  String? selectedCurrency = 'USD';

  // Android: for each currency in our list, create a new 'DropDownMenuItem'
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  // same for IOS
  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {},
      children: pickerItems,
    );
  }

  // get Fixed prices
  Map<String, int> coinPrices = CoinData().getData();

  // Some popular ways to loop through a Map in Dart (for reference)

  // 01.
  // for (var entry in cryptoList.entries) {
  //   print('Key: ${entry.key}, Value: ${entry.value}');
  // }

  // 02.
  // for (var key in cryptoList.keys) {
  //   var value = cryptoList[key];
  //   print('Key: $key, Value: $value');
  // }
  // for (var value in cryptoList.values) {
  //   print('Value: $value');
  // }

  // 03.
  // var keys = cryptoList.keys.toList();
  // for (int i = 0; i < keys.length; i++) {
  //   var key = keys[i];
  //   var value = cryptoList[key];
  //   print('Key: $key, Value: $value');
  // }

  // 04.
  // var formatted = cryptoList.entries.map((entry) {
  //   return '${entry.key} = ${entry.value}';
  // }).toList();

  // print(formatted);

  // Show all three cryptos with their prices
  List<Widget> cryptoText = [];
  void getCryptoPrices() {
    // 05.
    cryptoList.forEach((key, value) {
      setState(() {
        cryptoText.add(
          Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 $key = $value $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCryptoPrices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: cryptoText,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: androidDropdown(),
            // child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
