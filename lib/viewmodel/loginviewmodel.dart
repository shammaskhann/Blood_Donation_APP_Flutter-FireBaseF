import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/AuthException.dart';
import '../Utils/Utils.dart';
import '../view/HomeScreen.dart';

class LoginViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  //final _db = FirebaseFirestore.instance;
  loginAuth(BuildContext context) async {
    await auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((value) {
      Utils.toastMessage("LOGIN SUCESSFULLY");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      return true;
    }).catchError((error) {
      AuthException.authExceptionToast(error.code);
      return false;
    });
  }
}
