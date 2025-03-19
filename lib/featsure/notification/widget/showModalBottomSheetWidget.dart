// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamakapp/core/theme/app_colors.dart';

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
        8.verticalSpace,
        Container(
          width: double.infinity,
          height: 30.h,
          color: AppColor.primarycolor,
        ),
      ],
    );
  }
}
