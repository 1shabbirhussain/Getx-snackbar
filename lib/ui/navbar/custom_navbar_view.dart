// scaffold_widget.dart


import 'package:asdfg/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:asdfg/ui/auction/auction_view.dart';
import 'package:asdfg/ui/history/history_view.dart';
import 'package:asdfg/ui/home/home_view.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../drawer/drawer_controller.dart';

class CustomNavbar extends StatelessWidget {
  final CustomDrawerController controller = Get.find();

   CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Advanced Drawer Example'),
        leading: IconButton(
          onPressed: controller.handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: controller.advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),
      ),

      body: PageView(
        controller: controller.pageController!,
        onPageChanged: controller.onPageChanged,
        children: [
          HomeScreen(),
          AuctionView(),
          HistoryView(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar:Obx(() => Container(
        // decoration: BoxDecoration(
        //   color: Colors.transparent,
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //     blurRadius: 20,
        //   //     // color: Colors.grey.withOpacity(.8),
        //   //   )
        //   // ],
        // ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: MyColors.black38,
              hoverColor: MyColors.redHighlight,
              gap: 6,
              activeColor: MyColors.blueBg,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: MyColors.lightBlueBg.withOpacity(0.05),
              color: MyColors.black100,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.gavel,
                  text: 'Auctions',
                ),
                GButton(
                  icon: LineIcons.history,
                  text: 'Notif',
                ),
                GButton(
                  icon: LineIcons.bell,
                  text: 'Notif',
                ),
              ],
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) {
                controller.pageController!.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  
                );
              },
              
            ),
          ),
        ),
      ),),
    );
  }
}

// i have separate screen widgets for each tab
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.amber,
//       child: Center(
//         child: Text('Home Screen'),
//       ),
//     );
//   }
// }

// class LikesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Likes Screen'),
//     );
//   }
// }

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
