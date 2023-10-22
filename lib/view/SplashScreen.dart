import 'package:flutter/material.dart';
import 'package:project_jp/resources/Colors.dart';
import 'package:project_jp/viewmodel/splashviewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashViewModel().splashTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
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
      backgroundColor: AppColors.primaryColor,
    );
  }
}
