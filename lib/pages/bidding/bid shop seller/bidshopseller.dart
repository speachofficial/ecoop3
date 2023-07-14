import 'package:ecoop3/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/smalltext.dart';
import 'bid shop seller tabs/bidshopongoingseller_tab.dart';
import 'bid shop seller tabs/bidshopsoldseller_tab.dart';

class MainMyShopSellerPageContent extends StatefulWidget {
  const MainMyShopSellerPageContent({super.key});

  @override
  State<MainMyShopSellerPageContent> createState() =>
      _MainMyShopSellerPageContentState();
}

const myShopsSellerTabs = [
  Tab(
    text: 'Sold',
  ),
  Tab(
    text: 'On-Going',
  ),
];

class _MainMyShopSellerPageContentState
    extends State<MainMyShopSellerPageContent> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: myShopsSellerTabs.length, vsync: this);
    return Column(
      children: [
        Container(
          height: 625.h,
          width: double.maxFinite,
          color: AppColors.c333333_50,
          child: Padding(
            padding: EdgeInsets.all(48.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyBackButton(),
                    Align(
                      alignment: Alignment.center,
                      child: BigText(
                        text: 'My Shop',
                        size: 64.sp,
                        color: AppColors.cFFFFFF_100,
                      ),
                    ),
                    Icon(Icons.more_horiz_outlined,
                        size: 133.sp, color: AppColors.cC8151D_100),
                  ],
                ),
                SizedBox(
                  height: 90.h,
                ),
                SizedBox(
                  height: 175.h,
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {},
                      child: Transform.scale(
                        scale: 1.75,
                        child: CircleAvatar(
                          radius: 56.r,
                        ),
                      ),
                    ),
                    title: SmallText(
                      text: 'KGR SHOP'
                      // fullname
                      ,
                      size: 64.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cFFFFFF_100,
                    ),
                    subtitle: SmallText(
                      text: 'ertyu'
                      // '${phonenumber.substring(0, 6)}****'
                      ,
                      size: 48.sp,
                      color: AppColors.cFFFFFF_50,
                      fontWeight: FontWeight.w500,
                    ),
                    trailing: SizedBox(
                      width: 300.w,
                      height: 90.h,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.cEA2127_100),
                          child: SmallText(
                            text: 'Edit',
                            size: 48.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cFFFFFF_100,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100.h,
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
            tabs: myShopsSellerTabs),
        SizedBox(
          height: 71.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.h),
            child: TabBarView(
              controller: tabController,
              children: const [
                SingleChildScrollView(child: MyShopSoldContent()),
                MyShopOnGoingContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
