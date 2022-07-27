import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = await _auth.currentUser;
    firebaseUser?.updatePassword(password);
  }

  Future<void> updateMail(String email) async {
    var firebaseUser = await _auth.currentUser;
    firebaseUser?.updateEmail(email);
  }
}
