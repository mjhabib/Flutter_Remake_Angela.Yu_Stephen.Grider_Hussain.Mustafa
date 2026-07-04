import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.prices, required this.coin});
  final Map<String, dynamic> prices;
  final String? coin;

  @override
  Widget build(BuildContext context) {
    // convert map to a list of entries
    final List<MapEntry<String, dynamic>> entries = prices.entries.toList();
    return MaterialApp(
      title: '$coin values',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(88, 60, 197, 1)),
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(
                  entry.key.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                trailing: Text(
                  entry.value.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
