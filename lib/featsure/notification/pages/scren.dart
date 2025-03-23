import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamakapp/featsure/notification/cubit/date_and_time_picker_cubit.dart';
import 'package:hamakapp/featsure/notification/widget/showmodalbottomsheetwidget.dart';
// import 'package:intl/intl.dart';

class NotificationSchedulerScreen extends StatelessWidget {
  const NotificationSchedulerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DateAndTimePickerCubit(),
        child: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => ShowmodalbottomsheetContentwidget(),
              ),
              child: Text("ADD "),
            )
          ],
        )));
  }
}
