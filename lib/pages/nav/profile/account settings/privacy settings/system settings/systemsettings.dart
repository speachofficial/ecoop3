import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/colors.dart';
import '../../../../../../widgets/arrowback.dart';
import '../../../../../../widgets/bigtext.dart';
import '../../../../../../widgets/smalltext.dart';

class MainSystemSettingsPageContent extends StatefulWidget {
  const MainSystemSettingsPageContent({super.key});

  @override
  State<MainSystemSettingsPageContent> createState() =>
      _MainSystemSettingsPageContentState();
}

class _MainSystemSettingsPageContentState
    extends State<MainSystemSettingsPageContent> {
  bool _allowaccesstocontactlist = true;
  bool _allowaccesstomicrophone = true;
  bool _allowaccesstophotoalbum = true;
  bool _allowaccesstocamera = true;
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
                text: 'System Settings',
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
                text: 'Allow access to contact list',
                size: 57.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c333333_100,
              ),
              trailing: CupertinoSwitch(
                  value: _allowaccesstocontactlist,
                  onChanged: (bool value) {
                    setState(() {
                      _allowaccesstocontactlist = value;
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
                    text: 'Allow access to microphone',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _allowaccesstomicrophone,
                      onChanged: (bool value) {
                        setState(() {
                          _allowaccesstomicrophone = value;
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
                    text: 'Allow access to photo album',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _allowaccesstophotoalbum,
                      onChanged: (bool value) {
                        setState(() {
                          _allowaccesstophotoalbum = value;
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
                    text: 'Allow access to camera',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _allowaccesstocamera,
                      onChanged: (bool value) {
                        setState(() {
                          _allowaccesstocamera = value;
                        });
                      })),
            ),
          ],
        ),
      ),
    ]);
  }
}
