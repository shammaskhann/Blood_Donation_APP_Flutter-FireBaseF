import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_jp/Utils/Utils.dart';

class DonorEditViewModel {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final cityController = TextEditingController();
  final dateController = TextEditingController();
  String? bloodGroup;
  final db = FirebaseFirestore.instance;

  void getDetail(String uid) async {
    DocumentSnapshot snapshot = await db.collection("users").doc(uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    nameController.text = data['name'];
    locationController.text = data['Phone Number'];
    cityController.text = data['City'];
    dateController.text = data['Date'].toDate().toString();
    bloodGroup = data['Blood Group'];
  }

  saveDetails(String uid) async {
    await db.collection("users").doc(uid).update({
      'name': nameController.text,
      'Location': locationController.text,
      'City': cityController.text,
      'Date': DateTime.parse(dateController.text),
      'Blood Group': bloodGroup,
    });
    Utils.toastMessage("PROFILE EDITED SUCESSFULLY");
  }
}
