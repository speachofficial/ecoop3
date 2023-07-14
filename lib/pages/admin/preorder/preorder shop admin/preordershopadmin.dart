import 'package:ecoop3/pages/admin/preorder/preorder%20add%20product%20admin/preorderaddproductadmin_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import 'preorder shop admin tabs/preorderproductsshopsadmin_tab.dart';
import 'preorder shop admin tabs/preorderordershopsadmin_tab.dart';
import 'preorder shop admin tabs/preordersummaryshopsadmin_tab.dart';

class MainMyShopsPageContent extends StatefulWidget {
  const MainMyShopsPageContent({super.key});

  @override
  State<MainMyShopsPageContent> createState() => _MainMyShopsPageContentState();
}

const myShopsTabs = [
  Tab(
    text: 'My Product',
  ),
  Tab(
    text: 'Order',
  ),
  Tab(
    text: 'Summary',
  ),
];

class _MainMyShopsPageContentState extends State<MainMyShopsPageContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: myShopsTabs.length, vsync: this);
    return Padding(
        padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const MyBackButton(),
              BigText(
                text: 'My Shops',
                size: 64.sp,
                color: AppColors.c333333_100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainAddProductPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.photo_camera_outlined,
                  size: 78.sp,
                  color: AppColors.cC8151D_100,
                ),
              ),
            ]),
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
                tabs: myShopsTabs),
            SizedBox(
              height: 71.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  SingleChildScrollView(child: MyShopProductContent()),
                  MyShopOrdersContent(),
                  MyShopSummaryContent()
                ],
              ),
            ),
          ],
        ));
  }
}
