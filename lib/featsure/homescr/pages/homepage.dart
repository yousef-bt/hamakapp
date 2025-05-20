import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hamakapp/core/appwidget/cust_floatactionbutton.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/core/constant/app_image.dart';
import 'package:hamakapp/core/theme/app_txtstyle.dart';
import 'package:hamakapp/featsure/homescr/cubit/zoom_drawer_widget_cubit.dart';
import 'package:hamakapp/featsure/programscr/pages/programscr.dart';
import 'package:hamakapp/featsure/searchscr/pages/search_screen.dart';
import 'package:motion/motion.dart';
// import 'package:hamakapp/featsure/searchscr/pages/search_screen.dart';

//! this class to handel a navigation bewtwen screen
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final drawerController = ZoomDrawerController();
  final motionController = MotionController();

  MenuItemData currentItem = MenuItems.map;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ZoomDrawerWidgetCubit(),
      child: BlocBuilder<ZoomDrawerWidgetCubit, ZoomDrawerWidgetState>(
        builder: (context, state) {
          return ZoomDrawer(
            controller: drawerController,
            menuScreen: MenuPage(
              currentItem: state.currentItem,
              onSelectedItem: (item) {
                context.read<ZoomDrawerWidgetCubit>().selectMenuItem(item);
                drawerController.toggle!(); // Close the drawer
              },
            ),
            mainScreen: getScreen(state.currentItem),
            slideWidth: MediaQuery.of(context).size.width * 0.17,
            menuScreenWidth: double.infinity,
            // slideHeight:MediaQuery.of(context).size.height*0.0001 ,
            angle: 0.0,
            openCurve: Curves.easeOut,
            duration: Duration(microseconds: 1000),
            closeCurve: Curves.easeIn,
            borderRadius: 24.r,
            menuScreenTapClose: true,

            // slideHeight: 700,
          );
        },
      ),
    );
  }

  Widget getScreen(MenuItemData item) {
    switch (item) {
      case MenuItems.map:
        return Mainpage();
      case MenuItems.program:
        return WeeklyProgram();
      case MenuItems.search:
        return SearchScreen();
    }
    throw Exception('Unrecognized menu item: $currentItem');
  }
}

class MenuItemData {
  final String text;
  final IconData icon;
  const MenuItemData({required this.text, required this.icon});
}

class MenuItems {
  static const map = MenuItemData(text: "Home", icon: Icons.home);
  static const search = MenuItemData(text: "search", icon: Icons.search);
  static const program =
      MenuItemData(text: "program", icon: Icons.dataset_outlined);

  static const all = <MenuItemData>[map, search, program];
}

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
      floatingActionButton: CustFloatactionbutton(
        hintTxt: "ابحث",
        icon: Icons.menu,
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
      ),
    );
  }
}

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
          // الخلفية المتدرجة
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, AppColor.seccolor, Colors.transparent],
              ),
            ),
          ),
      
          // ✅ الكود الأصلي كما هو داخل الـ Padding
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...MenuItems.all.map(bulidMenuItem),
                  ],
                ),
              )
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
