import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'signin.dart';

class MainSignInPage extends StatefulWidget {
  const MainSignInPage({super.key});

  @override
  State<MainSignInPage> createState() => _MainSignInPageState();
}

class _MainSignInPageState extends State<MainSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset('assets/images/bgsignin.png',
          alignment: Alignment.bottomCenter,
              fit: BoxFit.cover, width: 1620.w),
          const MainSignInPageContent(),
        ],
      )),
    );
  }
}
