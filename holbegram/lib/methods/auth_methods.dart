import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:holbegram/models/user.dart';
import 'package:holbegram/screens/auth/methods/user_storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      }
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isEmpty || password.isEmpty || username.isEmpty) {
        return "Please fill all the fields";
      }

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      String photoUrl = "https://assets.stickpng.com/images/585e4beacb11b227491c3399.png";
      if (file != null) {
         photoUrl = await StorageMethods().uploadImageToStorage(false, "profilePics", file);
      }

      Users userModel = Users(
        uid: user!.uid,
        email: email,
        username: username,
        bio: "",
        photoUrl: photoUrl,
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username.isEmpty ? "" : username.substring(0, 1).toUpperCase(),
      );

      await _firestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toJson());

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}