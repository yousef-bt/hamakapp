import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamakapp/core/theme/app_colors.dart';

class AppTxtstyle {
  //! heading
  static const TextStyle headingStyle = TextStyle(
    fontSize:24,
    color: AppColor.backSearchscr,
    fontWeight: FontWeight.bold,
  );

  //! bold
  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  //! normal
  static const TextStyle normal = TextStyle(
    fontFamily: 'Bona_Nova_SC',
    fontWeight: FontWeight.normal,
  );

  //! Font Size 12

  //! Font Size 16
  static TextStyle bold16 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );

  //! Font Size 20
}
