import 'package:k_body_analysis/app/config/constant.dart';
import 'package:k_body_analysis/app/module/dashboard/views/dashboard_view.dart';
import 'package:k_body_analysis/app/module/home/controllers/home_controller.dart';
import 'package:k_body_analysis/app/module/result/views/result_view.dart';
import 'package:k_body_analysis/app/module/setting/views/setting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PersistentTabView(
            context,
            controller: controller.persistentTabcontroller,
            screens: [
              DashBoardView(),
              ResultView(),
              SettingView(),
            ],
            items: [
              PersistentBottomNavBarItem(
                icon: Icon(Icons.home_rounded),
                title: ("홈"),
                textStyle: TextStyle(fontSize: 10),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white60,
              ),
              PersistentBottomNavBarItem(
                icon: Icon(Icons.report_outlined),
                title: ("기록"),
                textStyle: TextStyle(fontSize: 10),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white60,
              ),
              PersistentBottomNavBarItem(
                icon: Icon(Icons.more_horiz),
                textStyle: TextStyle(fontSize: 10),
                title: ("더보기"),
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: Colors.white60,
              ),
            ],
            confineInSafeArea: true,
            backgroundColor: PRIMARY_COLOR, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style6, // Choose the nav bar style with this property.
          ),
        ],
      ),
    );
  }
}
