import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/smalltext.dart';

class MainAccountAndSecurityPageContent extends StatefulWidget {
  const MainAccountAndSecurityPageContent({super.key});

  @override
  State<MainAccountAndSecurityPageContent> createState() =>
      _MainProfileSettingsPageContentState();
}

class _MainProfileSettingsPageContentState
    extends State<MainAccountAndSecurityPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(
          top: 32.h,
        ),
        child: Stack(children: [
          const MyBackButton(),
          Align(
              alignment: Alignment.center,
              child: BigText(
                text: 'Account & Security',
                size: 64.sp,
                color: AppColors.c333333_100,
              ))
        ]),
      ),
      SizedBox(
        height: 150.h,
      ),
      Container(
        width: 1620.w,
        decoration: const BoxDecoration(
          color: AppColors.cFFFFFF_100,
          boxShadow: [
            BoxShadow(
              color: AppColors.c000000_25,
              spreadRadius: 2,
              blurRadius: 25,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: SmallText(
                  text: 'My Profile',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.sp,
                ),
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: SmallText(
                  text: 'Username',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.sp,
                ),
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: 'Phone',
                      size: 57.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c333333_100,
                    ),
                    SmallText(
                      text: '+6013*******',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c333333_100,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.sp,
                ),
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: 'Email',
                      size: 57.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c333333_100,
                    ),
                    SmallText(
                      text: 'M***********N@gmail.com',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.c333333_100,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.sp,
                ),
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: SmallText(
                  text: 'Change Password',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
