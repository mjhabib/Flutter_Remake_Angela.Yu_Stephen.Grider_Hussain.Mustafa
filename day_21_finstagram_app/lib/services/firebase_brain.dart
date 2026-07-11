import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

/* 
Important note to myself!
Unfortunately, I just realized I can't upload images to the 'firebase_storage' simply because I have to upgrade my firebase account (5GB if stay within the free limits) which is currently not possible for me. That's why I commented all the codes responsible for that and replaced them with a simpler code.
 */

class FirebaseBrain {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  Map? currentUser;

  FirebaseBrain();

  // handle user registration
  Future<({bool success, String? error})> registerUser({
    required String name,
    required String email,
    required String password,
    required Uint8List imageBytes,
  }) async {
    try {
      // create a user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // save the user's UID
      String userID = userCredential.user!.uid;
      currentUser = await _getUserData(uid: userCredential.user!.uid);

      // String fileName = '${Timestamp.now().millisecondsSinceEpoch}.jpg';
      // UploadTask uploadTask = _storage
      //     .ref('images/$userID/$fileName')
      //     .putData(imageBytes);
      // TaskSnapshot snapshot = await uploadTask;
      // String imageURL = await snapshot.ref.getDownloadURL();

      // an static image path from the internet instead of firebase_storage
      String imageURL =
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/LivTylerLOTR03.jpg/330px-LivTylerLOTR03.jpg';

      // Store user info with the image URL
      await _db.collection('users').doc(userID).set({
        'name': name,
        'email': email,
        'image': imageURL,
      });
      return (success: true, error: null);
    } catch (e) {
      return (success: false, error: e.toString());
    }
  }

  // handle user authentication
  Future<({bool success, String? error})> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      currentUser = await _getUserData(uid: userCredential.user!.uid);
      return (success: true, error: null);
    } catch (e) {
      return (success: false, error: e.toString());
    }
  }

  // if user exists, get the user's data
  Future<Map> _getUserData({required String uid}) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    return doc.data() as Map;
  }

  // Post a new image
  Future<bool> postImage(Uint8List imageBytes) async {
    try {
      String userId = _auth.currentUser!.uid;

      // String fileName = '${Timestamp.now().millisecondsSinceEpoch}.jpg';
      // UploadTask uploadTask = _storage
      //     .ref('images/$userID/$fileName')
      //     .putData(imageBytes);
      // TaskSnapshot snapshot = await uploadTask;
      // String imageURL = await snapshot.ref.getDownloadURL();

      // an static image path from the internet instead of firebase_storage
      String imageURL =
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Liv_Tyler_2008.jpg/500px-Liv_Tyler_2008.jpg';

      // Store user info with the image URL
      await _db.collection('posts').add({
        "userId": userId,
        "timestamp": Timestamp.now(),
        "image": imageURL,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Get all the posts
  Stream<QuerySnapshot> getLatestPosts() {
    return _db
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Get the user's posts
  Stream<QuerySnapshot> getPostsForUser() {
    String userID = _auth.currentUser!.uid;
    return _db
        .collection('posts')
        .where('userId', isEqualTo: userID)
        .snapshots();
  }

  // Log out user
  Future<void> logout() async {
    await _auth.signOut();
  }
}
