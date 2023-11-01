import 'package:akgsetu/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
/*
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
*/

import '../../common/utils/color_constants.dart';
import '../../common/utils/image_paths.dart';
import '../../common/utils/utility.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  PersistentTabController? _controller;
  bool? _hideNavBar;
  bool obscureText = true;

//  final LoginController loginScreenController = Get.put((LoginController()));

  List<Widget> _buildScreens(PersistentTabController? controller) {
    return [
          Container(),
      Container(),
      Container(),
      Container(),

    /*  HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),*/
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: bottomIconInActive(AppIcons.home),
        title: "",
        inactiveIcon: bottomIcon(AppIcons.home),
      ),
      PersistentBottomNavBarItem(
        icon: bottomIconInActive(AppIcons.calendar),
        title: "",
        inactiveIcon: bottomIcon(AppIcons.calendar),
      ),
      PersistentBottomNavBarItem(
        icon: bottomIconInActive(AppIcons.notification),
        title: "",
        inactiveIcon: bottomIcon(AppIcons.notification),
      ),
      PersistentBottomNavBarItem(
        icon: bottomIconInActive(AppIcons.profile),
        title: "",

        inactiveIcon: bottomIcon(AppIcons.profile),
      ),
    ];
  }

  Widget bottomIcon(icon) {
    return SvgPicture.asset(
      icon,
      height: 28.sp,
      color: AppColors.darkblue,
      width: 28.sp,
    );
  }

  Widget bottomIconInActive(icon) {
    return SvgPicture.asset(
      icon,
      height: 28.sp,
      color: AppColors.black44,
      width: 28.sp,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);


    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SizedBox(height: height, width: width, child:  PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: 56.sp,
        screens: _buildScreens(_controller),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        hideNavigationBarWhenKeyboardShows: true,
        /*margin: EdgeInsets.all(0.0),*/
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
      ),);
  }
}
