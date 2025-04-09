import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
// import 'package:hamakapp/featsure/homescr/pages/homepage.dart';
// import 'package:hamakapp/featsure/notification/pages/scren.dart';
import 'package:hamakapp/featsure/notification/serves/notification_serves.dart';
import 'package:hamakapp/featsure/programscr/pages/programscr.dart';
import 'package:timezone/data/latest.dart' as tz;
// import 'package:hamakapp/featsure/homescr/pages/homepage.dart';

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
    return ScreenUtilInit(
      designSize: Size(1080, 2340),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            fontFamily: 'BonaNovaSC-Bold',
            splashColor: AppColor.splashColor,
            focusColor: AppColor.splashColor,
            hoverColor: AppColor.backSearchscr),
        debugShowCheckedModeBanner: false,
        home: WeeklyProgram(),
      ),
    );
  }
}

//?  make a notification     ===== DONE   But some issue not work   
//* later 
//? add a time and date picker  ===== DONE , as a select and but is done but linke it to noti
//*later 

//? make a celender ui   == DONE ALL THIS SO DONT NEDD ANY THING ELSE 


//+ botton nav bar
//+ add data
