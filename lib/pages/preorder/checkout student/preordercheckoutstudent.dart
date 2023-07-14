import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/ordersummary.dart';
import '../../../widgets/smalltext.dart';

class MainCheckoutPageContent extends StatefulWidget {
  const MainCheckoutPageContent({super.key});

  @override
  State<MainCheckoutPageContent> createState() =>
      _MainCheckoutPageContentState();
}

class _MainCheckoutPageContentState extends State<MainCheckoutPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.h,
        left: 131.w,
        right: 131.w,
      ),
      child: Column(
        children: [
          Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Checkout',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
          SizedBox(
            height: 175.h,
          ),
          Container(
            height: 307.h,
            width: 1320.w,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF_100,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.c333333_25,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 25,
                      spreadRadius: 2)
                ]),
            child: Row(
              children: [
                Container(
                  height: 293.h,
                  width: 281.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/shoppingbag.png'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    SmallText(
                      text: 'Pick-up at the mart',
                      size: 40.sp,
                      color: AppColors.c000000_100,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    SmallText(
                      text: DateFormat('EEEE, hh:mm a').format(pickuptime),
                      size: 50.sp,
                      color: AppColors.c000000_100,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet<dynamic>(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 1129.h,
                                width: 1620.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF_100,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(50.r))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Container(
                                      height: 1.h,
                                      width: 145.w,
                                      color: AppColors.c333333_25,
                                    ),
                                    SizedBox(
                                      height: 133.h,
                                    ),
                                    SmallText(
                                      text: 'Pick-up',
                                      size: 48.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.cC8151D_100,
                                    ),
                                    SizedBox(
                                      height: 33.h,
                                    ),
                                    Container(
                                      height: 1.h,
                                      width: 200.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.cC8151D_100,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                    ),
                                    SizedBox(
                                      height: 156.h,
                                    ),
                                    SizedBox(
                                      height: 171.h,
                                      width: 920.w,
                                      child: CupertinoTheme(
                                        data: CupertinoThemeData(
                                            textTheme: CupertinoTextThemeData(
                                                dateTimePickerTextStyle:
                                                    GoogleFonts.inter(
                                                        height: 2.h,
                                                        fontSize: 30.sp,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                        child: Transform.scale(
                                          scale: 1.5,
                                          child: CupertinoDatePicker(
                                              mode: CupertinoDatePickerMode
                                                  .dateAndTime,
                                              minimumDate: minDate,
                                              maximumDate: maxDate,
                                              initialDateTime: initialTime,
                                              onDateTimeChanged:
                                                  (DateTime newTime) {
                                                if (newTime.day - now.day >=
                                                        1 &&
                                                    newTime.hour < 8) {
                                                  newTime = DateTime(
                                                      newTime.year,
                                                      newTime.month,
                                                      newTime.day,
                                                      8,
                                                      0);
                                                }
                                                if (newTime.weekday ==
                                                        DateTime.saturday ||
                                                    newTime.weekday ==
                                                        DateTime.sunday) {
                                                  int difference =
                                                      newTime.weekday ==
                                                              DateTime.saturday
                                                          ? 2
                                                          : 1;
                                                  newTime = newTime.add(
                                                      Duration(
                                                          days: difference));
                                                }
                                                setState(() {
                                                  newtime = newTime;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 156.h,
                                    ),
                                    MyElevatedButton(
                                        text: 'Apply',
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() => pickuptime = newtime);
                                        })
                                  ],
                                ),
                              );
                            });
                      },
                      child: SmallText(
                        text: 'Change',
                        size: 40.sp,
                        color: AppColors.cC8151D_100,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Container(
            width: 1320.w,
            padding: EdgeInsets.symmetric(horizontal: 93.w, vertical: 50.h),
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF_100,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.c333333_25,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 25,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wallet_rounded,
                      color: AppColors.cC8151D_100,
                      size: 81.sp,
                    ),
                    SizedBox(
                      width: 39.w,
                    ),
                    SmallText(
                      text: 'Payment method',
                      size: 64.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.c000000_100,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 131.w),
                  child: SmallText(
                    text: paymentmethod,
                    size: 48.sp,
                    color: AppColors.cC8151D_100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.add_rounded,
                //       size: 70.sp,
                //       color: AppColors.cC8151D_100,
                //     ),
                //     SizedBox(
                //       width: 47.w,
                //     ),
                //     SmallText(
                //       text: 'Add a payment method',
                //       size: 48.sp,
                //       color: AppColors.cC8151D_100,
                //       fontWeight: FontWeight.bold,
                //     )
                //   ],
                // )
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 93.w, vertical: 50.h),
            width: 1320.w,
            decoration: BoxDecoration(
                color: AppColors.cFFFFFF_100,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(
                      color: AppColors.c333333_25,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 25,
                      spreadRadius: 2)
                ]),
            child: const OrderSummary(),
          ),
          SizedBox(
            height: 350.h,
          )
        ],
      ),
    );
  }
}
