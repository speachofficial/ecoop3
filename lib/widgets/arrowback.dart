import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class MyBackButton extends StatelessWidget {
  final Color color;
  const MyBackButton({super.key, this.color = AppColors.cC8151D_100});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, size: 133.sp, color: color),
      ),
    );
  }
}
