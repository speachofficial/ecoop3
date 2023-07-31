import 'package:ecoop3/pages/sign%20in/sign%20up%20public/sign%20up%20public/signuppublic.dart';
import 'package:ecoop3/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_package.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';

class MainChoosingRolePage extends StatefulWidget {
  const MainChoosingRolePage({super.key});

  @override
  State<MainChoosingRolePage> createState() => _MainChoosingRolePageState();
}

class _MainChoosingRolePageState extends State<MainChoosingRolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32.h),
          child: Column(
            children: [
              const MyBackButton(),
              SizedBox(
                height: 234.h,
              ),
              SizedBox(
                width: 1150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'I am a ... ',
                      size: 75.sp,
                    ),
                    SizedBox(
                      height: 135.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainSignUpPage1(),
                              ),
                            );
                            setState(() {
                              role = 'student';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 32.h, left: 32.h, right: 32.h),
                            height: 531.h,
                            width: 531.w,
                            decoration: BoxDecoration(
                                color: AppColors.cDCEDC1_100,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.c000000_25,
                                      offset: Offset(0.0, 4.0),
                                      blurRadius: 25,
                                      spreadRadius: 2)
                                ]),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: BigText(
                                      text: 'Student',
                                      size: 48.sp,
                                      color: AppColors.cFFFFFF_100,
                                    )),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Image.asset(
                                      'assets/images/student.png',
                                    ))
                              ],
                            ),
                          ),
                        ),
                      //   GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const MainSignUpPage1(),
                      //         ),
                      //       );
                      //       setState(() {
                      //         role = 'parent';
                      //       });
                      //     },
                      //     child: Container(
                      //       padding: EdgeInsets.only(
                      //           top: 32.h, left: 32.h, right: 32.h),
                      //       height: 531.h,
                      //       width: 531.w,
                      //       decoration: BoxDecoration(
                      //           color: AppColors.cA8E6CF_100,
                      //           borderRadius: BorderRadius.circular(30.r),
                      //           boxShadow: const [
                      //             BoxShadow(
                      //                 color: AppColors.c000000_25,
                      //                 offset: Offset(0.0, 4.0),
                      //                 blurRadius: 25,
                      //                 spreadRadius: 2)
                      //           ]),
                      //       child: Stack(
                      //         children: [
                      //           Align(
                      //               alignment: Alignment.topRight,
                      //               child: BigText(
                      //                 text: 'Parent',
                      //                 size: 48.sp,
                      //                 color: AppColors.cFFFFFF_100,
                      //               )),
                      //           Align(
                      //               alignment: Alignment.bottomLeft,
                      //               child: Image.asset(
                      //                 'assets/images/parent.png',
                      //               ))
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
