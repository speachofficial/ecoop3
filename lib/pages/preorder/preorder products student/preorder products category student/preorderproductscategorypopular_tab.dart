import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/my_package.dart';
import '../../../../widgets/done.dart';
import '../../../../widgets/smalltext.dart';

class PopularContent extends StatefulWidget {
  const PopularContent({super.key});

  @override
  State<PopularContent> createState() => _PopularContentState();
}

class _PopularContentState extends State<PopularContent> {
  @override
  Widget build(BuildContext context) {
    int additemvalue = 1;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fireplace_outlined,
                      size: 69.sp,
                      color: AppColors.cFFC700_100,
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    SmallText(
                      text: 'Popular',
                      size: 75.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.c000000_100,
                    )
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                SmallText(
                  text: 'Most ordered right now',
                  size: 48.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_75,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 60.h,
        ),

        StreamBuilder(
          stream: getAvailableProducts(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        child: GestureDetector(
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
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50.r)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 1620.w,
                                      height: 778.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(50.r)),
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
                                              text: snapshot.data!.docs[index]
                                                  .get("name"),
                                              size: 50.sp,
                                              color: AppColors.c000000_100,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            trailing: SmallText(
                                              text:
                                                  'RM ${snapshot.data!.docs[index].get("RM").toStringAsFixed(2)}',
                                              size: 50.sp,
                                              color: AppColors.c000000_100,
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
                                                      text: '$additemvalue',
                                                      size: 64.sp,
                                                      color:
                                                          AppColors.c000000_100,
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
                                                      FirebaseFirestore.instance
                                                          .collection('Users')
                                                          .doc(userid)
                                                          .collection('cart')
                                                          .doc(snapshot
                                                              .data!.docs[index]
                                                              .get("name"))
                                                          .set({
                                                        'item name': snapshot
                                                            .data!.docs[index]
                                                            .get("name"),
                                                        'quantity':
                                                            additemvalue,
                                                        'price': snapshot
                                                            .data!.docs[index]
                                                            .get("RM"),
                                                        'total RM': snapshot
                                                                .data!
                                                                .docs[index]
                                                                .get("RM") *
                                                            additemvalue
                                                      });
                                                      done(context);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.r)),
                                                        backgroundColor:
                                                            AppColors
                                                                .cC8151D_100),
                                                    child: SmallText(
                                                      text: 'Add to cart',
                                                      size: 48.sp,
                                                      color:
                                                          AppColors.cFFFFFF_100,
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
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(13.w),
                        height: 800.h,
                        width: 675.w,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.all(65.w),
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
                                width: 313.w,
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
                    ));
                  });
            } else {
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
            }
          },
        ),

        // SizedBox(
        //   height: 500,
        //   width: 5000,
        //   child: GridView.builder(
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2),
        //       itemCount: 3,
        //       itemBuilder: (_, i) {
        //         return GridTile(child: FoodCard());
        //       }),
        // ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: Wrap(
        //       spacing: 90.h,
        //       runSpacing: 90.h,
        //       children: const [
        //         FoodCard(),
        //         FoodCard(),
        //         FoodCard(),
        //       ]),
        // ),
      ],
    );
  }
}
