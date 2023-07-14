import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import 'history student tabs/historycancelledstudent_tab.dart';
import 'history student tabs/historycompletedstudent_tab.dart';
import 'history student tabs/historytopaystudent_tab.dart';
import 'history student tabs/historytoreceivestudent_tab.dart';

class MainMyHistoryPageContent extends StatefulWidget {
  const MainMyHistoryPageContent({super.key});

  @override
  State<MainMyHistoryPageContent> createState() => _MainMyHistoryPageContent();
}

const myPurchasesTabs = [
  Tab(
    text: 'To Pay',
  ),
  Tab(
    text: 'To Receive',
  ),
  // Tab(
  //   text: 'To Rate',
  // ),
  Tab(
    text: 'Cancelled',
  ),
  Tab(
    text: 'Completed',
  ),
];

class _MainMyHistoryPageContent extends State<MainMyHistoryPageContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: myPurchasesTabs.length, vsync: this);
    return Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 50.h,
          right: 50.h,
        ),
        child: Column(
          children: [
            Stack(children: [
              const MyBackButton(),
              Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'My History',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ),
              )
            ]),
            SizedBox(
              height: 71.h,
            ),
            TabBar(
                controller: tabController,
                labelColor: AppColors.c003FFF_100,
                unselectedLabelColor: AppColors.c333333_100,
                labelPadding:
                    EdgeInsets.only(left: 50.h, right: 50.h, bottom: 8.h),
                labelStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.bold, fontSize: 48.sp),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 8.h),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                  color: AppColors.c003FFF_100,
                  width: 6.h,
                )),
                tabs: myPurchasesTabs),
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  MyHistoryToPayContent(),
                  MyHistoryToReceiveContent(),
                  MyHistoryCancelledContent(),
                  MyHistoryCompletedContent()
                ],
              ),
            )
          ],
        ));
  }
}
