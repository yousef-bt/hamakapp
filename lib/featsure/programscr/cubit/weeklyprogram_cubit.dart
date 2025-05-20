import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hamakapp/featsure/programscr/cubit/weeklyprogram_state.dart';

class WeeklyProgramCubit extends Cubit<WeeklyProgramState> {
  WeeklyProgramCubit()
      : super(WeeklyProgramState(
          lecturesName: [],
          programOfWeek: [
            {
              "dayName": "الأحد",
              "lectures": [],
            },
            {
              "dayName": "الإثنين",
              "lectures": [],
            },
            {
              "dayName": "الثلاثاء",
              "lectures": [],
            },
            {
              "dayName": "الأربعاء",
              "lectures": [],
            },
            {
              "dayName": "الخميس",
              "lectures": [],
            },
            {
              "dayName": "السبت",
              "lectures": [],
            },
          ],
        ));

  void addNewLecture(String lectureName) {
    final updatedList = List<String>.from(state.lecturesName)..add(lectureName);
    emit(state.copyWith(lecturesName: updatedList));
  }

  void editLecture(int index, String newName) {
    final updatedList = List<String>.from(state.lecturesName)
      ..[index] = newName;
    emit(state.copyWith(lecturesName: updatedList));
  }

  void addLectureToDay(
      int dayIndex, String name, String instructor, String time) {
    final newLecture = {
      "name": name,
      "instructor": instructor,
      "time": time,
      "color": _getStableColor(name),
    };

    final updatedProgram = List<Map<String, dynamic>>.from(state.programOfWeek);
    final lectures =
        List<Map<String, dynamic>>.from(updatedProgram[dayIndex]['lectures']);
    lectures.add(newLecture);
    updatedProgram[dayIndex]['lectures'] = lectures;

    emit(state.copyWith(programOfWeek: updatedProgram));
  }

  Color _getStableColor(String lectureName) {
    final colors = [
      const Color(0xFF5C1A4D),
      const Color(0xFF1C3D51),
      const Color(0xFF1C5129),
      const Color(0xFF511C1F),
      const Color(0xFF51471C),
      const Color(0xFF1C514F),
      const Color(0xFF2C1C51),
      const Color(0xFF3D511C),
      const Color(0xFF511C3A),
      const Color(0xFF4D1C51),
    ];

    int hash = lectureName.hashCode.abs();
    return colors[hash % colors.length];
  }

  Color getLectureColor(String lectureName) {
    for (var day in state.programOfWeek) {
      for (var lecture in day['lectures']) {
        if (lecture['name'] == lectureName) {
          return lecture['color'];
        }
      }
    }
    return _getStableColor(lectureName);
  }
}
