import 'package:flutter/material.dart';
import 'package:hamakapp/const/app_colors.dart';
import 'package:hamakapp/featsure/notification/pages/scren.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:hamakapp/featsure/homescr/pages/homepage.dart';
import 'package:hamakapp/featsure/notification/serves/notification_serves.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'BonaNovaSC-Bold',
          splashColor: AppColor.splashColor,
          focusColor: AppColor.splashColor,
          hoverColor: AppColor.backSearchscr),
      debugShowCheckedModeBanner: false,
      home: NotificationSchedulerScreen(),
    );
  }
}


//+  make a notification 
//+ add a time and date to noti
