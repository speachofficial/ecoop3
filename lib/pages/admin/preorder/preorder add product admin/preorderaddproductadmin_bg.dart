import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'preorderaddproductadmin.dart';

class MainAddProductPage extends StatefulWidget {
  const MainAddProductPage({super.key});

  @override
  State<MainAddProductPage> createState() => _MainAddProductPageState();
}

class _MainAddProductPageState extends State<MainAddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bghomepage.png',
                fit: BoxFit.fill, width: 1620.w),
            const MainAddProductPageContent()
          ],
        ),
      )),
    );
  }
}
