import 'package:flutter/material.dart';

import 'package:finstagram_app/services/firebase_brain.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseBrain? firebaseBrain;
  Map<dynamic, dynamic>? currentUser;
  late double deviceHeight, deviceWidth;

  @override
  void initState() {
    super.initState();
    firebaseBrain = FirebaseBrain();
    currentUser = firebaseBrain?.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [profileName(), profileImage(), postsGridView()],
      ),
    );
  }

  Widget profileName() {
    String usersName = currentUser?["name"] ?? 'Mysterious User!';

    return Container(
      margin: EdgeInsets.only(bottom: deviceHeight * 0.02),
      child: Text(usersName),
    );
  }

  Widget profileImage() {
    // Get the image URL or use a default
    String imageUrl =
        currentUser?["image"] ??
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Liv_Tyler_2008.jpg/500px-Liv_Tyler_2008.jpg';

    return Container(
      margin: EdgeInsets.only(bottom: deviceHeight * 0.02),
      height: deviceHeight * 0.15,
      width: deviceHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  Widget postsGridView() {
    return Expanded(
      child: StreamBuilder(
        stream: firebaseBrain!.getPostsForUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List posts = snapshot.data!.docs.map((e) => e.data()).toList();
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Map post = posts[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(post["image"]),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
        },
      ),
    );
  }
}
