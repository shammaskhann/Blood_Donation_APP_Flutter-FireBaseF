import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutViewModel {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Future getInfo() async {
    Map info = {};
    final user = auth.currentUser;
    DocumentSnapshot snapshot =
        await db.collection("users").doc(user!.uid).get();
    String Name = snapshot.get('name');
    String City = snapshot.get('City');
    String PhoneNumber = snapshot.get('Phone Number');
    bool isManager = snapshot.get('isManager');
    return info = {
      "name": Name,
      "City": City,
      "Phone Number": PhoneNumber,
      "isManager": isManager,
    };
  }
}
