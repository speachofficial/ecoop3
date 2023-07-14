import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/my_package.dart';
import '../../../../widgets/loadinghairil.dart';
import '../../../../widgets/smalltext.dart';

class MyShopOnGoingContent extends StatelessWidget {
  const MyShopOnGoingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder(
        stream: getAvailableProducts(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingHairil();
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return GridView.builder(
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
                });
          }
          return Container(
              padding: EdgeInsets.all(13.h),
              margin: EdgeInsets.all(16.h),
              height: 800.h,
              width: 675.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.cC8151D_100, width: 3.h)),
              child: Center(
                child: SmallText(
                  text: 'No Item',
                  size: 48.sp,
                  color: AppColors.cC8151D_100,
                  fontWeight: FontWeight.w500,
                ),
              ));
        },
      ),
    );
  }
}
