import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/smalltext.dart';
import '../onboarding public/onbordingpublic_bg.dart';
import 'signin_body.dart';

class MainSignInPageContent extends StatefulWidget {
  const MainSignInPageContent({super.key});

  @override
  State<MainSignInPageContent> createState() => _MainSignInPageContentState();
}

class _MainSignInPageContentState extends State<MainSignInPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 109.h,
                margin: EdgeInsets.all(32.h),
                child: Image.asset(
                  'assets/images/ecoopmart.png',
                ),
              ),
            ),
            SizedBox(
              height: 781.h,
            ),
            BigText(
              text: 'Sign In',
              size: 75.sp,
            ),
            SizedBox(
              height: 76.h,
            ),
            const SignInBody(),
            SizedBox(
              height: 194.h,
            ),
            Container(
              height: 3.h,
              width: 920.w,
              color: AppColors.c000000_25,
            ),
            SizedBox(
              height: 102.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Don’t have an account? ',
                  color: AppColors.c000000_80,
                  size: 32.sp,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainOnBoardingPage()),
                    );
                  },
                  child: SmallText(
                    text: 'Sign Up',
                    size: 32.sp,
                    color: AppColors.c3B8CF4_100,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
