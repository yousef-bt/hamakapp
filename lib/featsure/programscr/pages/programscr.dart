import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamakapp/featsure/notification/cubit/date_and_time_picker_cubit.dart';
import 'package:hamakapp/featsure/programscr/cubit/weeklyprogram_cubit.dart';
import 'package:hamakapp/featsure/programscr/cubit/weeklyprogram_state.dart';

class WeeklyProgram extends StatelessWidget {
  const WeeklyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeeklyProgramCubit(),
        ),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text('برنامج الأسبوع')),
          body: BlocBuilder<WeeklyProgramCubit, WeeklyProgramState>(
            builder: (context, state) {
              final cubit = context.read<WeeklyProgramCubit>();
              return ListView.builder(
                itemCount: state.programOfWeek.length,
                itemBuilder: (context, dayIndex) {
                  final day = state.programOfWeek[dayIndex];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day['dayName'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 8),
                          if (day['lectures'].isNotEmpty)
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                    day['lectures'].map<Widget>((lecture) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: cubit
                                          .getLectureColor(lecture['name']),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        lecture['name'],
                                        style: TextStyle(color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          DropdownButton<String>(
                            hint: Text('اختر محاضرة لإضافتها'),
                            items: state.lecturesName.map((lecture) {
                              return DropdownMenuItem<String>(
                                value: lecture,
                                child: Text(lecture),
                              );
                            }).toList(),
                            onChanged: (selectedLecture) {
                              if (selectedLecture != null) {
                                _showLectureDetailsDialog(
                                    context, dayIndex, selectedLecture);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                String newLecture = '';
                final cubit = context
                    .read<WeeklyProgramCubit>(); // ✅ يستخدم context الصحيح هنا

                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      title: Text('إضافة محاضرة جديدة'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => newLecture = value,
                          decoration: InputDecoration(hintText: 'اسم المحاضرة'),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (newLecture.isNotEmpty) {
                              cubit.addNewLecture(newLecture);
                              Navigator.pop(dialogContext);
                            }
                          },
                          child: Text('إضافة'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showLectureDetailsDialog(
      BuildContext context, int dayIndex, String lectureName) {
    String instructor = '';
    String time = '';
    TimeOfDay? pickedTime;

    // 🟢 نستخدم context هنا من الواجهة الأصلية قبل الدخول للـ Dialog
    final cubit = context.read<WeeklyProgramCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('إضافة تفاصيل المحاضرة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('المحاضرة: $lectureName'),
              TextField(
                decoration: InputDecoration(labelText: 'اسم المحاضر'),
                onChanged: (value) => instructor = value,
              ),
              8.verticalSpace,
              BlocBuilder<DateAndTimePickerCubit, DateAndTimePickerState>(
                builder: (context, state) {
                  TimeOfDay? selectedTime;
                  if (state is NotificationSelected) {
                    selectedTime = state.selectedTime;
                    time = selectedTime?.format(context) ?? " ";
                  }

                  return InkWell(
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null && context.mounted) {
                        context
                            .read<DateAndTimePickerCubit>()
                            .setTime(pickedTime);
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 20,
                      child: Text(
                        selectedTime != null
                            ? " الوقت المحدد: ${selectedTime.format(context)}"
                            : "اختر الوقت",
                      ),
                    ),
                  );
                },
              )

              // TextField(
              //   decoration: InputDecoration(labelText: 'وقت المحاضرة'),
              //   onChanged: (value) => time = value,
              // ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                if (instructor.isNotEmpty && time.isNotEmpty) {
                  cubit.addLectureToDay(
                    dayIndex,
                    lectureName,
                    instructor,
                    time,
                  );

                  debugPrint(
                      "$lectureName ==== $instructor ==== $pickedTime ==== $time ");
                }
                Navigator.pop(dialogContext);
              },
              child: Text('إضافة'),
            ),
          ],
        );
      },
    );
  }
}
