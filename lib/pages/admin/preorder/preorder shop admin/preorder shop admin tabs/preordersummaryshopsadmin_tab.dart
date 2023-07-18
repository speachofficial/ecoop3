import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/widgets/empty.dart';
import 'package:ecoop3/widgets/loadinghairil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/my_package.dart';
import '../../../../../widgets/smalltext.dart';

class MyShopSummaryContent extends StatelessWidget {
  const MyShopSummaryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 32.h),
          child: SmallText(
            text:
                'Order For ${DateFormat('EEEE, dd / MM').format(DateTime(now.year, now.month, now.day).add(const Duration(days: 2)).toUtc())}',
            size: 48.sp,
            color: AppColors.c000000_100,
            fontWeight: FontWeight.bold,
          ),
        ),
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('preorder_products')
              .where('instock', isEqualTo: true)
              .get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> productsnapshot) {
            if (productsnapshot.connectionState == ConnectionState.waiting) {
              return LoadingHairil();
            }
            if (!productsnapshot.hasData || productsnapshot.data == null) {
              return const EmptyHairil();
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: productsnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return FutureBuilder<double>(
                  future: calculateTotalItemQuantity(
                      productsnapshot.data!, index, context),
                  builder: (BuildContext context,
                      AsyncSnapshot<double> totalQuantitySnapshot) {
                    if (productsnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return LoadingHairil();
                    }
                    if (totalQuantitySnapshot.hasError) {
                      return Text('Error: ${totalQuantitySnapshot.error}');
                    }

                    final totalitemquantity = totalQuantitySnapshot.data ?? 0;

                    return Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      child: Row(
                        children: [
                          Container(
                            height: 350.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(productsnapshot
                                    .data!.docs[index]
                                    .get('url')),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 45.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmallText(
                                text: productsnapshot.data!.docs[index]
                                    .get('name'),
                                size: 64.sp,
                                color: AppColors.c333333_100,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  SmallText(
                                    text: 'Total : ',
                                    size: 48.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.c333333_100,
                                  ),
                                  SmallText(
                                    text: totalitemquantity.toStringAsFixed(0),
                                    size: 48.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.cC8151D_100,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Future<double> calculateTotalItemQuantity(
      QuerySnapshot productsnapshot, int index, BuildContext context) async {
    double totalitemquantity = 0;

    final orderSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('PickupTime',
            isGreaterThanOrEqualTo: DateTime(now.year, now.month, now.day).add(const Duration(days: 1)).toUtc())
        .where('PickupTime',
            isLessThanOrEqualTo: DateTime(now.year, now.month, now.day).add(const Duration(days: 2)).toUtc())
        .get();
    for (final orderDoc in orderSnapshot.docs) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderDoc.id)
          .collection('items')
          .where('item name',
              isEqualTo: productsnapshot.docs[index].get('name'))
          .get();
      for (var itemDoc in querySnapshot.docs) {
        totalitemquantity += itemDoc.get('quantity');
      }
    }

    return totalitemquantity;
  }
}
