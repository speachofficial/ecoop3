import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class MyExitButton extends StatelessWidget {
  const MyExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.clear_rounded,
            size: 133.sp, color: AppColors.cC8151D_100),
      ),
    );
  }
}
