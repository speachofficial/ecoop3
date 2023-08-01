import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
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
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: initialTime,
                            firstDate: minDate,
                            lastDate: maxDate,
                            initialEntryMode: DatePickerEntryMode.calendarOnly);
                        if (newDate == null) {
                          return;
                        } else {
                          // ignore: use_build_context_synchronously
                          TimeOfDay? newtime = await showTimePicker(
                            context: context,
                            initialEntryMode: TimePickerEntryMode.dialOnly,
                            initialTime: const TimeOfDay(hour: 22, minute: 0),
                          );
                          if (newtime == null) {
                            return;
                          } else {
                            var newTime = DateTime(newDate.year, newDate.month,
                                newDate.day, newtime.hour, newtime.minute);
                            if (newTime.day - now.day >= 1 &&
                                newTime.hour < 22) {
                              newTime = DateTime(newTime.year, newTime.month,
                                  newTime.day, 22, 0);
                            }
                            if (newTime.weekday == DateTime.saturday ||
                                newTime.weekday == DateTime.sunday) {
                              int difference =
                                  newTime.weekday == DateTime.saturday ? 2 : 1;
                              newTime = newTime.add(Duration(days: difference));
                            }
                            setState(() {
                              pickuptime = newTime;
                            });
                          }
                        }
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
