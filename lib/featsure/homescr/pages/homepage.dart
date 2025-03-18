import 'package:flutter/material.dart';
import 'package:hamakapp/appwidget/cust_floatactionbutton.dart';
import 'package:hamakapp/const/app_colors.dart';
import 'package:hamakapp/const/app_image.dart';
import 'package:hamakapp/featsure/searchscr/pages/search_screen.dart';
// import 'package:hamak/appwidget/bottomappbar.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backSearchscr,
      appBar: AppBar(
        backgroundColor: AppColor.seccolor,
        title: const Text(
          "كلية الهندسة الميكانيكية والكهربائية",
          style:
              TextStyle(color: AppColor.iconcolor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: InteractiveViewer(
          constrained: false,
          minScale: 0.1,
          maxScale: 0.8,
          child: Image.asset(
            AppImage.map,
            filterQuality: FilterQuality.high,
          )),

      // bottomNavigationBar: Bottomappbar(
      //   chiled: BottomBar(iconbottom: Icons.sort, hint: "programig"),
      // ),
      //- float button
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustFloatactionbutton(
        hintTxt: "ابحث",
        icon: Icons.search,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ));
        },
      ),
    );
  }
}
