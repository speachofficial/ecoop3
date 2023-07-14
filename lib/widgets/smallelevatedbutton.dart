// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecoop3/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'smalltext.dart';

// ignore: must_be_immutable
class MySmallElevatedButton extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color color;
  var onPressed;
  var fontWeight;
  MySmallElevatedButton({
    super.key,
    required this.text,
    this.textcolor = AppColors.cFFFFFF_100,
    required this.onPressed,
    this.color = AppColors.cEA2127_100,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 400.w,
        height: 100.h,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                backgroundColor: color),
            child: SmallText(
              text: text,
              size: 32.sp,
              fontWeight: fontWeight,
              color: textcolor,
            )),
      ),
    );
  }
}
