import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'bigtext.dart';

class NotAvailableNotice extends StatelessWidget {
  const NotAvailableNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        height: 350.h,
        width: 975.w,
        decoration: BoxDecoration(
            border: Border.all(
              width: 3.h,
              color: AppColors.cC8151D_100,
            ),
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.cFFFFFF_100),
        child: BigText(
          text: 'This function is not available yet',
          size: 64.sp,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
