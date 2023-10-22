import 'package:flutter/material.dart';

import '../resources/Colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const CustomButton(
      {required this.title,
      required this.loading,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: (loading)
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
