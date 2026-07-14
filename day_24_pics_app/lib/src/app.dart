import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int counter = 0;

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
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ),
      ),
    );
  }
}
