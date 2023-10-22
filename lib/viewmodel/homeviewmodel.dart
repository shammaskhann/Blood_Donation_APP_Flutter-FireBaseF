import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Future getAllUsers() {
    return db.collection("users").get();
  }
}
