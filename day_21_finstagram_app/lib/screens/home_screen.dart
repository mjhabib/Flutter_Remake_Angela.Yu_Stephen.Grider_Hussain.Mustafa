import 'package:flutter/material.dart';

import 'package:finstagram_app/screens/feed_screen.dart';
import 'package:finstagram_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  final List<Widget> selectedScreen = [FeedScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finstagram Home"),
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(Icons.add_a_photo)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: selectedScreen[screenIndex],
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: screenIndex,
      onTap: (newIndex) {
        setState(() {
          screenIndex = newIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(label: 'Feed', icon: Icon(Icons.feed)),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.account_box),
        ),
      ],
    );
  }
}
