import 'package:ecoop3/functions/cartchecker_function.dart';
import 'package:ecoop3/utils/my_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/empty.dart';
import '../../../../../widgets/loadinghairil.dart';
import '../../../../../widgets/smalltext.dart';

class MyHistoryToPayContent extends StatelessWidget {
  const MyHistoryToPayContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCartItems(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingHairil();
        }
        if (snapshot.data!.docs.isNotEmpty) {
          double total = 0;
          for (var element in snapshot.data!.docs) {
            final data = element.data() as Map<String, dynamic>;
            total = (total + data['total RM']);
          }
          return Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                cartchecker(context);
              },
              child: Container(
                margin: EdgeInsets.all(32.h),
                padding: EdgeInsets.symmetric(horizontal: 93.w, vertical: 41.h),
                width: 1320.w,
                height: 625.h + (snapshot.data!.docs.length - 1) * 75.h,
                decoration: BoxDecoration(
                    color: AppColors.cFFFFFF_100,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColors.c333333_25,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 25,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.receipt_long_rounded,
                          color: AppColors.cC8151D_100,
                          size: 81.sp,
                        ),
                        SizedBox(
                          width: 39.w,
                        ),
                        SmallText(
                          text: 'Order summary',
                          size: 64.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.c000000_100,
                        )
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.docs.length ?? 0,
                        itemBuilder: (_, index) {
                          return Container(
                            height: 48.h,
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: ListTile(
                              leading: SmallText(
                                text:
                                    '${snapshot.data!.docs[index].get("quantity")}x',
                                size: 40.sp,
                                color: AppColors.c000000_60,
                                fontWeight: FontWeight.w500,
                              ),
                              title: SmallText(
                                text:
                                    snapshot.data!.docs[index].get("item name"),
                                size: 40.sp,
                                color: AppColors.c000000_60,
                                fontWeight: FontWeight.w500,
                              ),
                              trailing: SmallText(
                                text:
                                    'RM ${snapshot.data!.docs[index].get("total RM").toStringAsFixed(2)}',
                                size: 40.sp,
                                color: AppColors.c000000_60,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }),
                    Container(
                      height: 5.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(vertical: 60.h),
                      color: AppColors.c000000_25,
                    ),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: ListTile(
                          title: SmallText(
                            text: 'Subtotal',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: SmallText(
                            text: 'RM ${total.toStringAsFixed(2)}',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: ListTile(
                        title: SmallText(
                          text: 'Discount',
                          size: 40.sp,
                          color: AppColors.c000000_60,
                          fontWeight: FontWeight.w500,
                        ),
                        trailing: SmallText(
                          text: 'RM ${discount.toStringAsFixed(2)}',
                          size: 40.sp,
                          color: AppColors.c000000_60,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: ListTile(
                        title: SmallText(
                          text: 'Processing fee',
                          size: 40.sp,
                          color: AppColors.c000000_60,
                          fontWeight: FontWeight.w500,
                        ),
                        trailing: SmallText(
                          text: 'RM ${processingfee.toStringAsFixed(2)}',
                          size: 40.sp,
                          color: AppColors.c000000_60,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallText(
                          text: 'Total',
                          size: 40.sp,
                          color: AppColors.c000000_50,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        SmallText(
                          text:
                              'RM ${(total + processingfee).toStringAsFixed(2)}',
                          size: 48.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cC8151D_100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
          //  return Align(
          //     alignment: Alignment.topCenter,
          //     child: Container(
          //       padding: EdgeInsets.symmetric(
          //           horizontal: 93.w,
          //           vertical: 41.h),
          //       width: 1320.w,
          //       height: 824.h,
          //       margin: EdgeInsets.all(32.h),
          //       decoration: BoxDecoration(
          //           color: AppColors.cFFFFFF_100,
          //           borderRadius: BorderRadius.circular(30.r),
          //           boxShadow: const [
          //             BoxShadow(
          //                 color: AppColors.c333333_25,
          //                 offset: Offset(0.0, 4.0),
          //                 blurRadius: 25,
          //                 spreadRadius: 2)
          //           ]),
          //       child: Column(
          //         children: [
          //           Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                 height: 300.w,
          //                 width: 300.w,
          //                 decoration: BoxDecoration(
          //                     borderRadius:
          //                         BorderRadius.circular(30.r),
          //                     color: AppColors.c000000_100,
          //                     image: const DecorationImage(
          //                         image:
          //                             AssetImage('assets/images/nasilemak.png'),
          //                         fit: BoxFit.cover)),
          //               ),
          //               SizedBox(
          //                 width: 90.w,
          //               ),
          //               SizedBox(
          //                 height: 300.w,
          //                 width: 717.w,
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     BigText(
          //                         text: 'Blazer 2021 :3',
          //                         size: 75.sp),
          //                     SizedBox(
          //                       height: 55.h,
          //                     ),
          //                     SizedBox(
          //                       height: 48.h,
          //                       child: ListTile(
          //                         contentPadding: const EdgeInsets.all(0),
          //                         title: SmallText(
          //                           text: 'Bidding price',
          //                           size: 40.sp,
          //                           color: AppColors.c000000_60,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                         trailing: SmallText(
          //                           text: 'RM 500.00',
          //                           size: 40.sp,
          //                           color: AppColors.c000000_60,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 48.h,
          //                       child: ListTile(
          //                         contentPadding: const EdgeInsets.all(0),
          //                         title: SmallText(
          //                           text: 'Delivery',
          //                           size: 40.sp,
          //                           color: AppColors.c000000_60,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                         trailing: SmallText(
          //                           text: 'RM 500.00',
          //                           size: 40.sp,
          //                           color: AppColors.c000000_60,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //           Container(
          //             height: 5.h,
          //             width: double.maxFinite,
          //             margin:
          //                 EdgeInsets.symmetric(vertical: 60.h),
          //             color: AppColors.c000000_25,
          //           ),
          //           Container(
          //             height: 48.h,
          //             margin: EdgeInsets.only(bottom: 10.h),
          //             child: ListTile(
          //                 title: SmallText(
          //                   text: 'Subtotal',
          //                   size: 40.sp,
          //                   color: AppColors.c000000_60,
          //                   fontWeight: FontWeight.w500,
          //                 ),
          //                 trailing: SmallText(
          //                   text: 'RM 45.00',
          //                   size: 40.sp,
          //                   color: AppColors.c000000_60,
          //                   fontWeight: FontWeight.w500,
          //                 )),
          //           ),
          //           Container(
          //             height: 48.h,
          //             margin: EdgeInsets.only(bottom: 10.h),
          //             child: ListTile(
          //               title: SmallText(
          //                 text: 'Discount',
          //                 size: 40.sp,
          //                 color: AppColors.c000000_60,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //               trailing: SmallText(
          //                 text: 'RM 0.00',
          //                 size: 40.sp,
          //                 color: AppColors.c000000_60,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //           ),
          //           Container(
          //             height: 48.h,
          //             margin: EdgeInsets.only(bottom: 10.h),
          //             child: ListTile(
          //               title: SmallText(
          //                 text: 'Processing fee',
          //                 size: 40.sp,
          //                 color: AppColors.c000000_60,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //               trailing: SmallText(
          //                 text: 'RM 50000.00',
          //                 size: 40.sp,
          //                 color: AppColors.c000000_60,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 40.h,
          //           ),
          //           MySmallElevatedButton(text: 'Pay', onPressed: () {})
          //         ],
          //       ),
          //     ),
          //   );
        } else {
          return const EmptyHairil();
        }
      },
    );
  }
}
