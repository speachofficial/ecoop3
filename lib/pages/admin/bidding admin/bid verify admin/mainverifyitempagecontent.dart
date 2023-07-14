import 'package:ecoop3/widgets/areyousure.dart';
import 'package:ecoop3/widgets/done.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/dropdownback.dart';
import '../../../../widgets/smalltext.dart';

class MainVerifyItemPageContent extends StatelessWidget {
  const MainVerifyItemPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.h,
            left: 100.h,
            right: 100.h,
          ),
          child: Stack(children: [
            const MyDropDownBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Verify Items',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
        ),
        SizedBox(
          height: 60.h,
        ),
        Container(
          width: double.maxFinite,
          height: 983.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: const [
                BoxShadow(
                    color: AppColors.c000000_25,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 25,
                    spreadRadius: 1)
              ],
              image: const DecorationImage(
                  image: AssetImage('assets/images/nasilemak.png'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 60.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 175.w,
            right: 175.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Laptop Asus', size: 64.sp),
                      BigText(
                        text: 'RM 200.00',
                        size: 75.sp,
                        color: AppColors.c003FFF_100,
                      ),
                    ],
                  )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SmallText(
                          text: 'Seller',
                          size: 40.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 45.w,
                              backgroundColor: AppColors.c000000_25,
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: 'MUHAMMAD AIMAN',
                                  size: 36.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.c000000_100,
                                ),
                                SmallText(
                                  text: '012******',
                                  size: 36.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000_50,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: 'Description',
                    size: 40.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_50,
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  SmallText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet quam facilisis mi consectetur lobortis vel facilisis mi. Proin tellus elit, tincidunt sit amet placerat vel, tincidunt et ante. Phasellus non interdum orci. Suspendisse congue lacus sollicitudin auctor aliquet. Donec eget nulla id massa ullamcorper mattis... read more',
                    size: 32.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 125.h,
                    width: 640.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            backgroundColor: AppColors.cEA2127_100),
                        child: SmallText(
                          text: 'Reject',
                          size: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cFFFFFF_100,
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
                            areyousure(context, onPressedYes: () {
                              done(context);
                            });
                            // Navigator.pop(context);
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
                            text: 'Approved',
                            size: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cC8151D_100,
                          ))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
