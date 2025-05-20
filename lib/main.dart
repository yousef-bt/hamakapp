import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/featsure/homescr/cubit/zoom_drawer_widget_cubit.dart';
import 'package:hamakapp/featsure/homescr/pages/homepage.dart';
import 'package:hamakapp/featsure/notification/cubit/date_and_time_picker_cubit.dart';
import 'package:hamakapp/featsure/notification/serves/notification_serves.dart';
// import 'package:hamakapp/featsure/programscr/pages/programscr.dart';
import 'package:motion/motion.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  /// Initialize the plugin. &
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);
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
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DateAndTimePickerCubit(),
          ),
          BlocProvider(
            create: (context) => ZoomDrawerWidgetCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'BonaNovaSC-Bold',
              splashColor: AppColor.splashColor,
              focusColor: AppColor.splashColor,
              hoverColor: AppColor.backSearchscr),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
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
