import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_jp/Utils/AuthException.dart';
import 'package:project_jp/Utils/Utils.dart';
import 'package:project_jp/view/LoginScreen.dart';

class SignUpViewModel {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isManager = false;
  final locationController = TextEditingController();
  final cityController = TextEditingController();
  String? bloodGroup;
  final auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  bool loading = false;

  authSignUp(
    BuildContext context,
  ) async {
    loading = true;
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) async {
        await _db.collection('users').doc(value.user!.uid).set({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'isManager': isManager,
          'Location': locationController.text.trim(),
          "City": cityController.text.trim(),
          "Blood Group": bloodGroup ?? "A",
          "Date": DateTime.now(),
          'uid': value.user!.uid,
        });
        Utils.toastMessage("SIGNED UP SUCESSFULLY");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    } catch (e) {
      loading = false;
      AuthException.authExceptionToast(e.toString());
    }
  }
}
