import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/Utils.dart';

class DonorDetailViewModel {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Future<bool> isManager() async {
    final user = auth.currentUser;
    DocumentSnapshot snapshot =
        await db.collection("users").doc(user!.uid).get();
    bool isManager = snapshot.get("isManager");
    log(isManager.toString());
    return isManager;
  }

  makeCall(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Utils.toastMessage("Could not make call");
    }
  }
}
