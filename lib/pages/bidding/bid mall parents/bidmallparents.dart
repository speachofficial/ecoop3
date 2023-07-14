import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/loadinghairil.dart';
import '../../../widgets/smalltext.dart';

class MainLiveAuctionPageContent extends StatelessWidget {
  const MainLiveAuctionPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const MyBackButton(),
          BigText(
            text: 'Live Bidding',
            size: 64.sp,
            color: AppColors.c333333_100,
          ),
          Row(children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 92.sp,
              color: AppColors.c000000_25,
            ),
            Icon(
              Icons.notifications_outlined,
              size: 92.sp,
              color: AppColors.c000000_25,
            ),
          ])
        ]),
        SizedBox(
          height: 120.h,
        ),
        SmallText(
          text: 'Ending soon...',
          size: 48.sp,
          color: AppColors.c000000_100,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 50.h,
        ),
        SizedBox(
          height: 510.h,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 30.w),
                  width: 975.w,
                  height: 510.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.r),
                    color: AppColors.cFFFFFF_100,
                    border:
                        Border.all(width: 5.h, color: AppColors.cC8151D_100),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 400.h,
                            width: 400.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/nasilemak.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 313.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.h,
                                          color: AppColors.c000000_25),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(45.r),
                                          topLeft: Radius.circular(45.r),
                                          bottomLeft: Radius.circular(45.r)),
                                      color: AppColors.cFFFFFF_90),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SmallText(
                                        text: '13 : 42 : 55',
                                        size: 48.sp,
                                        color: AppColors.cC8151D_100,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 60.h,
                              ),
                              BigText(
                                text: 'MacBook Pro',
                                size: 64.sp,
                                color: AppColors.c000000_100,
                              ),
                              SmallText(
                                text: 'RM 5000',
                                size: 75.sp,
                                color: AppColors.cC8151D_100,
                                fontWeight: FontWeight.bold,
                              ),
                              SmallText(
                                text:
                                    'Lorem ipsum dolor sit amet, consec mattis... read more',
                                size: 32.sp,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          )),
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 120.h,
        ),
        SmallText(
          text: 'Live Bidding',
          size: 48.sp,
          color: AppColors.c000000_100,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 50.h,
        ),
        StreamBuilder(
          stream: getAvailableProducts(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingHairil();
            }
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return SizedBox(
                height: snapshot.data!.docs.length.isEven
                    ? snapshot.data!.docs.length / 2 * 800.h
                    : (snapshot.data!.docs.length + 1) / 2 * 800.h,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 32.h,
                      crossAxisSpacing: 32.h,
                    ),
                    itemCount: (snapshot.data?.docs.length ?? 0),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                          child: Container(
                        height: 800.h,
                        width: 675.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.c333333_100, width: 5.h),
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    AppColors.c000000_100.withOpacity(0.3),
                                    BlendMode.darken),
                                image: NetworkImage(
                                  snapshot.data!.docs[index].get("url"),
                                ),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 313.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.r),
                                        topLeft: Radius.circular(30.r),
                                        bottomLeft: Radius.circular(30.r)),
                                    color: AppColors.cFFFFFF_90),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: SmallText(
                                      text:
                                          // 'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}'
                                          '13 : 42 : 55',
                                      size: 48.sp,
                                      color: AppColors.cC8151D_100,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.all(32.h),
                                width: 313.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Colors.white),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: SmallText(
                                      text:
                                          'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
                                      size: 48.sp,
                                      color: AppColors.c003FFF_100,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ));
                    }),
              );
            }
            return Container(
                padding: EdgeInsets.all(13.h),
                margin: EdgeInsets.all(16.h),
                height: 800.h,
                width: 675.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border:
                        Border.all(color: AppColors.cC8151D_100, width: 3.h)),
                child: Center(
                  child: SmallText(
                    text: 'No Item',
                    size: 48.sp,
                    color: AppColors.cC8151D_100,
                    fontWeight: FontWeight.w500,
                  ),
                ));
          },
        )
      ]),
    );
  }
}
