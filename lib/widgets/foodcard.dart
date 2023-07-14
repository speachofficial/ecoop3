import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'smalltext.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 1318.h,
                width: 1620.w,
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF_100,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.r)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 1620.w,
                      height: 778.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50.r)),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/nasilemak.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 203.h),
                      child: Column(
                        children: [
                          ListTile(
                            title: SmallText(
                              text: 'Ayam Gunting',
                              size: 50.sp,
                              color: AppColors.c000000_100,
                              fontWeight: FontWeight.w600,
                            ),
                            trailing: SmallText(
                              text: 'RM 2.50     ',
                              size: 50.sp,
                              color: AppColors.c000000_100,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 171.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100.h,
                                width: 360.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 100.h,
                                        width: 100.h,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          backgroundColor:
                                              AppColors.cD9D9D9_100,
                                          elevation: 0,
                                          child: Icon(
                                            Icons.remove,
                                            size: 63.sp,
                                            color: AppColors.c000000_100,
                                          ),
                                        )),
                                    SmallText(
                                      text: '1',
                                      size: 64.sp,
                                      color: AppColors.c000000_100,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                        height: 100.h,
                                        width: 100.h,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          backgroundColor:
                                              AppColors.cC8151D_100,
                                          elevation: 0,
                                          child: Icon(
                                            Icons.add,
                                            size: 63.sp,
                                            color: AppColors.cFFFFFF_100,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 175.w,
                              ),
                              SizedBox(
                                height: 150.h,
                                width: 675.w,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.r)),
                                        backgroundColor: AppColors.cC8151D_100),
                                    child: SmallText(
                                      text: 'Add to cart',
                                      size: 48.sp,
                                      color: AppColors.cFFFFFF_100,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.all(13.h),
        height: 800.h,
        width: 675.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
                image: AssetImage('assets/images/nasilemak.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(65.w),
              alignment: Alignment.topLeft,
              child: SmallText(
                text: 'Nasi Lemak',
                size: 64.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.cFFFFFF_100,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(32.h),
                width: 250.w,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41.6),
                    color: Colors.white),
                child: Align(
                    alignment: Alignment.center,
                    child: SmallText(
                      text: 'RM 3.00',
                      size: 48.sp,
                      color: AppColors.c000000_100,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
