import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';

import 'promo admin tabs/promoboardsadmin_tab.dart';
import 'promo admin tabs/promoproductsadmin_tab.dart';

class MainPromotionAdminPageContent extends StatefulWidget {
  const MainPromotionAdminPageContent({super.key});

  @override
  State<MainPromotionAdminPageContent> createState() =>
      _MainPromotionAdminPageContentState();
}

const promotionadmintabs = [
  Tab(
    text: 'Product',
  ),
  Tab(
    text: 'Notice',
  ),
];

class _MainPromotionAdminPageContentState
    extends State<MainPromotionAdminPageContent> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: promotionadmintabs.length, vsync: this);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
          child: Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Promotion',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 118.w, right: 118.w),
          child: TabBar(
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
              tabs: promotionadmintabs),
        ),
        SizedBox(
          height: 71.h,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 118.w, right: 118.w),
          child: TabBarView(
            controller: tabController,
            children: const [
              PromotionAdminProductContent(),
              PromotionAdminNoticeContent(),
            ],
          ),
        ))
      ],
    );
  }
}
