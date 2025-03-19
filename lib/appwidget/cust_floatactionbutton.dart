import 'package:flutter/material.dart';
import 'package:hamakapp/const/app_colors.dart';

class CustFloatactionbutton extends StatelessWidget {
  const CustFloatactionbutton(
      {super.key,
      required this.onPressed,
      required this.hintTxt,
      required this.icon});

  final String hintTxt;
  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(
        eccentricity: 0.2,
      ),
      onPressed: () => onPressed(),
      backgroundColor: AppColor.primarycolor,
      tooltip: hintTxt,
      focusColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
