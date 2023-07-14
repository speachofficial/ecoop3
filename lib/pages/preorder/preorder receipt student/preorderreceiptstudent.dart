import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/exit.dart';
import '../../../widgets/loadinghairil.dart';
import '../../../widgets/smalltext.dart';

class MainOrderPageContent extends StatefulWidget {
  const MainOrderPageContent({super.key});

  @override
  State<MainOrderPageContent> createState() => _MainOrderPageContentState();
}

class _MainOrderPageContentState extends State<MainOrderPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('orders')
              .doc(orderNumber)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingHairil();
            }
            return Column(
              children: [
                Stack(children: [
                  const MyExitButton(),
                  Align(
                      alignment: Alignment.center,
                      child: BigText(
                        text: snapshot.data!.get('OrderNumber'),
                        size: 64.sp,
                        color: AppColors.cC8151D_100,
                      ))
                ]),
                SizedBox(
                  height: 253.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 93.w, vertical: 41.h),
                  width: 1320.w,
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
                            text: 'Customer info',
                            size: 64.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.c000000_100,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Container(
                        height: 48.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: ListTile(
                          title: SmallText(
                            text: 'Name',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: SmallText(
                            text: snapshot.data!.get('Customer'),
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
                            text: 'Class',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: SmallText(
                            text: snapshot.data!.get('Class'),
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
                            text: 'Pick-up time',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: SmallText(
                            text: DateFormat('hh:mm a - 11:30 a (d/M)').format(
                                snapshot.data!.get('PickupTime').toDate()),
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
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
                      FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('orders')
                            .doc(snapshot.data!.get('OrderNumber'))
                            .collection('items')
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoadingHairil();
                          }
                          if (snapshot.data!.docs.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
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
                                        text: snapshot.data!.docs[index]
                                            .get("item name"),
                                        size: 40.sp,
                                        color: AppColors.c000000_60,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      trailing: SmallText(
                                        text:
                                            'RM ${snapshot.data!.docs[index].get("total").toStringAsFixed(2)}',
                                        size: 40.sp,
                                        color: AppColors.c000000_60,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(8.h),
                              child: ListTile(
                                title: SmallText(
                                  text: 'No item',
                                  size: 48.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000_100,
                                ),
                              ),
                            );
                          }
                        },
                      ),
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
                            text:
                                'RM ${snapshot.data!.get('Subtotal').toStringAsFixed(2)}',
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
                            text: 'Discount',
                            size: 40.sp,
                            color: AppColors.c000000_60,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: SmallText(
                            text:
                                'RM ${snapshot.data!.get("discount").toStringAsFixed(2)}',
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
                            text:
                                'RM ${snapshot.data!.get("processingfee").toStringAsFixed(2)}',
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
                                'RM ${snapshot.data!.get("overalltotal").toStringAsFixed(2)}',
                            size: 48.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cC8151D_100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 168.h,
                ),
                // MyElevatedButton(
                //     text: 'Cancel', color: AppColors.c000000_25, onPressed: () {})

                //   Container(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: 93.w,
                //         vertical: 41.h),
                //     width: 1320.w,
                //     decoration: BoxDecoration(
                //         color: AppColors.cFFFFFF_100,
                //         borderRadius: BorderRadius.circular(20.r),
                //         boxShadow: const [
                //           BoxShadow(
                //               color: AppColors.c333333_25,
                //               offset: Offset(0.0, 4.0),
                //               blurRadius: 25,
                //               spreadRadius: 2)
                //         ]),
                //     child: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Icon(
                //               Icons.receipt_long_rounded,
                //               color: AppColors.cC8151D_100,
                //               size: 81.sp,
                //             ),
                //             SizedBox(
                //               width: 39.w,
                //             ),
                //             SmallText(
                //               text: 'Customer info',
                //               size: 64.sp,
                //               fontWeight: FontWeight.bold,
                //               color: AppColors.c000000_100,
                //             )
                //           ],
                //         ),
                //         SizedBox(
                //           height: 60.h,
                //         ),
                //         Container(
                //           height: 48.h,
                //           margin: EdgeInsets.only(bottom: 10.h),
                //           child: ListTile(
                //             title: SmallText(
                //               text: 'Name',
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //             trailing: SmallText(
                //               text: fullname,
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 48.h,
                //           margin: EdgeInsets.only(bottom: 10.h),
                //           child: ListTile(
                //             title: SmallText(
                //               text: 'Class',
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //             trailing: SmallText(
                //               text: class_,
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 48.h,
                //           margin: EdgeInsets.only(bottom: 10.h),
                //           child: ListTile(
                //             title: SmallText(
                //               text: 'Pick-up time',
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //             trailing: SmallText(
                //               text: DateFormat('MMM dd hh:mm a').format(pickuptime),
                //               size: 40.sp,
                //               color: AppColors.c000000_60,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 60.h,
                //         ),
                //         const OrderSummary(),
                //         SizedBox(
                //           height: 40.h,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             SmallText(
                //               text: 'Total',
                //               size: 40.sp,
                //               color: AppColors.c000000_50,
                //               fontWeight: FontWeight.normal,
                //             ),
                //             SizedBox(
                //               width: 30.w,
                //             ),
                //             FutureBuilder(
                //               future: getCartItems(),
                //               builder:
                //                   (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                //                   if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                //                     double total = 0;
                //                     for (var element in snapshot.data!.docs) {
                //                       final data =
                //                           element.data() as Map<String, dynamic>;
                //                       total = (total + data['total RM']);
                //                     }

                //                     return SmallText(
                //                       text:
                //                           'RM ${(total + processingfee).toStringAsFixed(2)}',
                //                       size: 48.sp,
                //                       fontWeight: FontWeight.bold,
                //                       color: AppColors.cC8151D_100,
                //                     );
                //                   } else {
                //                     return SmallText(
                //                       text: 'RM 0.00',
                //                       size: 48.sp,
                //                       color: AppColors.c000000_100,
                //                       fontWeight: FontWeight.w600,
                //                     );
                //                   }
                //               },
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   )
              ],
            );
          }),
    );
  }
}
