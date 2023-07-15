import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/smalltext.dart';
import '../preorder products student/preorderproductsstudent_bg.dart';

class StudentCart extends StatelessWidget {
  const StudentCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getCartItems(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Dismissible(
                        background: Container(
                          color: AppColors.cC8151D_100,
                        ),
                        key: Key(snapshot.data!.docs[index].id),
                        onDismissed: (DismissDirection direction) {
                          snapshot.data!.docs[index].reference.delete();
                        },
                        child: ListTile(
                          leading: Container(
                            height: 100.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: AppColors.c000000_25,
                              width: 5.w,
                            )),
                            child: Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: snapshot.data!.docs[index]
                                      .get("quantity")
                                      .toString(),
                                  size: 35.sp,
                                  color: AppColors.c000000_100,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          title: SmallText(
                            text: snapshot.data!.docs[index].get("item name"),
                            size: 48.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cC8151D_100,
                          ),
                          trailing: SmallText(
                            text:
                                'RM ${snapshot.data!.docs[index].get("total RM").toStringAsFixed(2)}',
                            size: 48.sp,
                            color: AppColors.c000000_100,
                          ),
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
            margin: EdgeInsets.only(top: 52.h, bottom: 47.h),
            width: double.maxFinite,
            height: 5.h,
            color: AppColors.c000000_25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainFoodsPage(),
                  ),
                );
              },
              child: SmallText(
                text: 'Add more items',
                size: 40.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.cC8151D_100,
              ),
            ),
            // Container(
            //   height: 86.h,
            // ),
            // SmallText(
            //   text: 'Popular with your order',
            //   size: 50.sp,
            //   fontWeight: FontWeight.bold,
            //   color: AppColors.c333333_100,
            // ),
            // SizedBox(
            //   height: 5.h,
            // ),
            // SmallText(
            //   text: 'Based on what other customer bought together',
            //   size: 40.sp,
            //   fontWeight: FontWeight.w500,
            //   color: AppColors.c333333_75,
            // ),
            // SizedBox(
            //   height: 47.h,
            // ),
            // SizedBox(
            //   height: 350.h,
            //   child: StreamBuilder(
            //       stream: getAvailableProducts(),
            //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //         if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            //           return ListView.builder(
            //               scrollDirection: Axis.horizontal,
            //               itemCount: (snapshot.data?.docs.length ?? 0),
            //               shrinkWrap: true,
            //               itemBuilder: (context, index) {
            //                 return Container(
            //                   height: 350.h,
            //                   width: 350.h,
            //                   margin: EdgeInsets.all(11.h),
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(
            //                           20.r),
            //                       image: DecorationImage(
            //                           colorFilter: ColorFilter.mode(
            //                               AppColors.c000000_100
            //                                   .withOpacity(0.3),
            //                               BlendMode.darken),
            //                           image: NetworkImage(
            //                             snapshot.data!.docs[index].get("url"),
            //                           ),
            //                           fit: BoxFit.cover)),
            //                   child: Container(
            //                     margin: EdgeInsets.all(11.h),
            //                     height: 98.h,
            //                     width: 98.h,
            //                     alignment: Alignment.bottomRight,
            //                     child: FloatingActionButton(
            //                       heroTag: null,
            //                       onPressed: () {},
            //                       backgroundColor: AppColors.cC8151D_100,
            //                       child: Icon(
            //                         Icons.add,
            //                         size: 47.sp,
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               });
            //         } else {
            //           return Container(
            //               height: 350.h,
            //               width: 350.h,
            //               margin: EdgeInsets.all(11.h),
            //               decoration: BoxDecoration(
            //                 border: Border.all(
            //                     color: AppColors.cC8151D_100,
            //                     width: 3.h),
            //                 borderRadius:
            //                     BorderRadius.circular(20.r),
            //               ),
            //               child: Center(
            //                 child: SmallText(
            //                   text: 'No Item Available',
            //                   size: 36.sp,
            //                   fontWeight: FontWeight.w500,
            //                   color: AppColors.cC8151D_100,
            //                 ),
            //               ));
            //         }
            //       }),
            // ),
            // SizedBox(
            //   height: 350.h,
            //   child: ListView.builder(
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (_, i) {
            //         return Container(
            //           height: 350.h,
            //           width: 350.h,
            //           margin: EdgeInsets.all(11.h),
            //           decoration: BoxDecoration(
            //               borderRadius:
            //                   BorderRadius.circular(20.r),
            //               image: const DecorationImage(
            //                   image:
            //                       AssetImage('assets/images/nasilemak.png'),
            //                   fit: BoxFit.cover)),
            //           child: Container(
            //             margin: EdgeInsets.all(11.h),
            //             height: 98.h,
            //             width: 98.h,
            //             alignment: Alignment.bottomRight,
            //             child: FloatingActionButton(
            //               onPressed: () {},
            //               backgroundColor: AppColors.cC8151D_100,
            //               child: Icon(
            //                 Icons.add,
            //                 size: 47.sp,
            //               ),
            //             ),
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ],
    );
  }
}
