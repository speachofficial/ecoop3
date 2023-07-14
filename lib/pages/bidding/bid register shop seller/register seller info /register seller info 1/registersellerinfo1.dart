import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/elevatedbutton.dart';
import '../../../../../widgets/smalltext.dart';
import '../register seller info 2/registersellerinfo2_bg.dart';

class MainSellerInformation1PageContent extends StatefulWidget {
  const MainSellerInformation1PageContent({super.key});

  @override
  State<MainSellerInformation1PageContent> createState() =>
      _MainSellerInformation1PageContent();
}

class _MainSellerInformation1PageContent
    extends State<MainSellerInformation1PageContent> {
  int _value = 0;
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
          text: 'Seller Type',
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
              color: Color.fromARGB(29, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                leading: Transform.scale(
                    scale: 2.h,
                    child: Radio(
                        value: 0,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        activeColor: AppColors.cC8151D_100)),
                title: SmallText(
                  text: 'Used Item Reseller',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                leading: Transform.scale(
                    scale: 2.h,
                    child: Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                        activeColor: AppColors.cC8151D_100)),
                title: SmallText(
                  text: 'Supplier',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 32.h,
      ),
      Padding(
        padding: EdgeInsets.all(50.h),
        child: SmallText(
          text: 'Full Name',
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
              hintText: 'Full Name',
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
          text: 'IC Number/Passport Number',
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
              hintText: 'IC Number/Passport Number',
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
              text: 'Next',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainSellerInformation2Page(),
                  ),
                );
              }))
    ]);
  }
}
