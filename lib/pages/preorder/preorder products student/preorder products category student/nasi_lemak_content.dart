import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/foodcard.dart';
import '../../../../widgets/smalltext.dart';

class NasiLemakContent extends StatelessWidget {
  const NasiLemakContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fireplace_outlined,
                  size: 69.sp,
                  color: AppColors.cFFC700_100,
                ),
                SizedBox(
                  width: 22.w,
                ),
                SmallText(
                  text: 'Popular',
                  size: 75.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.c000000_100,
                )
              ],
            ),
            SizedBox(
              height: 23.h,
            ),
            SmallText(
              text: 'Most ordered right now',
              size: 48.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.c333333_75,
            )
          ],
        ),
        SizedBox(
          height: 60.h,
        ),
        // Container(
        //   height: 500,
        //   width: 5000,
        //   child: GridView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2),
        //       itemCount: 3,
        //       itemBuilder: (_, i) {
        //         return FoodCard();
        //       }),
        // ),
        Align(
          alignment: Alignment.topCenter,
          child: Wrap(spacing: 90.h, runSpacing: 90.h, children: const [
            FoodCard(),
            FoodCard(),
            FoodCard(),
          ]),
        ),
      ],
    );
  }
}
