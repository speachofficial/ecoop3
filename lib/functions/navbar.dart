import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/nav/chat/chat/chat_bg.dart';
import '../pages/nav/home/home_bg.dart';
import '../pages/nav/mall/mall_bg.dart';
import '../pages/nav/profile/profile_bg.dart';
import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex_ = 0;
  final screens = [
    const MainHomePage(),
    const MainMallPage(),
    const MainChatPage(),
    const MainProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex_,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 3.h, color: AppColors.c000000_25))),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(100.r)),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex_,
              onTap: (index) => setState(() => currentIndex_ = index),
              selectedItemColor: AppColors.cC8151D_100,
              unselectedItemColor: AppColors.c000000_30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 100.sp,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined), label: 'Mall'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: 'Account'),
              ]),
        ),
      ),
    );
  }
}
