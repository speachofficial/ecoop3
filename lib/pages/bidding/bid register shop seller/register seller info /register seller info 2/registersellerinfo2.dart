import 'package:ecoop3/pages/bidding/bid%20register%20shop%20seller/setup%20store%20seller/setupstoreseller_bg.dart';
import 'package:ecoop3/widgets/areyousure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/elevatedbutton.dart';
import '../../../../../widgets/smalltext.dart';

class MainSellerInformation2PageContent extends StatefulWidget {
  const MainSellerInformation2PageContent({super.key});

  @override
  State<MainSellerInformation2PageContent> createState() =>
      _MainSellerInformation2PageContent();
}

class _MainSellerInformation2PageContent
    extends State<MainSellerInformation2PageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(
          top: 32.h,
        ),
        child: Stack(children: [
          const MyBackButton(),
          Align(
              alignment: Alignment.center,
              child: BigText(
                text: 'Seller Information',
                size: 64.sp,
                color: AppColors.c333333_100,
              ))
        ]),
      ),
      SizedBox(
        height: 150.h,
      ),
      Padding(
        padding: EdgeInsets.all(50.h),
        child: SmallText(
          text: 'No. Phone',
          size: 50.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      Container(
        width: 1620.w,
        decoration: const BoxDecoration(
          color: AppColors.cFFFFFF_100,
          boxShadow: [
            BoxShadow(
              color: AppColors.c000000_25,
              spreadRadius: 2,
              blurRadius: 25,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
          child: TextFormField(
            controller: TextEditingController(),
            style: GoogleFonts.inter(
                fontSize: 57.sp,
                color: AppColors.c333333_100,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'No. Phone',
              hintStyle: GoogleFonts.inter(
                  fontSize: 57.sp,
                  color: AppColors.c333333_30,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 32.h,
      ),
      Padding(
        padding: EdgeInsets.all(50.h),
        child: SmallText(
          text: 'E-mail',
          size: 50.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      Container(
        width: 1620.w,
        decoration: const BoxDecoration(
          color: AppColors.cFFFFFF_100,
          boxShadow: [
            BoxShadow(
              color: AppColors.c000000_25,
              spreadRadius: 2,
              blurRadius: 25,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
          child: TextFormField(
            controller: TextEditingController(),
            style: GoogleFonts.inter(
                fontSize: 57.sp,
                color: AppColors.c333333_100,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'E-mail',
              hintStyle: GoogleFonts.inter(
                  fontSize: 57.sp,
                  color: AppColors.c333333_30,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 86.h,
      ),
      Align(
          alignment: Alignment.center,
          child: MyElevatedButton(
              text: 'Confirm',
              onPressed: () {
                areyousure(context, onPressedYes: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainSetUpYourStorePage(),
                    ),
                  );
                });
              }))
    ]);
  }
}
