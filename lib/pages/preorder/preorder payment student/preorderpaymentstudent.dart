import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/exit.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/smalltext.dart';

class MainPaymentPageContent extends StatefulWidget {
  const MainPaymentPageContent({super.key});

  @override
  State<MainPaymentPageContent> createState() => _MainPaymentPageContentState();
}

class _MainPaymentPageContentState extends State<MainPaymentPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 118.w, right: 118.w),
      child: Column(
        children: [
          Stack(children: [
            const MyExitButton(),
            Align(
                alignment: Alignment.center,
                child: BigText(
                  text: 'Select a payment method',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                ))
          ]),
          SizedBox(
            height: 253.h,
          ),
          SizedBox(
            width: 1130.w,
            child: ListTile(
              leading: Icon(
                Icons.wallet_rounded,
                size: 75.sp,
                color: AppColors.c000000_100,
              ),
              title: SmallText(
                text: 'Cash',
                size: 48.sp,
                color: AppColors.c333333_100,
                fontWeight: FontWeight.bold,
              ),
              trailing: Transform.scale(
                  scale: 2.h,
                  child: Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (v) {},
                      activeColor: AppColors.cC8151D_100)),
            ),
          ),
          // Container(
          //   width: double.maxFinite,
          //   margin: EdgeInsets.symmetric(horizontal: 152.w),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SmallText(
          //         text: 'Cash',
          //         size: 48.sp,
          //         color: AppColors.c333333_100,
          //         fontWeight: FontWeight.bold,
          //       )
          //     ],
          //   ),
          // )
          SizedBox(
            height: 1318.h,
          ),
          MyElevatedButton(text: 'Confirm', onPressed: () {})
        ],
      ),
    );
  }
}
