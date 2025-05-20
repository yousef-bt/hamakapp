import 'package:flutter/material.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/core/theme/app_txtstyle.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.lable = " ",
    this.icon = Icons.menu,
    // this.onPressed ,
  });
  final String lable;
  final IconData icon;
  // final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          iconSize: 32,
          color: AppColor.iconcolor,
        ),
        Text(
          lable,
          style: AppTxtstyle.bold.copyWith(color: AppColor.iconcolor),
        )
      ],
    );
  }
}
