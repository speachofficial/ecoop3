import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appbar.dart';
import 'home_content.dart';
import 'home_hero.dart';

class MainHomePageContent extends StatefulWidget {
  const MainHomePageContent({super.key});

  @override
  State<MainHomePageContent> createState() => _MainHomePageContentState();
}

class _MainHomePageContentState extends State<MainHomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 258.h,
        //   child: Stack(
        //     children: [
        //       Image.asset('assets/images/bgappbar.png',
        //           fit: BoxFit.fill, width: 1620.w),
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             height: 104.h,
        //             child: Image.asset('assets/images/ecoopmart.png',
        //                 fit: BoxFit.cover)
        //           ),
        //           sized
        //         ],
        //       )
        //     ],
        //   ),
        // )
        const HomePageAppBar(),
        // Image.asset('assets/gif/loading.gif', height: 200, width: 200,),
        // Lottie.asset('assets/gif/loadingtr.json', height: 200, width:200),
        // Container(
        //   width: 200,
        //   height: 200,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
        //       image: const DecorationImage(
        //           image: AssetImage('assets/images/nasilemak.png'),
        //           fit: BoxFit.cover)),
        // ),
        SizedBox(
          height: 55.h,
        ),
        const HomePagePromotionContent(),
        SizedBox(
          height: 60.h,
        ),
        const HomePageContent(),
      ],
    );
  }
}
