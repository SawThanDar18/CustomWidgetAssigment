import 'package:custom_widget_assignment/pages/account_page.dart';
import 'package:custom_widget_assignment/pages/history_page.dart';
import 'package:custom_widget_assignment/pages/home_page.dart';
import 'package:custom_widget_assignment/pages/schedule_page.dart';
import 'package:custom_widget_assignment/resources/colors.dart';
import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentTab = 0;

  final List<Widget> screens = [
    const SchedulePage(),
    const HistoryPage(),
    const AccountPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SizedBox(
        width: BOTTOM_NAVIGATION_BAR_FAB_WIDTH,
        height: BOTTOM_NAVIGATION_BAR_FAB_HEIGHT,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => debugPrint("FloatingButton"),
            child: const Icon(
              Icons.add_circle,
              size: BOTTOM_NAVIGATION_BAR_FAB_ICON_SIZE,
              color: GRADIENT_END_COLOR,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: BOTTOM_NAVIGATION_APP_BAR_HEIGHT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: BOTTOM_NAVIGATION_BAR_MINI_WIDTH,
                onPressed: () {
                  setState(() {
                    currentScreen = const HomePage();
                    currentTab = 0;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE, color: currentTab == 0 ? GRADIENT_START_COLOR : Colors.grey,),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: BOTTOM_NAVIGATION_BAR_MINI_WIDTH,
                onPressed: () {
                  setState(() {
                    currentScreen = const SchedulePage();
                    currentTab = 1;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.event, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE, color: currentTab == 1 ? GRADIENT_START_COLOR : Colors.grey,),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: BOTTOM_NAVIGATION_BAR_MINI_WIDTH,
                onPressed: () {
                  setState(() {
                    currentScreen = const HistoryPage();
                    currentTab = 2;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.schedule, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE, color: currentTab == 2 ? GRADIENT_START_COLOR : Colors.grey,),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: BOTTOM_NAVIGATION_BAR_MINI_WIDTH,
                onPressed: () {
                  setState(() {
                    currentScreen = const AccountPage();
                    currentTab = 3;
                  },);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: BOTTOM_NAVIGATION_BAR_ICON_SIZE, color: currentTab == 3 ? GRADIENT_START_COLOR : Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
