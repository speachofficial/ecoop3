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
                'Order For ${DateFormat('EEEE, dd / MM').format(now.add(const Duration(days: 1)).toUtc())}',
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
    // DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    // DateTime tomorrowStart =
    //     DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    // DateTime tomorrowEnd = tomorrowStart.add(const Duration(days: 1));

    final orderSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('PickupTime',
            isGreaterThanOrEqualTo: now.add(const Duration(days: 1)).toUtc())
        .where('PickupTime',
            isLessThanOrEqualTo: now.add(const Duration(days: 2)).toUtc())
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

// class MyShopSummaryContent extends StatelessWidget {
//   const MyShopSummaryContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: FirebaseFirestore.instance
//           .collection('preorder_products')
//           .where('instock', isEqualTo: true)
//           .get(),
//       builder: (BuildContext context, AsyncSnapshot productsnapshot) {
//         if (productsnapshot.connectionState == ConnectionState.waiting) {
//           return LoadingHairil();
//         }
//         if (!productsnapshot.hasData) {
//           return const EmptyHairil();
//         }
//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount: productsnapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               FirebaseFirestore.instance
//                   .collection('orders')
//                   .snapshots()
//                   .listen((orderSnapshot) {
//                 orderSnapshot.docs.forEach((orderDoc) {
//                   FirebaseFirestore.instance
//                       .collection('orders')
//                       .doc(orderDoc.id)
//                       .collection('items')
//                       .where('item name',
//                           isEqualTo: productsnapshot.data[index].get('name'))
//                       .get()
//                       .then((querySnapshot) {
//                     // Process the querySnapshot here
//                     querySnapshot.docs.forEach((itemDoc) {
//                       totalitemquantity += itemDoc.get('quantity');
//                     });
//                   }).then((value) {
//                     return null;
//                   });
//                 });
//               });
//               return Container(
//                 margin: EdgeInsets.only(bottom: 30.h),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 350.h,
//                       width: 350.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.r),
//                         color: Colors.amber,
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               productsnapshot.data!.docs[index].get('url')),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 45.w,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SmallText(
//                           text: productsnapshot.data!.docs[index].get('name'),
//                           size: 64.sp,
//                           color: AppColors.c333333_100,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         Row(
//                           children: [
//                             SmallText(
//                               text: '22/6/2023 : ',
//                               size: 48.sp,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.c333333_100,
//                             ),
//                             SmallText(
//                               text: totalitemquantity.toString(),
//                               size: 48.sp,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.cC8151D_100,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             });
//       },
//     );
//   }
// }



    // return StreamBuilder<QuerySnapshot>(
    //   stream: getAvailableProducts(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return LoadingHairil();
    //     }

    //     if (snapshot.hasData) {
    //       return StreamBuilder(
    //           stream: getstudentsorder(),
    //           builder: (context, ordersnapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return LoadingHairil();
    //             }
    //             return ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: snapshot.data!.docs.length,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   margin: EdgeInsets.only(bottom: 30.h),
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         height: 350.h,
    //                         width: 350.w,
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(20.r),
    //                           color: Colors.amber,
    //                           image: DecorationImage(
    //                             image: NetworkImage(
    //                                 snapshot.data!.docs[index].get('url')),
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 45.w,
    //                       ),
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           SmallText(
    //                             text: snapshot.data!.docs[index].get('name'),
    //                             size: 64.sp,
    //                             color: AppColors.c333333_100,
    //                             fontWeight: FontWeight.w600,
    //                           ),
    //                           Row(
    //                             children: [
    //                               SmallText(
    //                                 text: '22/6/2023 : ',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.c333333_100,
    //                               ),
    //                               SmallText(
    //                                 text: '',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.cC8151D_100,
    //                               ),
    //                             ],
    //                           ),
    //                           Row(
    //                             children: [
    //                               SmallText(
    //                                 text: '23/6/2023 : ',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.c333333_100,
    //                               ),
    //                               SmallText(
    //                                 text: '26',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.cC8151D_100,
    //                               ),
    //                             ],
    //                           ),
    //                           Row(
    //                             children: [
    //                               SmallText(
    //                                 text: '24/6/2023 : ',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.c333333_100,
    //                               ),
    //                               SmallText(
    //                                 text: '38',
    //                                 size: 48.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: AppColors.cC8151D_100,
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             );
    //           });
    //     } else {
    //       return const EmptyHairil();
    //     }
    //   },
    // );

    // return StreamBuilder(
    //   stream: getstudentsorder(),
    //   builder: (context, ordersnapshot) {
    //     if (ordersnapshot.connectionState == ConnectionState.waiting) {
    //       return LoadingHairil();
    //     }
    //     if (ordersnapshot.hasData && ordersnapshot.data!.docs.isNotEmpty) {
    //       // FirebaseFirestore.instance.collection('orders').where('paid', isEqualTo: false).snapshots().forEach((element) {

    //       // });
    //       return Container();
    //     } else {
    //       return const EmptyHairil();
    //     }
    //   },
    // );

    // return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: 3,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         margin: EdgeInsets.only(bottom: 30.h),
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 350.h,
    //               width: 350.w,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20.r),
    //                   color: Colors.amber,
    //                   image: const DecorationImage(
    //                       image: AssetImage('assets/images/nasilemak.png'),
    //                       fit: BoxFit.cover)),
    //             ),
    //             SizedBox(
    //               width: 45.w,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 SmallText(
    //                   text: 'Nasi Lemak',
    //                   size: 64.sp,
    //                   color: AppColors.c333333_100,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //                 Row(
    //                   children: [
    //                     SmallText(
    //                       text: '22/6/2023 : ',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.c333333_100,
    //                     ),
    //                     SmallText(
    //                       text: '35',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.cC8151D_100,
    //                     )
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     SmallText(
    //                       text: '23/6/2023 : ',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.c333333_100,
    //                     ),
    //                     SmallText(
    //                       text: '26',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.cC8151D_100,
    //                     )
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     SmallText(
    //                       text: '24/6/2023 : ',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.c333333_100,
    //                     ),
    //                     SmallText(
    //                       text: '38',
    //                       size: 48.sp,
    //                       fontWeight: FontWeight.w600,
    //                       color: AppColors.cC8151D_100,
    //                     )
    //                   ],
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       );
    //     });

    // return StreamBuilder<QuerySnapshot>(
    //     stream: getAvailableProducts(),
    //     builder: (context, AsyncSnapshot<QuerySnapshot> productsnapshot) {
    //       if (productsnapshot.connectionState == ConnectionState.waiting) {
    //         return LoadingHairil();
    //       }
    //       return StreamBuilder<QuerySnapshot>(
    //         stream: getstudentsorder(),
    //         builder: (context, AsyncSnapshot<QuerySnapshot> ordersnapshot) {
    //           if (ordersnapshot.connectionState == ConnectionState.waiting) {
    //             return LoadingHairil();
    //           }
    //           if (ordersnapshot.hasData &&
    //               ordersnapshot.data!.docs.isNotEmpty) {
    //             return ListView.builder(
    //                 shrinkWrap: true,
    //                 itemCount: (ordersnapshot.data?.docs.length ?? 0),
    //                 itemBuilder: (context, index) {
    //                   return Container(
    //                     margin: EdgeInsets.only(bottom: 30.h),
    //                     child: Row(
    //                       children: [
    //                         Container(
    //                           height: 350.h,
    //                           width: 350.w,
    //                           decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(
    //                                   20.r),
    //                               color: Colors.amber,
    //                               image: DecorationImage(
    //                                   image: NetworkImage(productsnapshot
    //                                       .data!.docs[index]
    //                                       .get('url')),
    //                                   fit: BoxFit.cover)),
    //                         ),
    //                         SizedBox(
    //                           width: 45.w,
    //                         ),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             SmallText(
    //                               text: 'Nasi Lemak',
    //                               size: 64.sp,
    //                               color: AppColors.c333333_100,
    //                               fontWeight: FontWeight.w600,
    //                             ),
    //                             Row(
    //                               children: [
    //                                 SmallText(
    //                                   text: 'Total : ',
    //                                   size: 48.sp,
    //                                   fontWeight: FontWeight.w600,
    //                                   color: AppColors.c333333_100,
    //                                 ),
    //                                 SmallText(
    //                                   text: '1234567875432345654323456',
    //                                   size: 48.sp,
    //                                   fontWeight: FontWeight.w600,
    //                                   color: AppColors.cC8151D_100,
    //                                 )
    //                               ],
    //                             )
    //                           ],
    //                         )
    //                       ],
    //                     ),
    //                   );
    //                 });
    //           } else {
    //             return const EmptyHairil();
    //           }
    //         },
    //       );
    //     });