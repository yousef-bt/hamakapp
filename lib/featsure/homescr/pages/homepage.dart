import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hamakapp/featsure/homescr/cubit/zoom_drawer_widget_cubit.dart';
import 'package:hamakapp/featsure/homescr/pages/main_screen.dart';
import 'package:hamakapp/featsure/homescr/pages/menu_screen.dart';
import 'package:hamakapp/featsure/homescr/widget/moudle/custum_Zoom_Drawer_mudel.dart';
import 'package:hamakapp/featsure/programscr/pages/programscr.dart';
import 'package:hamakapp/featsure/searchscr/pages/search_screen.dart';
import 'package:motion/motion.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final drawerController = ZoomDrawerController();

  final motionController = MotionController();

  MenuItemData currentItem = MenuItems.map;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZoomDrawerWidgetCubit, ZoomDrawerWidgetState>(
      builder: (context, state) {
        return ZoomDrawer(
          drawerShadowsBackgroundColor: Colors.black,
          disableDragGesture: true,
          controller: drawerController,
          menuScreen: MenuPage(
            currentItem: state.currentItem,
            onSelectedItem: (item) async {
              final drawerCubit = context.read<ZoomDrawerWidgetCubit>();
              drawerCubit.selectMenuItem(item);
              await drawerController.close!();
              drawerCubit.drawerState(false);
            },
          ),
          mainScreen: state.isDrawerOpen
              ? Motion(
                  glare: GlareConfiguration(
                      color: Colors.white, maxOpacity: 0.0, minOpacity: 0.0),
                  shadow: ShadowConfiguration(topOffset: 0, blurRadius: 20),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  controller: motionController,
                  child: getScreen(state.currentItem),
                )
              : getScreen(state.currentItem),
          slideWidth: MediaQuery.of(context).size.width * 0.17,
          menuScreenWidth: double.infinity,
          angle: 0.0,
          openCurve: Curves.easeOut,
          duration: Duration(microseconds: 1000),
          closeCurve: Curves.easeIn,
          borderRadius: 24.r,
          reverseDuration: Duration(milliseconds: 1000),
        );
      },
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
