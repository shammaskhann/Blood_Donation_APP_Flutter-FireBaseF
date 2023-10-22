import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_jp/Utils/Utils.dart';
import 'package:project_jp/resources/Colors.dart';
import 'package:project_jp/view/LoginScreen.dart';
import 'package:project_jp/viewmodel/DonorDetailViewModel.dart';
import 'package:project_jp/viewmodel/LogoutScreen.dart';
import 'package:project_jp/viewmodel/homeviewmodel.dart';

import 'DonorDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            "ALL DONORS",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut();
                  Utils.toastMessage("LOGOUT SUCESSFULLY");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: FutureBuilder(
            future: homeViewModel.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List allUser = snapshot.data!.docs.toList();
                return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) {
                    if (allUser[index]['isManager'] == true) {
                      return const SizedBox.shrink();
                    }
                    DateTime date = allUser[index]['Date'].toDate();
                    String formattedDate =
                        "${date.day}/${date.month}/${date.year}";
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => DonorDetailScreen(
                                  name: allUser[index]['name'],
                                  city: allUser[index]['City'],
                                  phoneNumber: allUser[index]['Location'],
                                  formattedDate: formattedDate,
                                  bloodgroup: allUser[index]['Blood Group'],
                                  uid: allUser[index]['uid'],
                                )),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.errorRed),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(allUser[index]['name']),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        allUser[index]['Blood Group'],
                                        style: const TextStyle(
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(allUser[index]['City']),
                                Text(allUser[index]['Location']),
                                Text(formattedDate),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              if (ConnectionState == ConnectionState.waiting) {
                try {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } catch (e) {
                  print("Error: $e");
                }
              }
              return const Center(
                child: Text("No Donors Found"),
              );
            }));
  }
}
