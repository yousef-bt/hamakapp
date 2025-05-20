import 'package:flutter/material.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/core/theme/app_txtstyle.dart';
import 'package:hamakapp/featsure/homescr/widget/moudle/custum_Zoom_Drawer_mudel.dart';

class MenuPage extends StatelessWidget {
  const MenuPage(
      {super.key, required this.currentItem, required this.onSelectedItem});
  final MenuItemData currentItem;
  final ValueChanged<MenuItemData> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, AppColor.seccolor, Colors.transparent],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...MenuItems.all.map(bulidMenuItem),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bulidMenuItem(MenuItemData item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          splashColor: AppColor.splashColor,
          onTap: () => onSelectedItem(item),
          child: Column(
            children: [
              Icon(
                item.icon,
                size: 32,
                color: currentItem == item
                    ? AppColor.primarycolor
                    : AppColor.iconcolor,
              ),
              Text(
                item.text,
                style: AppTxtstyle.bold.copyWith(
                    color: currentItem == item
                        ? AppColor.primarycolor
                        : AppColor.iconcolor),
              )
            ],
          ),
        ),
      );
}
