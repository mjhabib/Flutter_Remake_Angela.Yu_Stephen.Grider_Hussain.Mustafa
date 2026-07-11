import 'package:flutter/material.dart';

import 'package:finstagram_app/screens/feed_screen.dart';
import 'package:finstagram_app/screens/profile_screen.dart';
import 'package:finstagram_app/services/file_uploader.dart';
import 'package:finstagram_app/services/firebase_brain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Using a mixin for image picking capabilities
class _HomeScreenState extends State<HomeScreen> with FilePickerMixin {
  int screenIndex = 0;
  FirebaseBrain? firebaseBrain;
  final List<Widget> selectedScreen = [FeedScreen(), ProfileScreen()];

  @override
  void initState() {
    super.initState();
    firebaseBrain = FirebaseBrain();
  }

  void pickAndUploadImage() async {
    try {
      await pickImage();
      await firebaseBrain!.postImage(selectedImageBytes!);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finstagram Home"),
        actions: [
          GestureDetector(
            onTap: pickAndUploadImage,
            child: const Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: GestureDetector(
              onTap: () async {
                await firebaseBrain!.logout();
                Navigator.popAndPushNamed(context, 'login');
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
