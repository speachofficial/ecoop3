import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/smalltext.dart';

class MainPrivacySettingsPageContent extends StatefulWidget {
  const MainPrivacySettingsPageContent({super.key});

  @override
  State<MainPrivacySettingsPageContent> createState() =>
      _MainPrivacySettingsPageContentState();
}

class _MainPrivacySettingsPageContentState
    extends State<MainPrivacySettingsPageContent> {
  bool _privateactivies = true;
  bool _hidemylikes = true;
  bool _hidemyusername = true;
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
                text: 'Privacy Settings',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
          child: ListTile(
              title: SmallText(
                text: 'Private Activities',
                size: 57.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c333333_100,
              ),
              trailing: CupertinoSwitch(
                  value: _privateactivies,
                  onChanged: (bool value) {
                    setState(() {
                      _privateactivies = value;
                    });
                  })),
        ),
      ),
      SizedBox(
        height: 100.h,
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
                    text: 'Hide my likes',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _hidemylikes,
                      onChanged: (bool value) {
                        setState(() {
                          _hidemylikes = value;
                        });
                      })),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                  title: SmallText(
                    text: 'Hide my username',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _hidemyusername,
                      onChanged: (bool value) {
                        setState(() {
                          _hidemyusername = value;
                        });
                      })),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100.h,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
          child: ListTile(
            title: SmallText(
              text: 'System Settings',
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
      ),
    ]);
  }
}
