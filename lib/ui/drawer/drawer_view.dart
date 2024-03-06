
import 'package:asdfg/ui/navbar/custom_navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:asdfg/assets/colors.dart';
import 'package:get/get.dart';
import 'drawer_controller.dart';
import 'widgets/drawer_widget.dart';
// import '../navbar/custom_navbar_view.dart';

class DrawerView extends StatelessWidget {
  final CustomDrawerController controller = Get.put(CustomDrawerController());



  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
       // -------backdrop-----------
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [MyColors.blueBg ,MyColors.lightBlueBg.withOpacity(0.2)],
          ),
        ),
      ),
      controller:controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),

      drawer: DrawerWidget(),
      child: CustomNavbar(),
    );
  }
}
