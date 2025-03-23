import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Programscr extends StatelessWidget {
  const Programscr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DayView(
        controller: EventController(),
      ),
    );
  }
}
