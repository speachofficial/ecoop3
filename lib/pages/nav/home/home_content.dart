import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/pages/admin/bidding%20admin/bid%20products%20admin/bidmainadmin_bg.dart';
import 'package:ecoop3/pages/admin/preorder/preorder%20shop%20admin/preordershopadmin_bg.dart';
import 'package:ecoop3/pages/preorder/preorder%20products%20student/preorderproductsstudent_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/done.dart';
import '../../../widgets/foodcard.dart';
import '../../../widgets/smalltext.dart';
import '../../bidding/bid mall parents/bidmallparents_bg.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 118.w, right: 118.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          role == 'admin'
              ? const Column(
                  children: [HomePagePreOrderFoods(), HomePageLiveBidding()],
                )
              : role == 'student'
                  ? const HomePagePreOrderFoods()
                  : const HomePageLiveBidding()
        ],
      ),
    );
  }
}

class HomePagePreOrderFoods extends StatefulWidget {
  const HomePagePreOrderFoods({super.key});

  @override
  State<HomePagePreOrderFoods> createState() => _HomePagePreOrderFoodsState();
}

class _HomePagePreOrderFoodsState extends State<HomePagePreOrderFoods> {
  @override
  Widget build(BuildContext context) {
    int additemvalue = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(),
        // SmallText(
        //   text: 'Preorder Foods',
        //   size: 48.sp,
        //   color: AppColors.c000000_100,
        //   fontWeight: FontWeight.bold,
        // ),
        // SizedBox(
        //   height: 50.h,
        // ),
        // SizedBox(
        //   height: 200.w,
        //   child: ListView.builder(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 5,
        //       itemBuilder: (_, w) {
        //         return Padding(
        //             padding: EdgeInsets.all(13.h),
        //             child: Container(
        //               width: 200.w,
        //               height: 200.w,
        //               decoration: BoxDecoration(
        //                   color: AppColors.cE9E9E9_70,
        //                   borderRadius:
        //                       BorderRadius.circular(30.r)),
        //             ));
        //       }),
        // ),
        // SizedBox(
        //   height: 100.h,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(
              text: 'Tonight Delicacy',
              size: 48.sp,
              color: AppColors.c000000_100,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                role == 'admin'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMyShopsPage(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodsPage(),
                        ),
                      );
              },
              child: SmallText(
                text: 'View All',
                size: 32.sp,
                color: AppColors.cC8151D_100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        SizedBox(
          height: 800.h,
          child: StreamBuilder(
            stream: getAvailableProducts(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: (snapshot.data?.docs.length ?? 0),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          role != 'admin'
                              ? showModalBottomSheet<dynamic>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 1318.h,
                                      width: 1620.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.cFFFFFF_100,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(50.r)),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 1620.w,
                                            height: 778.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            50.r)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      snapshot.data!.docs[index]
                                                          .get("url"),
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            height: 48.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 203.h),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: SmallText(
                                                    text: snapshot
                                                        .data!.docs[index]
                                                        .get("name"),
                                                    size: 50.sp,
                                                    color:
                                                        AppColors.c000000_100,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  trailing: SmallText(
                                                    text:
                                                        'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
                                                    size: 50.sp,
                                                    color:
                                                        AppColors.c000000_100,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 171.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 100.h,
                                                      width: 360.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                              height: 100.h,
                                                              width: 100.h,
                                                              child:
                                                                  FloatingActionButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (additemvalue >
                                                                        1) {
                                                                      additemvalue--;
                                                                    }
                                                                  });
                                                                },
                                                                backgroundColor:
                                                                    AppColors
                                                                        .cD9D9D9_100,
                                                                elevation: 0,
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 63.sp,
                                                                  color: AppColors
                                                                      .c000000_100,
                                                                ),
                                                              )),
                                                          SmallText(
                                                            text:
                                                                '$additemvalue',
                                                            size: 64.sp,
                                                            color: AppColors
                                                                .c000000_100,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox(
                                                              height: 100.h,
                                                              width: 100.h,
                                                              child:
                                                                  FloatingActionButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    additemvalue++;
                                                                  });
                                                                },
                                                                backgroundColor:
                                                                    AppColors
                                                                        .cC8151D_100,
                                                                elevation: 0,
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 63.sp,
                                                                  color: AppColors
                                                                      .cFFFFFF_100,
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
                                                          onPressed: () {
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Users')
                                                                .doc(userid)
                                                                .collection(
                                                                    'cart')
                                                                .doc(snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .get(
                                                                        "name"))
                                                                .set({
                                                              'item name':
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          "name"),
                                                              'quantity':
                                                                  additemvalue,
                                                              'price': snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .get("RM"),
                                                              'total RM': snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          "RM") *
                                                                  additemvalue
                                                            });
                                                            done(context);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(25
                                                                              .r)),
                                                              backgroundColor:
                                                                  AppColors
                                                                      .cC8151D_100),
                                                          child: SmallText(
                                                            text: 'Add to cart',
                                                            size: 48.sp,
                                                            color: AppColors
                                                                .cFFFFFF_100,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                  })
                              : null;
                        },
                        child: Container(
                          padding: EdgeInsets.all(13.h),
                          margin: EdgeInsets.all(16.h),
                          height: 800.h,
                          width: 800.h/800*700,
                          decoration: BoxDecoration(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(65.h),
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: snapshot.data!.docs[index].get("name"),
                                  size: 64.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cFFFFFF_100,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.all(32.h),
                                  width: 100.h/100*313,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(41.6),
                                      color: Colors.white),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SmallText(
                                        text:
                                            'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
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
                    });
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
                      text: 'No Item Available',
                      size: 48.sp,
                      color: AppColors.cC8151D_100,
                      fontWeight: FontWeight.w500,
                    ),
                  ));
            },
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
      ],
    );
  }
}

class HomePageLiveBidding extends StatelessWidget {
  const HomePageLiveBidding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(
              text: 'Live Bidding',
              size: 48.sp,
              color: AppColors.c000000_100,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                role == 'admin'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainBiddingItemsPage(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainLiveAuctionPage(),
                        ),
                      );
              },
              child: SmallText(
                text: 'View All',
                size: 32.sp,
                color: AppColors.cC8151D_100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        SizedBox(
          height: 800.h,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, h) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 13.h, horizontal: 32.h),
                  child: const FoodCard(),
                );
              }),
        )
      ],
    );
  }
}
