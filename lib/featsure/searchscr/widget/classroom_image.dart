import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassroomImage extends StatelessWidget {
  const ClassroomImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(18.r)),
            child: Image.asset(image)),
      ),
    );
  }
}
