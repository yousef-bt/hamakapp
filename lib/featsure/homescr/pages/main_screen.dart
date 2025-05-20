import 'package:flutter/material.dart';
import 'package:hamakapp/core/appwidget/cust_floatactionbutton.dart';
import 'package:hamakapp/core/constant/app_image.dart';
import 'package:hamakapp/core/theme/app_colors.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backSearchscr,
      appBar: AppBar(
        backgroundColor: AppColor.seccolor,
        title: Text(
          "كلية الهندسة الميكانيكية والكهربائية",
        ),
        centerTitle: true,
      ),

      body: InteractiveViewer(
        constrained: false,
        minScale: 0.1,
        maxScale: 0.8,
        child: Image.asset(
          AppImage.map,
          filterQuality: FilterQuality.high,
        ),
      ),

      //- float button
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustFloatactionbutton(),
    );
  }
}
