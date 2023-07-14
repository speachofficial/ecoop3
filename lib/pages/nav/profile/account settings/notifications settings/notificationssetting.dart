import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/smalltext.dart';

class MainNotificationsSettingsPageContent extends StatefulWidget {
  const MainNotificationsSettingsPageContent({super.key});

  @override
  State<MainNotificationsSettingsPageContent> createState() =>
      _MainNotificationsSettingsPageContentState();
}

class _MainNotificationsSettingsPageContentState
    extends State<MainNotificationsSettingsPageContent> {
  bool _pushnotifications = true;
  bool _notificationssound = true;
  bool _chats = true;
  bool _promotion = true;
  bool _openhours = true;
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
                text: 'Notification Settings',
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
                text: 'Push Notifications',
                size: 57.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c333333_100,
              ),
              trailing: CupertinoSwitch(
                  value: _pushnotifications,
                  onChanged: (bool value) {
                    setState(() {
                      _pushnotifications = value;
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
                    text: 'Notification Sound',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _notificationssound,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationssound = value;
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
                  text: 'Ringtone',
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
      SizedBox(
        height: 32.h,
      ),
      Padding(
        padding: EdgeInsets.all(50.h),
        child: SmallText(
          text: 'My Notification',
          size: 50.sp,
          fontWeight: FontWeight.w500,
        ),
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
                    text: 'Chats',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _chats,
                      onChanged: (bool value) {
                        setState(() {
                          _chats = value;
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
                    text: 'Promotion',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _promotion,
                      onChanged: (bool value) {
                        setState(() {
                          _promotion = value;
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
                    text: 'Open Hours',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _openhours,
                      onChanged: (bool value) {
                        setState(() {
                          _openhours = value;
                        });
                      })),
            ),
          ],
        ),
      ),
    ]);
  }
}
