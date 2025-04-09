class WeeklyProgramState {
  final List<String> lecturesName;
  final List<Map<String, dynamic>> programOfWeek;

  WeeklyProgramState({
    required this.lecturesName,
    required this.programOfWeek,
  });

  WeeklyProgramState copyWith({
    List<String>? lecturesName,
    List<Map<String, dynamic>>? programOfWeek,
  }) {
    return WeeklyProgramState(
      lecturesName: lecturesName ?? this.lecturesName,
      programOfWeek: programOfWeek ?? this.programOfWeek,
    );
  }
}
