import 'package:dotted_border/dotted_border.dart';
import 'package:ecoop3/pages/admin/promo/add%20promo%20board%20admin/addpromoboardadmin_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/dropdownback.dart';
import '../../../widgets/loadinghairil.dart';
import '../../../widgets/smalltext.dart';

class HomePagePromotionContent extends StatefulWidget {
  const HomePagePromotionContent({super.key});

  @override
  State<HomePagePromotionContent> createState() =>
      _HomePagePromotionContentState();
}

class _HomePagePromotionContentState extends State<HomePagePromotionContent> {
  final PageController _pageController = PageController(viewportFraction: 0.7);

  // double currentpage = 0;

  // @override
  // void initState() {
  //   _pageController = PageController(viewportFraction: 0.7);
  //   super.initState();
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 584.h + 78.h,
          child: StreamBuilder(
              stream: getPromotionNotice(),
              builder: (context, snapshot) {
                return PageView.builder(
                    controller: _pageController,
                    // onPageChanged: (int pageIndex) {
                    //   setState(() {
                    //     currentpage = pageIndex.toDouble();
                    //   });
                    // },
                    itemCount: role == 'admin'
                        ? (snapshot.data?.docs.length ?? 0) + 1
                        : (snapshot.data?.docs.length ?? 0),
                    itemBuilder: (context, index) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingHairil();
                      }
                      
                      if (role == 'admin' &&
                          index == (snapshot.data?.docs.length ?? 0)) {
                        return Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainAddPromotionNotice()));
                            },
                            child: DottedBorder(
                              color: AppColors.cC8151D_100,
                              strokeWidth: 5.h,
                              radius: Radius.circular(30.r),
                              dashPattern: const [15, 10],
                              child: Container(
                                height: 584.h,
                                width: 1038.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                  child: SmallText(
                                    text: '+ Promotion Notice',
                                    size: 48.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.cC8151D_100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              showBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      body: SafeArea(
                                          child: SingleChildScrollView(
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                                'assets/images/bghomepage.png',
                                                fit: BoxFit.fitWidth,
                                                width: 1620.w),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 32.h,
                                                    left: 100.h,
                                                    right: 100.h,
                                                  ),
                                                  child: Stack(children: [
                                                    const MyDropDownBackButton(),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: BigText(
                                                          text: snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  "promotion name"),
                                                          size: 64.sp,
                                                          color: AppColors
                                                              .c333333_100,
                                                        ))
                                                  ]),
                                                ),
                                                SizedBox(
                                                  height: 60.h,
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  height: 983.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.r),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: AppColors
                                                              .c000000_25,
                                                          offset:
                                                              Offset(0.0, 4.0),
                                                          blurRadius: 25,
                                                          spreadRadius: 1)
                                                    ],
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get("url")),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 120.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 175.w,
                                                    right: 175.w,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SmallText(
                                                                text:
                                                                    'Ends in :',
                                                                size: 57.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColors
                                                                    .c333333_100,
                                                              ),
                                                              SmallText(
                                                                text:
                                                                    '22:36:10',
                                                                size: 57.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .cC8151D_100,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 30.h,
                                                          ),
                                                          SmallText(
                                                            text: snapshot.data!
                                                                .docs[index]
                                                                .get(
                                                                    "description"),
                                                            size: 57.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .c333333_30,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                    );
                                  });
                            },
                            child: Container(
                              height: 584.h,
                              width: 584.h/9*16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data!.docs[index].get("url")),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.c000000_25,
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 5,
                                      spreadRadius: 1)
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }),
        ),
        // DotsIndicator(
        //   dotsCount: (snapshot.data?.docs.length ?? 0),
        //   position: currentpage,
        //   decorator: DotsDecorator(
        //     activeColor: AppColors.cC8151D_100,
        //     size: const Size.square(9.0),
        //     activeSize: const Size(18.0, 9.0),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0)),
        //   ),
        // )
      ],
    );
  }
}
