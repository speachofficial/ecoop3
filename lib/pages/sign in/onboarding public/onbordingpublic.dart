import 'package:ecoop3/pages/sign%20in/sign%20up%20public/choose%20role%20public/chooserolepublic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/smalltext.dart';

class MainOnBoardingPageContent extends StatefulWidget {
  const MainOnBoardingPageContent({super.key});

  @override
  State<MainOnBoardingPageContent> createState() =>
      _MainOnBoardingPageContentState();
}

class _MainOnBoardingPageContentState extends State<MainOnBoardingPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.h),
      child: Column(
        children: [
          Container(
            height: 133.sp,
          ),
          SizedBox(
            height: 1088.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BigText(
                text: 'Welcome to E-coop!',
                color: AppColors.cFFFFFF_100,
                size: 100.sp,
              ),
              SizedBox(
                height: 47.h,
              ),
              SizedBox(
                width: 983.h,
                child: SmallText(
                  text:
                      'Coop now available digitally that will help parents to sell their pre-love item!',
                  color: AppColors.cFFFFFF_50,
                  fontWeight: FontWeight.w500,
                  size: 50.sp,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          SizedBox(
            height: 140.h,
          ),
          MyElevatedButton(
              text: 'Next',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainChoosingRolePage(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
