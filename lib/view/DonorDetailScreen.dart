import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_jp/resources/Colors.dart';
import 'package:project_jp/view/DonorEditDetailScreen.dart';
import 'package:project_jp/viewmodel/DonorDetailViewModel.dart';
import 'package:project_jp/viewmodel/homeviewmodel.dart';
import 'package:project_jp/widgets/CustomButton.dart';

import '../widgets/CustomMidButton.dart';

class DonorDetailScreen extends StatefulWidget {
  final String name;
  final String city;
  final String phoneNumber;
  final String formattedDate;
  final String bloodgroup;
  final uid;
  const DonorDetailScreen(
      {required this.name,
      required this.city,
      required this.phoneNumber,
      required this.formattedDate,
      required this.bloodgroup,
      required this.uid,
      super.key});

  @override
  State<DonorDetailScreen> createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  final auth = FirebaseAuth.instance;
  DonorDetailViewModel donorDetailViewModel = DonorDetailViewModel();

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = auth.currentUser;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primaryColor,
          title: const Text("DONOR DETAIL"),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 45.0, horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(widget.city),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(widget.phoneNumber),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(widget.formattedDate),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Blood Group'),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          widget.bloodgroup,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            FutureBuilder(
                future: donorDetailViewModel.isManager(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return const CircularProgressIndicator();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                            title: 'Call Now',
                            loading: false,
                            onPressed: () {}),
                      ),
                      (snapshot.data == true)
                          ? CustomMidButton(
                              title: 'Edit',
                              loading: false,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DonorEditDetailScreen(
                                                uid: widget.uid)));
                              })
                          : Container(),
                    ],
                  );
                }),
          ],
        ));
  }
}
