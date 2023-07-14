import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';

import 'bid admin tabs/bidproductsadmin_tab.dart';
import 'bid admin tabs/bidsummaryadmin_tab.dart';
import 'bid admin tabs/bidverifyadmin_tab.dart';

class MainBiddingItemsPageContent extends StatefulWidget {
  const MainBiddingItemsPageContent({super.key});

  @override
  State<MainBiddingItemsPageContent> createState() =>
      _MainBiddingItemsPageContentState();
}

const biddingitemstabs = [
  Tab(
    text: 'Verify',
  ),
  Tab(
    text: 'Items',
  ),
  Tab(
    text: 'Summary',
  ),
];

class _MainBiddingItemsPageContentState
    extends State<MainBiddingItemsPageContent> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: biddingitemstabs.length, vsync: this);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 100.h,
            right: 100.h,
          ),
          child: Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Bidding Items',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
        ),
        SizedBox(
          height: 71.h,
        ),
        TabBar(
            controller: tabController,
            labelColor: AppColors.c003FFF_100,
            unselectedLabelColor: AppColors.c333333_100,
            labelStyle: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 48.sp,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8.h),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              color: AppColors.c003FFF_100,
              width: 6.h,
            )),
            tabs: biddingitemstabs),
        SizedBox(
          height: 71.h,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(
            left: 100.h,
            right: 100.h,
          ),
          child: TabBarView(
            controller: tabController,
            children: const [
              SingleChildScrollView(child: BiddingItemsVerifyContent()),
              SingleChildScrollView(child: BiddingItemsItemsSummaryContent()),
              SingleChildScrollView(child: BiddingItemsSummaryContent()),
            ],
          ),
        ))
      ],
    );
  }
}
