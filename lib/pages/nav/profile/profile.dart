import 'package:ecoop3/pages/admin/promo/promo%20admin/promoadmin_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/loadinghairil.dart';
import '../../../widgets/smalltext.dart';
import '../../bidding/bid register shop seller/register seller info /register seller info 1/registersellerinfo1_bg.dart';
import '../../admin/preorder/preorder shop admin/preordershopadmin_bg.dart';
import 'account settings/accountsettings_bg.dart';
import 'purchases public/purchases_bg.dart';

class MainProfilePageContent extends StatefulWidget {
  const MainProfilePageContent({super.key});

  @override
  State<MainProfilePageContent> createState() => _MainProfilePageContentState();
}

class _MainProfilePageContentState extends State<MainProfilePageContent> {
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 92.sp,
        ),
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: 32.h,
        //     left: 50.h,
        //     right: 50.h,
        //   ),
        //   child: role == 'admin'
        //       ? Container(
        //           height: 92.sp,
        //         )
        //       : Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             Icon(
        //               Icons.notifications_outlined,
        //               size: 92.sp,
        //               color: AppColors.c000000_25,
        //             ),
        //             Icon(
        //               Icons.shopping_cart_outlined,
        //               size: 92.sp,
        //               color: AppColors.c000000_25,
        //             ),
        //           ],
        //         ),
        // ),
        SizedBox(
          height: 138.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: SizedBox(
            height: 175.h,
            child: ListTile(
              leading: GestureDetector(
                onTap: () {},
                child: Transform.scale(
                  scale: 3.h,
                  child: CircleAvatar(
                    radius: 56.r,
                  ),
                ),
              ),
              title: SmallText(
                text: fullname,
                size: 64.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.c000000_100,
              ),
              subtitle: SmallText(
                text: role == 'student'
                    ? class_.toString()
                    : '${phonenumber.substring(0, 6)}****',
                size: 48.sp,
                color: AppColors.c000000_50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        role == 'admin'
            ? StreamBuilder(
                stream: getAllOrdersButCancelled(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingHairil();
                  }
                  for (var element in snapshot.data!.docs) {
                    final data = element.data() as Map<String, dynamic>;
                    total += data['Subtotal'];
                  }
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 180.w, right: 180.w, top: 120.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 600.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              color: AppColors.c003FFF_25,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Row(children: [
                            Expanded(
                                flex: 7,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 120.h,
                                    width: 120.h,
                                    child: Image.asset(
                                      'assets/images/moneyicon.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 13,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text: 'Total Sales',
                                    size: 40.sp,
                                    color: AppColors.c000000_50,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SmallText(
                                    text:
                                        'RM ${NumberFormat.compact().format(total)}',
                                    size: 57.sp,
                                    color: AppColors.c333333_100,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        Container(
                          width: 600.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              color: AppColors.cC8151D_25,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Row(children: [
                            Expanded(
                                flex: 7,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 120.h,
                                    width: 120.h,
                                    child: Image.asset(
                                      'assets/images/shoppingbagicon.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 13,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text: 'Total Order',
                                    size: 40.sp,
                                    color: AppColors.c000000_50,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SmallText(
                                    text: snapshot.data!.docs.length.toString(),
                                    size: 57.sp,
                                    color: AppColors.c333333_100,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  );
                })
            : Container(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 50.h),
          child: role == 'admin'
              ? ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainMyShopsPage(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.store_mall_directory_outlined,
                    size: 100.sp,
                    color: AppColors.cC8151D_100,
                  ),
                  title: SmallText(
                    text: 'My Shop',
                    size: 57.sp,
                    color: AppColors.cC8151D_100,
                    fontWeight: FontWeight.w500,
                  ),
                  trailing: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'View Shop ',
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
                )
              : ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainMyHistoryPage(),
                      ),
                    );
                  },
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
            padding: EdgeInsets.only(
              bottom: 125.h,
              left: 50.h,
              right: 50.h,
            ),
            child: role == 'admin'
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.gavel_outlined,
                            size: 100.sp,
                            color: AppColors.c000000_60,
                          ),
                          SmallText(
                            text: 'Bidding',
                            size: 40.sp,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MainPromotionAdminPage(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.percent_rounded,
                              size: 100.sp,
                              color: AppColors.c000000_60,
                            ),
                            SmallText(
                              text: 'Promotion',
                              size: 40.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
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
                            text: 'Selling',
                            size: 40.sp,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainMyHistoryPage()));
                        },
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
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MainMyHistoryPage())),
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
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MainMyHistoryPage())),
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
                        ),
                      )),
                      // Expanded(
                      //     child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Icon(
                      //       Icons.stars,
                      //       size: 100.sp,
                      //       color: AppColors.c000000_60,
                      //     ),
                      //     SmallText(
                      //       text: 'To Rate',
                      //       size: 40.sp,
                      //       fontWeight: FontWeight.w500,
                      //     )
                      //   ],
                      // )),
                    ],
                  )),
        role == 'parent'
            ? Container(
                padding: EdgeInsets.all(50.h),
                decoration: BoxDecoration(
                    color: AppColors.c003FFF_20,
                    border: Border(
                        bottom: BorderSide(
                            width: 3.h, color: AppColors.c000000_25))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MainSellerInformation1Page(),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.store_mall_directory_outlined,
                      size: 100.sp,
                      color: AppColors.c003FFF_100,
                    ),
                    title: SmallText(
                      text: 'Start Selling',
                      size: 57.sp,
                      color: AppColors.c003FFF_100,
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Free Registration ',
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
              )
            : Container(),
        role == 'student'
            ? Container(
                padding: EdgeInsets.all(50.h),
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(width: 3.h, color: AppColors.c000000_25),
                        bottom: BorderSide(
                            width: 3.h, color: AppColors.c000000_25))),
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
              )
            : Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3.h, color: AppColors.c000000_25))),
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
