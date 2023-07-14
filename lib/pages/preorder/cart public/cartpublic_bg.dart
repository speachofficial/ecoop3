import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../functions/cartchecker_function.dart';
import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/smalltext.dart';
import 'cartpublic.dart';

class MainCartPage extends StatefulWidget {
  const MainCartPage({super.key});

  @override
  State<MainCartPage> createState() => _MainCartPageState();
}

class _MainCartPageState extends State<MainCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
              child: Stack(
            children: [
              Image.asset('assets/images/bghomepage.png',
                  fit: BoxFit.cover, width: 1620.w),
              const MainCartPageContent(),
            ],
          )),
          role != 'parent'
              ? SizedBox(
                  height: 2160.h,
                  width: 1620.w,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 200.h,
                      width: 1620.w,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20.r)),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColors.c000000_25,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ],
                          color: AppColors.cFFFFFF_100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 1620.w - 438.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(
                                  text: 'Total  ',
                                  size: 40.sp,
                                  color: AppColors.c000000_50,
                                ),
                                FutureBuilder(
                                  future: getCartItems(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasData &&
                                          snapshot.data!.docs.isNotEmpty) {
                                        double total = 0;
                                        for (var element
                                            in snapshot.data!.docs) {
                                          final data = element.data()
                                              as Map<String, dynamic>;
                                          total = (total + data['total RM']);
                                        }

                                        return SmallText(
                                          text:
                                              'RM ${total.toStringAsFixed(2)}',
                                          size: 48.sp,
                                          color: AppColors.c000000_100,
                                          fontWeight: FontWeight.w600,
                                        );
                                      } else {
                                        return SmallText(
                                          text: 'RM 0.00',
                                          size: 48.sp,
                                          color: AppColors.c000000_100,
                                          fontWeight: FontWeight.w600,
                                        );
                                      }
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                                // SmallText(
                                //   text: (snapshot.data!
                                //               as Map<String, dynamic>)['total RM'],
                                //   size: 48.sp,
                                //   color: AppColors.c000000_100,
                                //   fontWeight: FontWeight.w600,
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200.h,
                            width: 438.w,
                            child: ElevatedButton(
                                onPressed: () {
                                  cartchecker(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.r)),
                                    ),
                                    backgroundColor: AppColors.cEA2127_100),
                                child: SmallText(
                                  text: 'Check Out',
                                  size: 48.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.cFFFFFF_100,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      )),
    );
  }
}
