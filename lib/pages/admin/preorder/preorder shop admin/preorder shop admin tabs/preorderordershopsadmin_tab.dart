// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/widgets/areyousure.dart';
import 'package:ecoop3/widgets/done.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/my_package.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/empty.dart';
import '../../../../../widgets/loadinghairil.dart';
import '../../../../../widgets/smalltext.dart';

class MyShopOrdersContent extends StatelessWidget {
  const MyShopOrdersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getstudentsorder(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: SmallText(
                      text: 'Student Orders',
                      size: 48.sp,
                      color: AppColors.c000000_100,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              ListView.separated(
                shrinkWrap: true,
                itemCount: (snapshot.data?.docs.length ?? 0),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 5.h,
                    color: AppColors.c000000_50,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 32.h),
                    height: 175.h,
                    width: 1370.w,
                    child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  body: SafeArea(
                                      child: SingleChildScrollView(
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
                                                const MyBackButton(),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: BigText(
                                                      text: snapshot
                                                          .data!.docs[index]
                                                          .get("OrderNumber"),
                                                      size: 64.sp,
                                                      color:
                                                          AppColors.c333333_100,
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
                                                          size: 81.sp,
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
                                                                  'HH:mm a')
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
                                                          size: 81.sp,
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
                                                    StreamBuilder(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection('orders')
                                                          .doc(snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  "OrderNumber"))
                                                          .collection('items')
                                                          .snapshots(),
                                                      builder: (context,
                                                          AsyncSnapshot<
                                                                  QuerySnapshot>
                                                              snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return LoadingHairil();
                                                        }
                                                        if (snapshot.data!.docs
                                                            .isNotEmpty) {
                                                          return ListView
                                                              .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      snapshot
                                                                          .data!
                                                                          .docs
                                                                          .length,
                                                                  itemBuilder:
                                                                      (_, index) {
                                                                    return Container(
                                                                      height:
                                                                          48.h,
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              10.h),
                                                                      child:
                                                                          ListTile(
                                                                        leading:
                                                                            SmallText(
                                                                          text:
                                                                              '${snapshot.data!.docs[index].get("quantity")}x',
                                                                          size:
                                                                              40.sp,
                                                                          color:
                                                                              AppColors.c000000_60,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                        title:
                                                                            SmallText(
                                                                          text: snapshot
                                                                              .data!
                                                                              .docs[index]
                                                                              .get("item name"),
                                                                          size:
                                                                              40.sp,
                                                                          color:
                                                                              AppColors.c000000_60,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                        trailing:
                                                                            SmallText(
                                                                          text:
                                                                              'RM ${snapshot.data!.docs[index].get("total").toStringAsFixed(2)}',
                                                                          size:
                                                                              40.sp,
                                                                          color:
                                                                              AppColors.c000000_60,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.h),
                                                            child: ListTile(
                                                              title: SmallText(
                                                                text: 'No item',
                                                                size: 48.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .c000000_100,
                                                              ),
                                                            ),
                                                          );
                                                        }
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
                                                height: 234.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 125.h,
                                                    width: 640.w,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          areyousure(context,
                                                              onPressedYes: () {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'orders')
                                                                .doc(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .get(
                                                                        "OrderNumber"))
                                                                .update({
                                                              'paid': true
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                            done(context);
                                                          });
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(20
                                                                            .r)),
                                                            backgroundColor:
                                                                AppColors
                                                                    .cEA2127_100),
                                                        child: SmallText(
                                                          text: 'Paid',
                                                          size: 32.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .cFFFFFF_100,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 52.w,
                                                  ),
                                                  SizedBox(
                                                      height: 125.h,
                                                      width: 640.w,
                                                      child: OutlinedButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    AlertDialog(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.r)),
                                                                      title: SmallText(
                                                                          text:
                                                                              'Cancel this order?',
                                                                          color: AppColors
                                                                              .cC8151D_100,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          textAlign: TextAlign
                                                                              .center,
                                                                          size:
                                                                              64.sp),
                                                                      content:
                                                                          Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                115.h,
                                                                            width:
                                                                                720.w,
                                                                            child: ElevatedButton(
                                                                                onPressed: () {
                                                                                  FirebaseFirestore.instance.collection('orders').doc(snapshot.data!.docs[index].get("OrderNumber")).update({
                                                                                    'cancelled': true
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                  done(context);
                                                                                },
                                                                                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)), backgroundColor: AppColors.cEA2127_100),
                                                                                child: SmallText(
                                                                                  text: 'Yes',
                                                                                  size: 32.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: AppColors.cFFFFFF_100,
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                30.w,
                                                                          ),
                                                                          SizedBox(
                                                                              height: 115.h,
                                                                              width: 270.w,
                                                                              child: OutlinedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  style: OutlinedButton.styleFrom(
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(20.r),
                                                                                      ),
                                                                                      side: BorderSide(
                                                                                        width: 3.h,
                                                                                        color: AppColors.cC8151D_100,
                                                                                      )),
                                                                                  child: SmallText(
                                                                                    text: 'No',
                                                                                    size: 32.sp,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: AppColors.cC8151D_100,
                                                                                  ))),
                                                                        ],
                                                                      ),
                                                                    ));
                                                          },
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.r),
                                                                  ),
                                                                  side:
                                                                      BorderSide(
                                                                    width: 3.h,
                                                                    color: AppColors
                                                                        .cC8151D_100,
                                                                  )),
                                                          child: SmallText(
                                                            text: 'Cancel',
                                                            size: 32.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .cC8151D_100,
                                                          ))),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 150.h,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                );
                              });
                        },
                        leading: SizedBox(
                          height: 175.h,
                          width: 175.h,
                          child: Transform.scale(
                            scale: 3.h,
                            child: CircleAvatar(
                              radius: 56.r,
                            ),
                          ),
                        ),
                        title: Row(
                          children: [
                            SmallText(
                              text: 'ORDER ',
                              size: 48.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c333333_100,
                            ),
                            SmallText(
                              text:
                                  snapshot.data!.docs[index].get("OrderNumber"),
                              size: 48.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cC8151D_100,
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: snapshot.data!.docs[index].get("Customer"),
                              size: 40.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.c000000_50,
                            ),
                            SmallText(
                              text: DateFormat('HH:mm a').format(snapshot
                                  .data!.docs[index]
                                  .get("PickupTime")
                                  .toDate()),
                              size: 40.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.c000000_50,
                            ),
                          ],
                        ),
                        trailing: Text.rich(TextSpan(children: [
                          TextSpan(
                              text:
                                  'RM ${snapshot.data!.docs[index].get("overalltotal").toStringAsFixed(2)}',
                              style: GoogleFonts.inter(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cC8151D_100)),
                          WidgetSpan(
                              child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 47.sp,
                            color: AppColors.cC8151D_100,
                          ))
                        ]))),
                  );
                },
              ),
            ],
          );
        } else {
          return const Align(alignment: Alignment.center, child: EmptyHairil());
        }
      },
    );
  }
}
