import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
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
        left: 50.w,
        right: 50.w,
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
                              initialEntryMode: TimePickerEntryMode.dialOnly,
                              initialTime: const TimeOfDay(hour: 22, minute: 0),
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
                                newTime = DateTime(newTime.year, newTime.month,
                                    newTime.day, 22, 0);
                              }
                              if (newTime.weekday == DateTime.saturday ||
                                  newTime.weekday == DateTime.sunday) {
                                int difference =
                                    newTime.weekday == DateTime.saturday
                                        ? 2
                                        : 1;
                                newTime =
                                    newTime.add(Duration(days: difference));
                              }
                              setState(() {
                                pickuptime = newTime;
                              });
                            }
                          }
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
