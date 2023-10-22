import 'package:flutter/material.dart';
import 'package:project_jp/resources/Colors.dart';
import 'package:project_jp/viewmodel/signupviewmodel.dart';

import '../viewmodel/loginviewmodel.dart';
import '../widgets/CustomButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel signUpViewModel = SignUpViewModel();
  bool isObsecure = true;
  final key = GlobalKey<FormState>();
  final ChoiceChipKey = GlobalKey<FormState>();
  String? svalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        width: MediaQuery.sizeOf(context).width,
                        color: AppColors.primaryColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              color: AppColors.white,
                              size: 45,
                            ),
                            Text("ZINDAGI",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 30,
                                ))
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          width: MediaQuery.sizeOf(context).width,
                          color: AppColors.white),
                    ],
                  )),
              Positioned(
                top: 180,
                left: 30,
                right: 30,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("SIGN UP",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
                        Form(
                            key: key,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Name",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Your Name"),
                                      controller:
                                          signUpViewModel.nameController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email Address",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Your Email Adderss"),
                                      controller:
                                          signUpViewModel.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Email Address';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Password",
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      obscureText: isObsecure,
                                      controller:
                                          signUpViewModel.passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Your Password",
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isObsecure = !isObsecure;
                                              });
                                            },
                                            child: Icon(
                                              isObsecure
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.silverGray,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.isManager = false;
                                  setState(() {});
                                },
                                label: const Text("Donor"),
                                selected: !signUpViewModel.isManager),
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.isManager = true;
                                  setState(() {});
                                },
                                label: const Text("Manager"),
                                selected: signUpViewModel.isManager)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Location",
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Enter Your Address"),
                                controller: signUpViewModel.locationController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Address';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "City",
                                textAlign: TextAlign.start,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Enter Your City"),
                                controller: signUpViewModel.cityController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter City';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.bloodGroup = "A";
                                  setState(() {});
                                },
                                label: const Text("A"),
                                selected: (signUpViewModel.bloodGroup == "A")
                                    ? true
                                    : false),
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.bloodGroup = "B";
                                  setState(() {});
                                },
                                label: const Text("B"),
                                selected: (signUpViewModel.bloodGroup == "B")
                                    ? true
                                    : false),
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.bloodGroup = "AB";
                                  setState(() {});
                                },
                                label: const Text("AB"),
                                selected: (signUpViewModel.bloodGroup == "AB")
                                    ? true
                                    : false),
                            ChoiceChip(
                                onSelected: (value) {
                                  signUpViewModel.bloodGroup = "O";
                                  setState(() {});
                                },
                                label: const Text("O"),
                                selected: (signUpViewModel.bloodGroup == "O")
                                    ? true
                                    : false)
                          ],
                        ),
                      ],
                    )),
              ),
              Positioned(
                  bottom: 10,
                  left: 50,
                  right: 50,
                  child: CustomButton(
                      title: "Sign Up",
                      loading: signUpViewModel.loading,
                      onPressed: () {
                        signUpViewModel.authSignUp(context);
                      })),
            ],
          ),
        ));
  }
}
