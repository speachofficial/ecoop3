import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/smalltext.dart';
import 'preorder products category student/preorderproductscategorypopular_tab.dart';

class MainFoodsPageContent extends StatefulWidget {
  const MainFoodsPageContent({super.key});

  @override
  State<MainFoodsPageContent> createState() => _MainFoodsPageContentState();
}

const myTabs = [
  Tab(
    text: 'Popular',
  ),
  Tab(
    text: 'Nasi Lemak',
  ),
  Tab(
    text: 'Western',
  ),
  Tab(
    text: 'Cg. Saufi\'s Cuisine',
  ),
  Tab(
    text: 'Drinks',
  ),
];

class _MainFoodsPageContentState extends State<MainFoodsPageContent>
    with TickerProviderStateMixin {
  void onTimeSelected(DateTime selectedTime) {
    setState(() {
      pickuptime = selectedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.h,
        left: 50.h,
        right: 50.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const MyBackButton(),
              SizedBox(
                width: 59.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: 'Pick-up',
                    size: 55.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.c333333_100,
                  ),
                  SmallText(
                    text:
                        DateFormat('EEEE,  dd MMM hh:mm a').format(pickuptime),
                    size: 40.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cC8151D_100,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 360,
                child: SmallText(
                  text: 'Coop Sekolah Sultan Alam Shah',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 576,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.cC8151D_100,
                      size: 78.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: 'Pick-up',
                          size: 48.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.c333333_100,
                        ),
                        SmallText(
                          text: DateFormat('EE, dd/M [hh:mm a]')
                              .format(pickuptime),
                          size: 48.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.c333333_100,
                        ),
                      ],
                    ),
                    TextButton(
                        child: SmallText(
                          text: 'Change',
                          size: 48.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cC8151D_100,
                        ),
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
                                                          fontWeight: FontWeight
                                                              .w600))),
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
                                                    int difference = newTime
                                                                .weekday ==
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
                                            setState(
                                                () => pickuptime = newtime);
                                          })
                                    ],
                                  ),
                                );
                              });
                        })
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          const PopularContent()
          // TabBar(
          //     controller: tabController,
          //     isScrollable: true,
          //     labelColor: AppColors.c003FFF_100,
          //     unselectedLabelColor: AppColors.c333333_100,
          //     labelPadding: EdgeInsets.only(
          //         left: 50.h,
          //         right: 50.h,
          //         bottom: 8.h),
          //     labelStyle: GoogleFonts.inter(
          //         fontWeight: FontWeight.bold, fontSize: 48.sp),
          //     indicatorSize: TabBarIndicatorSize.label,
          //     indicatorPadding:
          //         EdgeInsets.symmetric(horizontal: 8.h),
          //     indicator: UnderlineTabIndicator(
          //         borderSide: BorderSide(
          //       color: AppColors.c003FFF_100,
          //       width: 6.h,
          //     )),
          //     tabs: myTabs),
          // SizedBox(
          //   height: 120.h,
          // ),
          // SizedBox(
          //   width: double.maxFinite,
          //   height: 5000,
          //   child: TabBarView(
          //     controller: tabController,
          //     children: const [
          //       PopularContent(),
          //       NasiLemakContent(),
          //       WesternContent(),
          //       CgSaufisCuisineContent(),
          //       DrinksContent()
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
