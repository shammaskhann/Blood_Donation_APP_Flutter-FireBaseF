import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_jp/resources/Colors.dart';
import 'package:project_jp/view/HomeScreen.dart';
import 'package:project_jp/viewmodel/DonorEditViewModel.dart';
import 'package:project_jp/widgets/CustomButton.dart';

class DonorEditDetailScreen extends StatefulWidget {
  final uid;
  const DonorEditDetailScreen({required this.uid, super.key});

  @override
  State<DonorEditDetailScreen> createState() => _DonorEditDetailScreenState();
}

class _DonorEditDetailScreenState extends State<DonorEditDetailScreen> {
  DonorEditViewModel donorEditViewModel = DonorEditViewModel();
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    donorEditViewModel.getDetail(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.primaryColor,
          title: const Text('EDIT DONOR DETAILS'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ENTER NAME",
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Enter Your Name"),
                        controller: donorEditViewModel.nameController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "ENTER CITY",
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: "Enter Your City"),
                        controller: donorEditViewModel.cityController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter City';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "ENTER Location",
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Your Location"),
                        controller: donorEditViewModel.locationController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Location';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Last Donation Date",
                        textAlign: TextAlign.start,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Your Last Donation Date"),
                        controller: donorEditViewModel.dateController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("BLOOD GROUP",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ChoiceChip(
                              onSelected: (value) {
                                donorEditViewModel.bloodGroup = "A";
                                setState(() {});
                              },
                              label: const Text("A"),
                              selected: (donorEditViewModel.bloodGroup == "A")
                                  ? true
                                  : false),
                          ChoiceChip(
                              onSelected: (value) {
                                donorEditViewModel.bloodGroup = "B";
                                setState(() {});
                              },
                              label: const Text("B"),
                              selected: (donorEditViewModel.bloodGroup == "B")
                                  ? true
                                  : false),
                          ChoiceChip(
                              onSelected: (value) {
                                donorEditViewModel.bloodGroup = "AB";
                                setState(() {});
                              },
                              label: const Text("AB"),
                              selected: (donorEditViewModel.bloodGroup == "AB")
                                  ? true
                                  : false),
                          ChoiceChip(
                              onSelected: (value) {
                                donorEditViewModel.bloodGroup = "O";
                                setState(() {});
                              },
                              label: const Text("O"),
                              selected: (donorEditViewModel.bloodGroup == "O")
                                  ? true
                                  : false)
                        ],
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    title: "SAVE",
                    loading: false,
                    onPressed: () {
                      donorEditViewModel.saveDetails(widget.uid);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    })
              ],
            ),
          ),
        ));
  }
}
