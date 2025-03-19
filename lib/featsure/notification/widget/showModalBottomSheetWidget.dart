import 'package:flutter/material.dart';
import 'package:hamakapp/const/app_colors.dart';

class ShowmodalbottomsheetContentwidget extends StatelessWidget {
  const ShowmodalbottomsheetContentwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30,
          color: AppColor.primarycolor,
        ),
        SizedBox(height: 22),
        Container(
          width: double.infinity,
          height: 30,
          color: AppColor.primarycolor,
        ),
      ],
    );
  }
}
