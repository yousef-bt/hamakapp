part of 'date_and_time_picker_cubit.dart';

sealed class DateAndTimePickerState {}

final class DateAndTimePickerInitial extends DateAndTimePickerState {}

class NotificationSelected extends DateAndTimePickerState {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  NotificationSelected({this.selectedDate, this.selectedTime});
}

class NotificationScheduled extends DateAndTimePickerState {
  final DateTime scheduledDateTime;
  NotificationScheduled({required this.scheduledDateTime});
}

class NotificationError extends DateAndTimePickerState {
  final String message;
  NotificationError({required this.message});
}
