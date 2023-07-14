import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/smalltext.dart';

class ParentCart extends StatelessWidget {
  const ParentCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 5.h,
          color: AppColors.c000000_50,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Row(
            children: [
              Expanded(
                flex: 239,
                child: Align(
                  child: Container(
                    height: 250.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            width: 3.h, color: AppColors.c000000_100),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/nasilemak.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Expanded(
                  flex: 881,
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(text: 'Laptop ASUS', size: 48.sp),
                        Row(
                          children: [
                            Icon(
                              Icons.bar_chart_outlined,
                              size: 63.sp,
                              color: AppColors.cC8151D_100,
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 8.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Highest Bid',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.cC8151D_100,
                                            fontSize: 32.sp)),
                                    WidgetSpan(
                                        child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 28.sp,
                                      color: AppColors.cC8151D_100,
                                    ))
                                  ])),
                                ),
                                SmallText(
                                  text: 'RM 200',
                                  size: 36.sp,
                                  color: AppColors.c000000_100,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 247,
                  child: SmallText(
                    text: 'RM 150.00',
                    size: 42.sp,
                    color: AppColors.c000000_100,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        );
      }),
    );
  }
}
