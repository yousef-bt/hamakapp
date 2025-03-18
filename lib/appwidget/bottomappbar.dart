// import 'package:flutter/material.dart';
// import 'package:hamak/const/app_colors.dart';

// // ignore: must_be_immutable
// class Bottomappbar extends StatelessWidget {
//   Bottomappbar({super.key, required this.chiled});
//   Widget chiled;

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 5.0,
//       clipBehavior: Clip.hardEdge,
//       height: MediaQuery.of(context).size.height * 0.07,
//       color: AppColor.primarycolor,
//       shadowColor: AppColor.primarycolor,
//       child: BottomNavigationBar(items: [
        
//       ]),
//     );
//   }
// }

// // ignore: must_be_immutable
// class BottomBar extends StatelessWidget {
//   BottomBar({
//     super.key,
//     required this.iconbottom,
//     required this.hint,
//   });

//   IconData iconbottom;
//   String hint;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               tooltip: hint,
//               onPressed: () {},
//               icon: Icon(
//                 iconbottom,
//                 color: AppColor.iconcolor,
//                 size: 30,
//               ),
//             ),
//             const Spacer()
//           ],
//         ),
//       ),
//     );
//   }
// }
