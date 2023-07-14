import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/notavailable.dart';

class MainBankAccountAndCardsPageContent extends StatefulWidget {
  const MainBankAccountAndCardsPageContent({super.key});

  @override
  State<MainBankAccountAndCardsPageContent> createState() =>
      _MainBankAccountAndCardsPageContentState();
}

class _MainBankAccountAndCardsPageContentState
    extends State<MainBankAccountAndCardsPageContent> {
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
                text: 'Bank Account / Cards',
                size: 64.sp,
                color: AppColors.c333333_100,
              ))
        ]),
      ),
      SizedBox(
        height: 150.h,
      ),
      const NotAvailableNotice()
    ]);
  }
}
