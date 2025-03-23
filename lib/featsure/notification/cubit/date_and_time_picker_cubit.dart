import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamakapp/featsure/notification/serves/notification_serves.dart';
part 'date_and_time_picker_state.dart';

class DateAndTimePickerCubit extends Cubit<DateAndTimePickerState> {
  DateAndTimePickerCubit() : super(DateAndTimePickerInitial());

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void setDate(DateTime date) {
    _selectedDate = date;
    emit(NotificationSelected(
        selectedDate: _selectedDate, selectedTime: _selectedTime));
  }

  void setTime(TimeOfDay time) {
    _selectedTime = time;
    emit(NotificationSelected(
        selectedDate: _selectedDate, selectedTime: _selectedTime));
  }

  void scheduleNotification(BuildContext context) {
    if (_selectedDate == null || _selectedTime == null) {
      emit(NotificationError(message: " الرجاء اختيار التاريخ والوقت."));
      return;
    }

    DateTime scheduledDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    if (scheduledDateTime.isBefore(DateTime.now())) {
      emit(NotificationError(message: " لا يمكنك جدولة إشعار في وقت سابق!"));
      return;
    }

    emit(NotificationScheduled(scheduledDateTime: scheduledDateTime));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(" تم جدولة الإشعار في: $scheduledDateTime")),
    );
    NotificationService.scheduleDailyInstantNotification(
        scheduleDate: scheduledDateTime);
  }
}
