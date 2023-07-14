import 'package:ecoop3/widgets/smalltext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

void done(
  BuildContext context,
) {
  Navigator.pop(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              Icon(
                Icons.done,
                size: 100.sp,
                color: AppColors.cC8151D_100,
              ),
              SmallText(
                text: 'Done',
                size: 48.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.cC8151D_100,
              )
            ],
          ),
        );
      });
}
