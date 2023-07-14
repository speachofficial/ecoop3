import 'package:ecoop3/widgets/loadinghairil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/bigtext.dart';
import '../../../../../widgets/exit.dart';

class MainNotificationsPageContent extends StatefulWidget {
  const MainNotificationsPageContent({super.key});

  @override
  State<MainNotificationsPageContent> createState() =>
      _MainNotificationsPageContent();
}

class _MainNotificationsPageContent
    extends State<MainNotificationsPageContent> {
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
                  text: 'Notification',
                  size: 64.sp,
                  color: AppColors.c333333_100,
                )),
          ]),
          SizedBox(
            height: 120.h,
          ),
          LoadingHairil(),
          //   ListView.separated(
          //     itemCount: 50,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     separatorBuilder: (BuildContext context, int index) => Divider(
          //       height: 5.h,
          //       color: AppColors.c000000_30,
          //     ),
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: EdgeInsets.all(13.h),
          //         child: ListTile(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) =>
          //                         const MainPersonalNotificationsPage()));
          //           },
          //           leading: Transform.scale(
          //             3.h,
          //             child: CircleAvatar(
          //               radius: 56.r,
          //             ),
          //           ),
          //           title: SmallText(
          //             text: 'MUHAMMAD AIMAN',
          //             size: 64.sp,
          //             fontWeight: FontWeight.bold,
          //             color: AppColors.c000000_100,
          //           ),
          //           subtitle: SmallText(
          //             text:
          //                 'corem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate lacus.',
          //             size: 32.sp,
          //             color: AppColors.c000000_50,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
        ],
      ),
    );
  }
}
