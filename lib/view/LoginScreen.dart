import 'package:flutter/material.dart';
import 'package:project_jp/viewmodel/loginviewmodel.dart';
import 'package:project_jp/widgets/CustomButton.dart';

import '../resources/Colors.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = LoginViewModel();
  bool isObsecure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
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
                              size: 55,
                            ),
                            Text("ZINDAGI",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
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
                top: 250,
                left: 30,
                right: 30,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
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
                          height: 50,
                        ),
                        const Text("LOGIN",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600)),
                        Form(
                            key: key,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email Address",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "abc@example.com"),
                                        controller:
                                            loginViewModel.emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Password",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      TextFormField(
                                        obscureText: isObsecure,
                                        controller:
                                            loginViewModel.passwordController,
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
                                )
                              ],
                            ))
                      ],
                    )),
              ),
              Positioned(
                  bottom: 80,
                  left: 30,
                  right: 30,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomButton(
                          title: "Sign In",
                          loading: loading,
                          onPressed: () async {
                            if (key.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              await loginViewModel
                                  .loginAuth(context)
                                  .then((value) {
                                setState(() {
                                  loading = false;
                                });
                              });
                            }
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("OR"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          title: "Sign Up",
                          loading: false,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          }),
                    ],
                  )),
            ],
          ),
        ));
  }
}
