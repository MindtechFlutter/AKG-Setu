import 'package:akgsetu/constants.dart';
import 'package:akgsetu/screens/attendance/attendance.dart';
import 'package:akgsetu/screens/home/active-task.dart';
import 'package:akgsetu/screens/home/home.dart';
import 'package:akgsetu/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Dashboard extends StatefulWidget {
  int? index;
  Dashboard({Key? key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  PersistentTabController? _controller;
  bool _hideNavBar = false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        HomePage(),
        AttendancePage(),
        ActiveTask(),
        ProfilePage(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home,
            size: 29,
          ),
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.calendar_month,
            size: 32,
          ),
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.notifications,
            size: 35,
          ),
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.account_circle_rounded,
            size: 32,
          ),
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : height(context) * 0.075,
          bottomScreenMargin: 0,

          selectedTabScreenContext: (final context) {},
          backgroundColor: Colors.white,
          hideNavigationBar: _hideNavBar,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style6, // Choose the nav bar style with this property
        ),
      );
}
