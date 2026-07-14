import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
// we only care about the get function not all the http functionalities
// this will avoid mistakes, it's better for clarity and conflicts (doesn't make project lighter/faster)
import 'package:pics_app/src/models/image_model.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 1;

  void fetchImage() async {
    try {
      final response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'),
      );
      if (response.statusCode >= 200) {
        final parsedJson = json.decode(response.body);
        var imageModel = ImageModel.fromJson(parsedJson);
      }
      counter++;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent.shade100),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Let's see some images!")),
        body: Center(child: Text('$counter images')),
        floatingActionButton: FloatingActionButton.extended(
          label: Icon(Icons.add_a_photo),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
