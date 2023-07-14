import 'package:ecoop3/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

void areyousure(BuildContext context, {required onPressedYes}) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            title: SmallText(
                text: 'Are you sure?',
                color: AppColors.cC8151D_100,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                size: 64.sp),
            content: Row(
              children: [
                SizedBox(
                  height: 115.h,
                  width: 270.w,
                  child: ElevatedButton(
                      onPressed: onPressedYes,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          backgroundColor: AppColors.cEA2127_100),
                      child: SmallText(
                        text: 'Yes',
                        size: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cFFFFFF_100,
                      )),
                ),
                SizedBox(
                  width: 30.w,
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
}
