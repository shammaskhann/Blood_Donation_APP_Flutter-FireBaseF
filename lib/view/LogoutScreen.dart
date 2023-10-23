import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_jp/view/LoginScreen.dart';
import 'package:project_jp/viewmodel/LogoutViewModel.dart';
import 'package:project_jp/widgets/CustomButton.dart';
import 'package:shimmer/shimmer.dart';
import '../Utils/Utils.dart';
import '../resources/Colors.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutViewModel logoutViewModel = LogoutViewModel();
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ]),
                child: FutureBuilder(
                    future: logoutViewModel.getInfo(),
                    builder: (context, snapshot) {
                      log(snapshot.data.toString());
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("MANAGER PROFILE",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    )),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text('Example Example'),
                                const Divider(),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text('Example '),
                                const Divider(),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text('03213213123'),
                                const Divider(),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              (snapshot.data['isManager'])
                                  ? Text("MANAGER PROFILE",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ))
                                  : Text("USER PROFILE",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      )),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(snapshot.data['name']),
                              const Divider(),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(snapshot.data['City']),
                              const Divider(),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(snapshot.data['Phone Number']),
                              const Divider(),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    })),
          ),
          Positioned(
            bottom: -10,
            right: 15,
            left: 15,
            child: CustomButton(
                title: "LogOut",
                loading: false,
                onPressed: () {
                  auth.signOut();
                  Utils.toastMessage("LOGOUT SUCESSFULLY");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          )
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }
}
