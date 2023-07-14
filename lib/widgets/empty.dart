import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyHairil extends StatelessWidget {
  const EmptyHairil({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/empty.png',
        width: 625.h,
      ),
    );
  }
}
