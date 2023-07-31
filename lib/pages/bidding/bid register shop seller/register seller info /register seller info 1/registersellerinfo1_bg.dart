import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'registersellerinfo1.dart';

class MainSellerInformation1Page extends StatelessWidget {
  const MainSellerInformation1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bghomepage.png',
                fit: BoxFit.fill, width: 1620.w),
            const MainSellerInformation1PageContent()
          ],
        ),
      )),
    );
  }
}
