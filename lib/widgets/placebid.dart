import 'package:ecoop3/widgets/elevatedbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/my_package.dart';
import 'bigtext.dart';
import 'exit.dart';
import 'smalltext.dart';

class PlaceABid extends StatefulWidget {
  const PlaceABid({super.key});

  @override
  State<PlaceABid> createState() => _PlaceABidState();
}

class _PlaceABidState extends State<PlaceABid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1320.w,
          height: 1845.h,
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF_100,
              borderRadius: BorderRadius.circular(50.r)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(32.h),
                child: Stack(children: [
                  const MyExitButton(),
                  Align(
                    alignment: Alignment.center,
                    child: BigText(
                      text: 'Laptop Asus',
                      size: 64.sp,
                      color: AppColors.c333333_100,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 187.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: 'RM300.00',
                              size: 64.sp,
                              color: AppColors.c000000_100,
                            ),
                            SmallText(
                              text: 'Highest Bid',
                              size: 48.sp,
                              color: AppColors.c000000_100,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: 'RM130.00',
                              size: 64.sp,
                              color: AppColors.c000000_100,
                            ),
                            SmallText(
                              text: 'Starting Price',
                              size: 48.sp,
                              color: AppColors.c000000_100,
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 98.h,
                    ),
                    SizedBox(
                      height: 143.h,
                      width: 920.w,
                      child: CupertinoTheme(
                        data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: GoogleFonts.inter(
                                    height: 2.h,
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w600))),
                        child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.dateAndTime,
                            minimumDate: minDate,
                            maximumDate: maxDate,
                            initialDateTime: pickuptime,
                            onDateTimeChanged: (DateTime newTime) {
                              // setState(() {
                              //   newtime = newTime;
                              // });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 750.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/nasilemak.png'),
                          fit: BoxFit.cover)),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(50.h),
                        child: MyElevatedButton(text: 'Bid', onPressed: () {}),
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
