import 'package:ecoop3/pages/bidding/bid%20register%20shop%20seller/register%20shop%20info%20sller/registershopinfoseller_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/elevatedbutton.dart';

class MainSetUpYourStorePageContent extends StatefulWidget {
  const MainSetUpYourStorePageContent({super.key});

  @override
  State<MainSetUpYourStorePageContent> createState() =>
      _MainSetUpYourStorePageContentState();
}

class _MainSetUpYourStorePageContentState
    extends State<MainSetUpYourStorePageContent> {
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
              const MyBackButton(),
              Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Set Up Your Store',
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
                      image: AssetImage('assets/images/setupstore.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 742.h,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: MyElevatedButton(
                    text: 'Start',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainShopInformationPage(),
                        ),
                      );
                    }))
          ],
        ));
  }
}
