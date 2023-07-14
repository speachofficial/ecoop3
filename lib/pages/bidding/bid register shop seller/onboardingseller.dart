import 'package:ecoop3/widgets/exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/elevatedbutton.dart';
import 'register seller info /register seller info 1/registersellerinfo1_bg.dart';

class MainStartSellingPageContent extends StatefulWidget {
  const MainStartSellingPageContent({super.key});

  @override
  State<MainStartSellingPageContent> createState() =>
      _MainStartSellingPageContentState();
}

class _MainStartSellingPageContentState
    extends State<MainStartSellingPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 50.h,
          right: 50.h,
        ),
        child: Column(
          children: [
            Stack(children: [
              const MyExitButton(),
              Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Start Selling',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ),
              )
            ]),
            SizedBox(
              height: 71.h,
            ),
            Container(
              width: 1320.w,
              height: 742.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.r),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/startselling.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 742.h,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: MyElevatedButton(
                    text: 'Start Registration',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MainSellerInformation1Page(),
                        ),
                      );
                    }))
          ],
        ));
  }
}
