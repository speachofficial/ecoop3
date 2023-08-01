import 'package:ecoop3/pages/preorder/cart%20public/preordercartstudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/smalltext.dart';
import 'bidcartparent.dart';

class MainCartPageContent extends StatefulWidget {
  const MainCartPageContent({super.key});

  @override
  State<MainCartPageContent> createState() => _MainCartPageContentState();
}

class _MainCartPageContentState extends State<MainCartPageContent> {
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
                    text: 'Cart',
                    size: 64.sp,
                    color: AppColors.c333333_100,
                  ))
            ]),
            SizedBox(
              height: 172.h,
            ),
            role == 'student'
                ? Container(
                    height: 307.h,
                    width: 1320.w,
                    decoration: BoxDecoration(
                        color: AppColors.cFFFFFF_100,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.c333333_25,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 16,
                              spreadRadius: 2)
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 293.h,
                            width: 281.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/shoppingbag.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
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
                                  text: DateFormat('EEEE, hh:mm a')
                                      .format(pickuptime),
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
                                        initialEntryMode:
                                            DatePickerEntryMode.calendarOnly);
                                    if (newDate == null) {
                                      return;
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      TimeOfDay? newtime = await showTimePicker(
                                        context: context,
                                        initialEntryMode:
                                            TimePickerEntryMode.dialOnly,
                                        initialTime: const TimeOfDay(
                                            hour: 22, minute: 0),
                                      );
                                      if (newtime == null) {
                                        return;
                                      } else {
                                        var newTime = DateTime(
                                            newDate.year,
                                            newDate.month,
                                            newDate.day,
                                            newtime.hour,
                                            newtime.minute);
                                        if (newTime.day - now.day >= 1 &&
                                            newTime.hour < 22) {
                                          newTime = DateTime(
                                              newTime.year,
                                              newTime.month,
                                              newTime.day,
                                              22,
                                              0);
                                        }
                                        if (newTime.day - now.day >= 1 &&
                                            newTime.hour > 23) {
                                          newTime = DateTime(
                                              newTime.year,
                                              newTime.month,
                                              newTime.day,
                                              22,
                                              0);
                                        }
                                        // if (newTime.day - now.day >= 1  ) {
                                        //   newTime = DateTime(newTime.year,
                                        //       newTime.month, newTime.day);
                                        // }
                                        // if (newTime.hour < 22 ) {
                                        //   newTime = DateTime(newTime.year,
                                        //       newTime.month, newTime.day, 22, 0);
                                        // }
                                        if (newTime.weekday ==
                                                DateTime.saturday ||
                                            newTime.weekday ==
                                                DateTime.sunday) {
                                          int difference = newTime.weekday ==
                                                  DateTime.saturday
                                              ? 2
                                              : 1;
                                          newTime = newTime
                                              .add(Duration(days: difference));
                                        }
                                        setState(() {
                                          pickuptime = newTime;
                                        });
                                      }
                                    }

                                    // showModalBottomSheet<dynamic>(
                                    //     backgroundColor: Colors.transparent,
                                    //     isScrollControlled: true,
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return Container(
                                    //         height: 1129.h,
                                    //         width: 1620.w,
                                    //         decoration: BoxDecoration(
                                    //             color: AppColors.cFFFFFF_100,
                                    //             borderRadius:
                                    //                 BorderRadius.vertical(
                                    //                     top: Radius.circular(
                                    //                         50.r))),
                                    //         child: Column(
                                    //           children: [
                                    //             SizedBox(
                                    //               height: 50.h,
                                    //             ),
                                    //             Container(
                                    //               height: 1.h,
                                    //               width: 145.w,
                                    //               color: AppColors.c333333_25,
                                    //             ),
                                    //             SizedBox(
                                    //               height: 133.h,
                                    //             ),
                                    //             SmallText(
                                    //               text: 'Pick-up',
                                    //               size: 48.sp,
                                    //               fontWeight: FontWeight.w600,
                                    //               color: AppColors.cC8151D_100,
                                    //             ),
                                    //             SizedBox(
                                    //               height: 33.h,
                                    //             ),
                                    //             Container(
                                    //               height: 1.h,
                                    //               width: 200.w,
                                    //               decoration: BoxDecoration(
                                    //                   color:
                                    //                       AppColors.cC8151D_100,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           20.r)),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 156.h,
                                    //             ),
                                    //             SizedBox(
                                    //               height: 171.h,
                                    //               width: 920.w,
                                    //               child: CupertinoTheme(
                                    //                 data: CupertinoThemeData(
                                    //                     textTheme: CupertinoTextThemeData(
                                    //                         dateTimePickerTextStyle:
                                    //                             GoogleFonts.inter(
                                    //                                 height: 2.h,
                                    //                                 fontSize:
                                    //                                     30.sp,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w600))),
                                    //                 child: Transform.scale(
                                    //                   scale: 1.5,
                                    //                   child:
                                    //                       CupertinoDatePicker(
                                    //                           mode: CupertinoDatePickerMode
                                    //                               .dateAndTime,
                                    //                           minimumDate:
                                    //                               minDate,
                                    //                           maximumDate:
                                    //                               maxDate,
                                    //                           initialDateTime:
                                    //                               initialTime,
                                    //                           onDateTimeChanged:
                                    //                               (DateTime
                                    //                                   newTime) {
                                    //                             if (newTime.day -
                                    //                                         now
                                    //                                             .day >=
                                    //                                     1 &&
                                    //                                 newTime.hour <
                                    //                                     8) {
                                    //                               newTime = DateTime(
                                    //                                   newTime
                                    //                                       .year,
                                    //                                   newTime
                                    //                                       .month,
                                    //                                   newTime
                                    //                                       .day,
                                    //                                   8,
                                    //                                   0);
                                    //                             }
                                    //                             if (newTime.weekday ==
                                    //                                     DateTime
                                    //                                         .saturday ||
                                    //                                 newTime.weekday ==
                                    //                                     DateTime
                                    //                                         .sunday) {
                                    //                               int difference =
                                    //                                   newTime.weekday ==
                                    //                                           DateTime.saturday
                                    //                                       ? 2
                                    //                                       : 1;
                                    //                               newTime = newTime
                                    //                                   .add(Duration(
                                    //                                       days:
                                    //                                           difference));
                                    //                             }
                                    //                             setState(() {
                                    //                               newtime =
                                    //                                   newTime;
                                    //                             });
                                    //                           }),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 156.h,
                                    //             ),
                                    //             MyElevatedButton(
                                    //                 text: 'Apply',
                                    //                 onPressed: () {
                                    //                   Navigator.pop(context);
                                    //                   setState(() =>
                                    //                       pickuptime = newtime);
                                    //                 })
                                    //           ],
                                    //         ),
                                    //       );
                                    //     });
                                  },
                                  child: SmallText(
                                    text: 'Change',
                                    size: 40.sp,
                                    color: AppColors.cC8151D_100,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                : Container(
                    height: 307.h,
                    width: 1320.w,
                    padding: EdgeInsets.only(
                        top: 16.h, bottom: 16.h, left: 32.h, right: 16.h),
                    decoration: BoxDecoration(
                        color: AppColors.cFFFFFF_100,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.c333333_25,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 16,
                              spreadRadius: 2)
                        ]),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 250.w,
                          width: 250.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/baju.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(left: 32.h),
                          height: 200.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(
                                text: 'Stay tune to your bid',
                                size: 40.sp,
                                color: AppColors.c000000_100,
                                fontWeight: FontWeight.w500,
                              ),
                              BigText(
                                text: 'My Bid',
                                size: 64.sp,
                                color: AppColors.c000000_100,
                              ),
                              SmallText(
                                text: '3 items',
                                size: 40.sp,
                                color: AppColors.cC8151D_100,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: AppColors.cC8151D_100,
                          size: 133.sp,
                        ),
                      )
                    ]),
                  ),
            SizedBox(
              height: role != 'parent' ? 217.h : 90.h,
            ),
            role == 'student' ? const StudentCart() : const ParentCart(),
            SizedBox(
              height: 200.h,
            )
          ],
        ));
  }
}
