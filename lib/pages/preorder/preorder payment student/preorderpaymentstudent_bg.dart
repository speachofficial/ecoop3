import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'preorderpaymentstudent.dart';

class MainPaymentPage extends StatefulWidget {
  const MainPaymentPage({super.key});

  @override
  State<MainPaymentPage> createState() => _MainPaymentPageState();
}

class _MainPaymentPageState extends State<MainPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset('assets/images/bghomepage.png',
              fit: BoxFit.cover, width: 1620.w),
          const MainPaymentPageContent()
        ],
      )),
    );
  }
}
