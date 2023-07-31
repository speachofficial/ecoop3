import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'registersellerinfo2.dart';

class MainSellerInformation2Page extends StatelessWidget {
  const MainSellerInformation2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bghomepage.png',
                fit: BoxFit.fill, width: 1620.w),
            const MainSellerInformation2PageContent()
          ],
        ),
      )),
    );
  }
}
