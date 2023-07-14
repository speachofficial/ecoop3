import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/smalltext.dart';

class MainLanguagePageContent extends StatefulWidget {
  const MainLanguagePageContent({super.key});

  @override
  State<MainLanguagePageContent> createState() =>
      _MainLanguagePageContentState();
}

class _MainLanguagePageContentState extends State<MainLanguagePageContent> {
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
                text: 'Language',
                size: 64.sp,
                color: AppColors.c333333_100,
              ))
        ]),
      ),
      SizedBox(
        height: 150.h,
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
              child: ListTile(
                title: SmallText(
                  text: 'Bahasa Melayu',
                  size: 57.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c333333_100,
                ),
                trailing: Transform.scale(
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
              ),
            ),
            Divider(
              height: 5.h,
              color: AppColors.c000000_45,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 50.h),
                child: ListTile(
                  title: SmallText(
                    text: 'English',
                    size: 57.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.c333333_100,
                  ),
                  trailing: Transform.scale(
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
                )),
          ],
        ),
      ),
    ]);
  }
}
