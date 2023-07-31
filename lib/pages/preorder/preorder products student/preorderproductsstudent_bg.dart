import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'preorderproductsstudent.dart';

class MainFoodsPage extends StatefulWidget {
  const MainFoodsPage({super.key});

  @override
  State<MainFoodsPage> createState() => _MainFoodsPageState();
}

class _MainFoodsPageState extends State<MainFoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/bghomepage.png',
                fit: BoxFit.fill, width: 1620.w),
            const MainFoodsPageContent()
          ],
        ),
      )),
    );
  }
}
