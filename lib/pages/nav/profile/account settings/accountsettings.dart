import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/elevatedbutton.dart';
import '../../../../widgets/smalltext.dart';
import '../../../sign in/sign in /signin_bg.dart';
import 'account and security/accountandsecurity_bg.dart';
import 'bank account and cards/bankaccountandcards_bg.dart';
import 'chat settings/chatsettings_bg.dart';
import 'language/language_bg.dart';
import 'notifications settings/notificationssetting_bg.dart';
import 'privacy settings/privacysettings_bg.dart';

class MainAccountSettingsPageContent extends StatefulWidget {
  const MainAccountSettingsPageContent({super.key});

  @override
  State<MainAccountSettingsPageContent> createState() =>
      _MainAccountSettingsPageContentState();
}

class _MainAccountSettingsPageContentState
    extends State<MainAccountSettingsPageContent> {
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
                text: 'Account Settings',
                size: 64.sp,
                color: AppColors.c333333_100,
              ))
        ]),
      ),
      SizedBox(
        height: 150.h,
      ),
      Padding(
        padding: EdgeInsets.all(50.h),
        child: SmallText(
          text: 'My Account',
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MainAccountAndSecurityPage()),
                  );
                },
                title: SmallText(
                  text: 'Account & Security',
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MainBankAccountAndCardsPage()),
                  );
                },
                title: SmallText(
                  text: 'Bank Accounts / Cards',
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
          text: 'Settings',
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainChatSettingsPage()));
                },
                title: SmallText(
                  text: 'Chat Settings',
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const MainNotificationsSettingsPage()));
                },
                title: SmallText(
                  text: 'Notification Settings',
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainPrivacySettingsPage()));
                },
                title: SmallText(
                  text: 'Privacy Settings',
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainLanguagePage()));
                },
                title: SmallText(
                  text: 'Language',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                subtitle: SmallText(
                  text: 'English',
                  size: 50.sp,
                  fontWeight: FontWeight.w500,
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
        height: 47.h,
      ),
      Container(
          width: 1620.w,
          alignment: Alignment.center,
          child: MyElevatedButton(
              text: 'Log Out',
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainSignInPage()),
                );
              }))
    ]);
  }
}
