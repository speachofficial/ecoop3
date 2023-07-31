import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'addpromoboardadmin.dart';

class MainAddPromotionNotice extends StatelessWidget {
  const MainAddPromotionNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bghomepage.png',
                fit: BoxFit.fill, width: 1620.w),
            const MainAddPromotionNoticeContent()
          ],
        ),
      )),
    );
  }
}
