import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/my_package.dart';
import 'smalltext.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 47.h,
        ),
        FutureBuilder(
          future: getCartItems(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (snapshot.data?.docs.length ?? 0),
                  itemBuilder: ((context, index) {
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
                          text: snapshot.data!.docs[index].get("item name"),
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
                  }));
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
            trailing: FutureBuilder(
              future: getCartItems(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  double total = 0;
                  for (var element in snapshot.data!.docs) {
                    final data = element.data() as Map<String, dynamic>;
                    total = (total + data['total RM']);
                  }

                  return SmallText(
                    text: 'RM ${total.toStringAsFixed(2)}',
                    size: 40.sp,
                    color: AppColors.c000000_60,
                    fontWeight: FontWeight.w500,
                  );
                } else {
                  return SmallText(
                    text: 'RM 0.00',
                    size: 48.sp,
                    color: AppColors.c000000_100,
                    fontWeight: FontWeight.w600,
                  );
                }
              },
            ),
            // SmallText(
            //   text: 'RM 15.00',
            //   size: 40.sp,
            //   color: AppColors.c000000_60,
            //   fontWeight: FontWeight.w500,
            // ),
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
              text: '-RM ${discount.toStringAsFixed(2)}',
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
      ],
    );
  }
}
