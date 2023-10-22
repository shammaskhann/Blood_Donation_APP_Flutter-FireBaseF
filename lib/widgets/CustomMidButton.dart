import 'package:flutter/material.dart';

import '../resources/Colors.dart';

class CustomMidButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const CustomMidButton(
      {required this.title,
      required this.loading,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor)),
          child: Center(
            child: (loading)
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
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
