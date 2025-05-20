import 'package:flutter/material.dart';
import 'package:hamakapp/core/appwidget/cust_floatactionbutton.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/core/constant/app_text.dart';
import 'package:hamakapp/core/theme/app_txtstyle.dart';
import 'package:hamakapp/featsure/searchscr/moudle/model_data.dart';
import 'package:hamakapp/featsure/searchscr/widget/classroom_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //- float button
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: CustFloatactionbutton(),
        backgroundColor: AppColor.backSearchscr,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.seccolor,
          title: const Text(
            "HAMAK",
            style: AppTxtstyle.headingStyle,
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            final college = colleges[index];
            return Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                collapsedIconColor: AppColor.primarycolor,
                iconColor: AppColor.primarycolor,
                title: Text(college.collegeName, style: AppTxtstyle.bold),
                children: [
                  ExpansionTile(
                    collapsedIconColor: Colors.black,
                    iconColor: Colors.black,
                    title: Text(AppText.classRoom, style: AppTxtstyle.bold16),
                    children: college.classrooms.map((classroom) {
                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppColor.primarycolor,
                            context: context,
                            builder: (context) => ClassroomImage(
                              image: classroom.imageUrl,
                            ),
                          );
                        },
                        title: Text(classroom.name, style: AppTxtstyle.normal),
                      );
                    }).toList(),
                  ),
                  ExpansionTile(
                    collapsedIconColor: Colors.black,
                    iconColor: Colors.black,
                    title: Text(
                      "المخابر",
                      style: AppTxtstyle.bold16,
                    ),
                    children: college.labs.map((lab) {
                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppColor.primarycolor,
                            context: context,
                            builder: (context) => ClassroomImage(
                              image: lab.imageUrl,
                            ),
                          );
                        },
                        title: Text(
                          lab.name,
                          style: AppTxtstyle.normal,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 1,
          ),
          itemCount: colleges.length,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hamak/pages/searchscr/moudle/college_model.dart';
// import 'package:hamak/pages/searchscr/widget/classroom_image.dart';
// import 'package:hamak/const/app_colors.dart';
// import 'package:hamak/pages/searchscr/moudle/model_data.dart';

// // ignore: must_be_immutable
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: AppColor.backSearchscr,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColor.seccolor,
//           title: const Text(
//             "HAMAK",
//             style: TextStyle(color: AppColor.iconcolor),
//           ),
//           centerTitle: true,
//         ),
//         //*
//         body: ListView.separated(
//           itemBuilder: (context, index) {
//             final college = colleges[index];
//             return ExpansionTile(
//               // backgroundColor: Colors.yellow.shade600,
//               // collapsedBackgroundColor: AppColor.primarycolor,
//               // enableFeedback: true,
//               //- style
//               collapsedIconColor: AppColor.primarycolor,
//               iconColor: AppColor.primarycolor,
//               showTrailingIcon: true,

//               //-
//               title: Text(college.collegeName,
//                   style: const TextStyle(
//                     fontFamily: 'Bona_Nova_SC',
//                     fontWeight: FontWeight.bold,
//                   )),
//               // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
//               //* WANT TO KNOW HOW TO MAKE IT
//               children: college.classrooms.map((Classroom) {
//                 return ListTile(
//                   onTap: () {
//                     showModalBottomSheet(
//                       backgroundColor: AppColor.primarycolor,
//                       context: context,
//                       builder: (context) => ClassroomImage(
//                         image: Classroom.imageUrl,
//                       ),
//                     );
//                   },
//                   title: Text(
//                     Classroom.name,
//                     style: const TextStyle(
//                         fontFamily: 'Bona_Nova_SC',
//                         fontWeight: FontWeight.normal),
//                   ),
//                 );
//               }).toList(),
//             );
//           },
//           separatorBuilder: (context, index) => const SizedBox(
//             height: 1,
//           ),
//           itemCount: colleges.length,
//         ),
//       ),
//     );
//   }
// }
