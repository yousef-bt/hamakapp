import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hamakapp/core/theme/app_colors.dart';
import 'package:hamakapp/featsure/homescr/cubit/zoom_drawer_widget_cubit.dart';

class CustFloatactionbutton extends StatelessWidget {
  const CustFloatactionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(
        eccentricity: 0.2,
      ),
      onPressed: () async {
        final drawer = ZoomDrawer.of(context)!;
        final isOpen = await drawer.isOpen(); // ✅ انتظر النتيجة الفعلية
        drawer.toggle(); // بعد الحصول على القيمة الفعلية، قم بالتبديل
        context
            .read<ZoomDrawerWidgetCubit>()
            .drawerState(!isOpen); // إرسال القيمة العكسية للحالة الحالية
        print("########################## in the button $isOpen");
      },
      backgroundColor: AppColor.primarycolor,
      tooltip: "القائمة",
      focusColor: Colors.white,
      child: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
