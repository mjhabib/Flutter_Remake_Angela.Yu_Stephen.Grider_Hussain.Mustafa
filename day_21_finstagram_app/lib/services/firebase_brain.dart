import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseBrain {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Map? currentUser;

  FirebaseBrain();

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
}
