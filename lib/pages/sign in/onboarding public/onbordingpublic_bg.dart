import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onbordingpublic.dart';

class MainOnBoardingPage extends StatelessWidget {
  const MainOnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/images/bgonboarding.png',
            fit: BoxFit.cover,
            width: 1620.w,
            height: 2160.h,
          ),
          const MainOnBoardingPageContent()
        ],
      )),
    );
  }
}
