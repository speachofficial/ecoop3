import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/utils/my_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/empty.dart';
import '../../../../../widgets/exit.dart';
import '../../../../../widgets/loadinghairil.dart';
import '../../../../../widgets/smalltext.dart';

class MyHistoryToReceiveContent extends StatelessWidget {
  const MyHistoryToReceiveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('orders')
            .where('userid', isEqualTo: userid)
            .where('cancelled', isEqualTo: false)
            .where('paid', isEqualTo: false)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingHairil();
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingHairil();
                  }
                  if (snapshot.data!.docs.isNotEmpty) {
                    return Align(
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  resizeToAvoidBottomInset: false,
                                  body: SafeArea(
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                            'assets/images/bghomepage.png',
                                            fit: BoxFit.cover,
                                            width: 1620.w),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 32.h,
                                              left: 118.w,
                                              right: 118.w),
                                          child: Column(
                                            children: [
                                              Stack(children: [
                                                const MyExitButton(),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: BigText(
                                                      text: snapshot
                                                          .data!.docs[index]
                                                          .get("OrderNumber"),
                                                      size: 64.sp,
                                                      color:
                                                          AppColors.cC8151D_100,
                                                    ))
                                              ]),
                                              SizedBox(
                                                height: 253.h,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 93.w,
                                                    vertical: 41.h),
                                                width: 1320.w,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.cFFFFFF_100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: AppColors
                                                              .c333333_25,
                                                          offset:
                                                              Offset(0.0, 4.0),
                                                          blurRadius: 25,
                                                          spreadRadius: 2)
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .receipt_long_rounded,
                                                          color: AppColors
                                                              .cC8151D_100,
                                                          size:
                                                              81.sp,
                                                        ),
                                                        SizedBox(
                                                          width: 39.w,
                                                        ),
                                                        SmallText(
                                                          text: 'Customer info',
                                                          size: 64.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .c000000_100,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 60.h,
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text: 'Name',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text: snapshot
                                                              .data!.docs[index]
                                                              .get("Customer"),
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text: 'Class',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text: snapshot
                                                              .data!.docs[index]
                                                              .get("Class"),
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text: 'Pick-up time',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text: DateFormat(
                                                                  'hh:mm a - 11:30 a (d/M)')
                                                              .format(snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .get(
                                                                      "PickupTime")
                                                                  .toDate()),
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 60.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .receipt_long_rounded,
                                                          color: AppColors
                                                              .cC8151D_100,
                                                          size:
                                                              81.sp,
                                                        ),
                                                        SizedBox(
                                                          width: 39.w,
                                                        ),
                                                        SmallText(
                                                          text: 'Order summary',
                                                          size: 64.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .c000000_100,
                                                        )
                                                      ],
                                                    ),
                                                    FutureBuilder(
                                                      future: FirebaseFirestore
                                                          .instance
                                                          .collection('orders')
                                                          .doc(snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  "OrderNumber"))
                                                          .collection('items')
                                                          .get(),
                                                      builder: (context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              itemsnapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return LoadingHairil();
                                                        }

                                                        return ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                itemsnapshot
                                                                    .data!
                                                                    .docs
                                                                    .length,
                                                            itemBuilder:
                                                                (_, index) {
                                                              return Container(
                                                                height: 48.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10.h),
                                                                child: ListTile(
                                                                  leading:
                                                                      SmallText(
                                                                    text:
                                                                        '${itemsnapshot.data!.docs[index].get("quantity")}x',
                                                                    size: 40.sp,
                                                                    color: AppColors
                                                                        .c000000_60,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  title:
                                                                      SmallText(
                                                                    text: itemsnapshot
                                                                        .data!
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            "item name"),
                                                                    size: 40.sp,
                                                                    color: AppColors
                                                                        .c000000_60,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  trailing:
                                                                      SmallText(
                                                                    text:
                                                                        'RM ${itemsnapshot.data!.docs[index].get("total").toStringAsFixed(2)}',
                                                                    size: 40.sp,
                                                                    color: AppColors
                                                                        .c000000_60,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                    ),
                                                    Container(
                                                      height: 5.h,
                                                      width: double.maxFinite,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 60.h),
                                                      color:
                                                          AppColors.c000000_25,
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text: 'Subtotal',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text:
                                                              'RM ${snapshot.data!.docs[index].get("Subtotal").toStringAsFixed(2)}',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text: 'Discount',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text:
                                                              'RM ${snapshot.data!.docs[index].get("discount").toStringAsFixed(2)}',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 48.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 10.h),
                                                      child: ListTile(
                                                        title: SmallText(
                                                          text:
                                                              'Processing fee',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        trailing: SmallText(
                                                          text:
                                                              'RM ${snapshot.data!.docs[index].get("processingfee").toStringAsFixed(2)}',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_60,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 40.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        SmallText(
                                                          text: 'Total',
                                                          size: 40.sp,
                                                          color: AppColors
                                                              .c000000_50,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        SizedBox(
                                                          width: 30.w,
                                                        ),
                                                        SmallText(
                                                          text:
                                                              'RM ${snapshot.data!.docs[index].get("overalltotal").toStringAsFixed(2)}',
                                                          size: 48.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .cC8151D_100,
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
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.all(32.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 93.w, vertical: 41.h),
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
                                    text: 'Order summary',
                                    size: 64.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.c000000_100,
                                  )
                                ],
                              ),
                              FutureBuilder<QuerySnapshot>(
                                future: FirebaseFirestore.instance
                                    .collection('orders')
                                    .doc(snapshot.data!.docs[index]
                                        .get("OrderNumber"))
                                    .collection('items')
                                    .get(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> itemsnapshot) {
                                  if (itemsnapshot.hasData &&
                                      itemsnapshot.data != null) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: itemsnapshot.data!.docs.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                          height: 48.h,
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          child: ListTile(
                                            leading: SmallText(
                                              text:
                                                  '${itemsnapshot.data!.docs[index].get("quantity")}x',
                                              size: 40.sp,
                                              color: AppColors.c000000_60,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            title: SmallText(
                                              text: itemsnapshot
                                                  .data!.docs[index]
                                                  .get("item name"),
                                              size: 40.sp,
                                              color: AppColors.c000000_60,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            trailing: SmallText(
                                              text:
                                                  'RM ${itemsnapshot.data!.docs[index].get("total").toStringAsFixed(2)}',
                                              size: 40.sp,
                                              color: AppColors.c000000_60,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Container();
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
                                        'RM ${snapshot.data!.docs[index].get("Subtotal").toStringAsFixed(2)}',
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
                                        'RM ${snapshot.data!.docs[index].get("discount").toStringAsFixed(2)}',
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
                                        'RM ${snapshot.data!.docs[index].get("processingfee").toStringAsFixed(2)}',
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
                                        'RM ${snapshot.data!.docs[index].get("overalltotal").toStringAsFixed(2)}',
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
                });
          } else {
            return const EmptyHairil();
          }
        });
  }
}
