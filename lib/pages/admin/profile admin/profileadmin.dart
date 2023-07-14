import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../widgets/smalltext.dart';
import '../../nav/profile/account settings/accountsettings_bg.dart';

class MainProfilePageContentCoop extends StatefulWidget {
  const MainProfilePageContentCoop({super.key});

  @override
  State<MainProfilePageContentCoop> createState() =>
      _MainProfilePageContentCoop();
}

class _MainProfilePageContentCoop extends State<MainProfilePageContentCoop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 50.h,
            right: 50.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 92.sp,
                color: AppColors.c000000_25,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 92.sp,
                color: AppColors.c000000_25,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 138.h,
        ),
        SizedBox(
          height: 175.h,
          child: ListTile(
            leading: Transform.scale(
              scale: 3.h,
              child: CircleAvatar(
                radius: 56.r,
              ),
            ),
            title: SmallText(
              text: 'MUHAMMAD AIMAN',
              size: 64.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.c000000_100,
            ),
            subtitle: SmallText(
              text: '012*******',
              size: 48.sp,
              color: AppColors.c000000_50,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 125.h, horizontal: 50.h),
          child: ListTile(
            leading: Icon(
              Icons.receipt_outlined,
              size: 100.sp,
              color: AppColors.c003FFF_100,
            ),
            title: SmallText(
              text: 'My Purchases',
              size: 57.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.c000000_100,
            ),
            trailing: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'View Purchase History ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColors.c000000_50,
                      fontSize: 50.sp)),
              WidgetSpan(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.c000000_50,
                size: 47.sp,
              ))
            ])),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 50.h),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet_rounded,
                      size: 100.sp,
                      color: AppColors.c000000_60,
                    ),
                    SmallText(
                      text: 'To Pay',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delivery_dining_outlined,
                      size: 100.sp,
                      color: AppColors.c000000_60,
                    ),
                    SmallText(
                      text: 'To Receive',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      size: 100.sp,
                      color: AppColors.c000000_60,
                    ),
                    SmallText(
                      text: 'Completed',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.stars,
                      size: 100.sp,
                      color: AppColors.c000000_60,
                    ),
                    SmallText(
                      text: 'To Rate',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )),
              ],
            )),
        Container(
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
              color: AppColors.c003FFF_20,
              border: Border(
                  bottom: BorderSide(width: 3.h, color: AppColors.c000000_25))),
          child: ListTile(
            leading: Icon(
              Icons.store_mall_directory_outlined,
              size: 100.sp,
              color: AppColors.c003FFF_100,
            ),
            title: SmallText(
              text: 'My Shop',
              size: 57.sp,
              color: AppColors.c003FFF_100,
              fontWeight: FontWeight.w500,
            ),
            trailing: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'View Order ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColors.c000000_50,
                      fontSize: 50.sp)),
              WidgetSpan(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.c000000_50,
                size: 47.sp,
              ))
            ])),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 3.h, color: AppColors.c000000_25))),
          child: ListTile(
            leading: Icon(
              Icons.watch_later_outlined,
              size: 100.sp,
              color: AppColors.cDCC465_100,
            ),
            title: SmallText(
              text: 'Recently Viewed',
              size: 57.sp,
              color: AppColors.c333333_100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 3.h, color: AppColors.c000000_25))),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainAccountSettingsPage()));
            },
            leading: Icon(
              Icons.account_circle_outlined,
              size: 100.sp,
              color: AppColors.c0096FF_100,
            ),
            title: SmallText(
              text: 'Account Settings',
              size: 57.sp,
              color: AppColors.c333333_100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(50.h),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 3.h, color: AppColors.c000000_25))),
          child: ListTile(
            leading: Icon(
              Icons.help_outline_rounded,
              size: 100.sp,
              color: AppColors.c4DDBBE_100,
            ),
            title: SmallText(
              text: 'Help Center',
              size: 57.sp,
              color: AppColors.c333333_100,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
