import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/arrowback.dart';
import '../../../../widgets/bigtext.dart';
import '../../../../widgets/elevatedbutton.dart';
import '../../../../widgets/smalltext.dart';

class MainShopInformationPageContent extends StatefulWidget {
  const MainShopInformationPageContent({super.key});

  @override
  State<MainShopInformationPageContent> createState() =>
      _MainShopInformationPageContentState();
}

class _MainShopInformationPageContentState
    extends State<MainShopInformationPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 50.h,
          ),
          child: Stack(children: [
            const MyBackButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Shop Information',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(50.h),
          child: Row(
            children: [
              Expanded(
                flex: 680,
                child: Column(
                  children: [
                    Container(
                      height: 500.h,
                      width: 500.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: DottedBorder(
                        color: AppColors.cC8151D_100,
                        strokeWidth: 5.h,
                        radius: Radius.circular(30.r),
                        dashPattern: const [15, 10],
                        child: Center(
                          child: SmallText(
                            text: '+ Add Photo',
                            size: 48.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cC8151D_100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 940,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(32.h),
                      child: SmallText(
                        text: 'Store Name',
                        size: 50.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 180.h,
                      width: double.maxFinite,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.h, vertical: 50.h),
                        child: TextFormField(
                          controller: TextEditingController(),
                          style: GoogleFonts.inter(
                              fontSize: 57.sp,
                              color: AppColors.c333333_100,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: 'Store Name',
                            hintStyle: GoogleFonts.inter(
                                fontSize: 57.sp,
                                color: AppColors.c333333_30,
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Padding(
          padding: EdgeInsets.all(50.h),
          child: SmallText(
            text: 'Shop Description',
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
                hintText: 'Shop Description',
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
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                            title: SmallText(
                              text: 'SUCCESSFULL!',
                              size: 48.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c000000_100,
                              textAlign: TextAlign.center,
                            ),
                            content: SmallText(
                              text:
                                  'Your shop has been send to admin to be verified',
                              size: 40.sp,
                              color: AppColors.c000000_100,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.center,
                            ),
                          ));
                }))
      ],
    );
  }
}
