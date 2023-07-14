import 'package:ecoop3/widgets/exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/bigtext.dart';

class MainHelpCentrePageContent extends StatelessWidget {
  const MainHelpCentrePageContent({super.key});

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
                  text: 'Help Centre',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
          SizedBox(
            height: 200.h,
          ),
          SizedBox(
            width: 920.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BigText(
                text: 'Please contact us in:',
                size: 75.sp,
                color: AppColors.c000000_100,
              ),
              SizedBox(
                height: 120.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                        flex: 130,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/telegram.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    Expanded(
                      flex: 925,
                      child: BigText(
                        text: '@nasrfiqq',
                        size: 75.sp,
                        color: AppColors.c003FFF_100,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
