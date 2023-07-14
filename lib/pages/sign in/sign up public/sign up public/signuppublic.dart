import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import 'signuppublic_body.dart';

class MainSignUpPage1 extends StatefulWidget {
  const MainSignUpPage1({super.key});

  @override
  State<MainSignUpPage1> createState() => _MainSignUpPage1State();
}

class _MainSignUpPage1State extends State<MainSignUpPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32.h),
          child: Column(
            children: [
              const MyBackButton(),
              SizedBox(
                height: 234.h,
              ),
              SizedBox(
                width: 920.w,
                child: Column(
                  children: [
                    BigText(
                      text: 'Let\'s create your account',
                      size: 75.sp,
                    ),
                    SizedBox(
                      height: 135.h,
                    ),
                    const SignUp1Body()
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
