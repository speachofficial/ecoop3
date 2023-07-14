import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/notavailable.dart';

class MainChatPage extends StatelessWidget {
  const MainChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset('assets/images/bghomepage.png',
              fit: BoxFit.cover, width: 1620.w),
          // const MainChatPageContent()
          const NotAvailableNotice()
        ],
      )),
    );
  }
}
