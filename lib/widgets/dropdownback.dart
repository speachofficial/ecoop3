import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class MyDropDownBackButton extends StatelessWidget {
  const MyDropDownBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.keyboard_arrow_down,
            size: 133.sp, color: AppColors.cC8151D_100),
      ),
    );
  }
}
