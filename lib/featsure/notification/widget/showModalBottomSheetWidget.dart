// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamakapp/featsure/notification/cubit/date_and_time_picker_cubit.dart';
import 'package:hamakapp/featsure/notification/serves/notification_serves.dart';

class ShowmodalbottomsheetContentwidget extends StatelessWidget {
  const ShowmodalbottomsheetContentwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateAndTimePickerCubit(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // زر اختيار التاريخ
            BlocBuilder<DateAndTimePickerCubit, DateAndTimePickerState>(
              builder: (context, state) {
                final currentContext = context;
                // String formattedDate = "lalala ";
                DateTime? selectedDate;
                if (state is NotificationSelected) {
                  selectedDate = state.selectedDate;
                }
                return ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: currentContext,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null || currentContext.mounted) {
                      // ignore: use_build_context_synchronously
                      currentContext
                          .read<DateAndTimePickerCubit>()
                          .setDate(pickedDate!);
                    }

                    // formattedDate = DateFormat.yMMMMd().format(selectedDate!);
                    debugPrint("==========  FORMATED THE DATE ====== ");
                  },
                  child: Text(
                    selectedDate == null ? " اختر التاريخ" : " تاريخ: ",
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            // زر اختيار الوقت
            BlocBuilder<DateAndTimePickerCubit, DateAndTimePickerState>(
              builder: (context, state) {
                final currentContext = context;
                TimeOfDay? selectedTime;
                if (state is NotificationSelected) {
                  selectedTime = state.selectedTime;
                }
                return ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: currentContext,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null || currentContext.mounted) {
                      // ignore: use_build_context_synchronously
                      currentContext
                          .read<DateAndTimePickerCubit>()
                          .setTime(pickedTime!);
                    }
                  },
                  child: Text(
                    selectedTime == null
                        ? "⏰ اختر الوقت"
                        : "⏰ وقت: ${selectedTime.format(context)}",
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            // زر جدولة الإشعار
            BlocBuilder<DateAndTimePickerCubit, DateAndTimePickerState>(
              builder: (context, state) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<DateAndTimePickerCubit>()
                          .scheduleNotification(context);
                      NotificationService.showInstantNotification(
                          "Donr", " you set a time  ");
                    },
                    child: Text("✅ جدولة الإشعار"),
                  ),
                );
              },
            ),

            // عرض الأخطاء إن وجدت
            BlocBuilder<DateAndTimePickerCubit, DateAndTimePickerState>(
              builder: (context, state) {
                if (state is NotificationError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "⚠️ ${state.message}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
