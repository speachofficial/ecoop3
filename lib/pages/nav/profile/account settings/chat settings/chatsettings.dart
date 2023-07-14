import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/smalltext.dart';

class MainChatSettingsPageContent extends StatefulWidget {
  const MainChatSettingsPageContent({super.key});

  @override
  State<MainChatSettingsPageContent> createState() =>
      _MainChatSettingsPageContentState();
}

class _MainChatSettingsPageContentState
    extends State<MainChatSettingsPageContent> {
  bool _acceptchatfromprofilepage = true;
  bool _messageshortcuts = true;
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
                text: 'Chat Settings',
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
                text: 'Accept Chat From Profile Page',
                size: 57.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c333333_100,
              ),
              trailing: CupertinoSwitch(
                  value: _acceptchatfromprofilepage,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptchatfromprofilepage = value;
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
                    text: 'Message Shortcuts',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: CupertinoSwitch(
                      value: _messageshortcuts,
                      onChanged: (bool value) {
                        setState(() {
                          _messageshortcuts = value;
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
                  text: 'Edit Message Shortcut',
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
