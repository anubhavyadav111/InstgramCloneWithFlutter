// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:instagram_clone/resouces/storage_methods.dart';
// import 'package:instagram_clone/models/user.dart' as model;

// class AuthMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<model.User> getUserDetails() async {
//     User currentUser = _auth.currentUser!;

//     DocumentSnapshot snap =
//         await _firestore.collection('users').doc(currentUser.uid).get();

//         return model.User.fromSnap(snap);
//   }

//   // sign up user

//   Future<String> signUpUser({
//     required String email,
//     required String password,
//     required String username,
//     required String bio,
//     required Uint8List file,
//   }) async {
//     String res = "Some error occured";

//     try {
//       if (email.isNotEmpty ||
//           password.isNotEmpty ||
//           username.isNotEmpty ||
//           bio.isNotEmpty ||
//           file != null) {
//         // little change intial it is null i change it into false
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         print(cred.user!.uid);

//         String photoUrl =
//             await StorageMethods().uploadImageToStorage('profile', file, false);

//         //Add user to our database

//         model.User user = model.User(
//           username: username,
//           uid: cred.user!.uid,
//           email: email,
//           bio: bio,
//           followers: [],
//           following: [],
//           photoUrl: photoUrl,
//         );

//         await _firestore.collection('users').doc(cred.user!.uid).set(
//               user.toJson(),
//               // 'username': username,
//               // 'uid': cred.user!.uid,
//               // 'email': email,
//               // 'bio': bio,
//               // 'followers': [],
//               // 'following': [],
//               // 'photUrl': photoUrl,
//             );
//         res = "succes";
//       }
//     } catch (err) {
//       return err.toString();
//     }
//     return res;
//   }

//   // logging in user
//   Future<String> loginUser({
//     required String email,
//     required String password,
//   }) async {
//     String res = "Some error occurred";

//     try {
//       if (email.isNotEmpty || password.isNotEmpty) {
//         await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         res = "success";
//       } else {
//         res = "Please enter all the fields";
//       }
//     }
//     // on FirebaseAuthException catch(e){
//     //   if(e.code == 'user-not-found'){  // add more thing with this anubhav add in the future

//     //   }
//     // }

//     catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
// }

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resouces/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model;
// import 'package:instagram_clone_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file.isEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
