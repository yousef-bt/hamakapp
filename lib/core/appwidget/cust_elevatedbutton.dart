import 'package:flutter/material.dart';
import 'package:hamakapp/core/theme/app_colors.dart';

class CustElevatedButton extends StatelessWidget {
  CustElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.heigh = 25,
    this.radius = 14,
  });
  @immutable
  String text;
  VoidCallback onPressed;
  double heigh;
  double width;
  double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        backgroundColor: AppColor.primarycolor,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: AppColor.backSearchscr),
      ),
    );
  }
}
