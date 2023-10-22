import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_jp/view/HomeScreen.dart';
import 'package:project_jp/view/LoginScreen.dart';

class SplashViewModel {
  final auth = FirebaseAuth.instance;

  splashTimer(BuildContext context) {
    final user = auth.currentUser;
    if (user == null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }
  }
}
