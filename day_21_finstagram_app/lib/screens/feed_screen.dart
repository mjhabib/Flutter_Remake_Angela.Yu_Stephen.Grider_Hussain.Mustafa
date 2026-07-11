import 'package:flutter/material.dart';

import 'package:finstagram_app/services/firebase_brain.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FirebaseBrain? firebaseBrain;
  late double deviceHeight, deviceWidth;

  @override
  void initState() {
    super.initState();
    firebaseBrain = FirebaseBrain();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: deviceHeight,
      width: deviceWidth,
      child: StreamBuilder(
        stream: firebaseBrain!.getLatestPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List posts = snapshot.data!.docs.map((e) => e.data()).toList();
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Map post = posts[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.01,
                    horizontal: deviceWidth * 0.05,
                  ),
                  height: deviceHeight * 0.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(post['image']),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
