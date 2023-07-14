import 'package:ecoop3/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../widgets/smalltext.dart';

class MainProductPageContent extends StatefulWidget {
  const MainProductPageContent({super.key});

  @override
  State<MainProductPageContent> createState() => _MainProductPageContentState();
}

class _MainProductPageContentState extends State<MainProductPageContent> {
  bool fav = false;
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
            const MyBackButton(),
            Align(
              alignment: Alignment.center,
              child: BigText(
                text: 'Live Auction',
                size: 64.sp,
                color: AppColors.c333333_100,
              ),
            )
          ]),
          SizedBox(
            height: 62.h,
          ),
          Container(
            width: 1373.w,
            height: 772.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.c000000_25,
                  spreadRadius: 2,
                  blurRadius: 25,
                  offset: Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/nasilemak.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 85.h,
          ),
          SizedBox(
            width: 1373.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: 'Laptop Asus', size: 75.sp),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          fav = !fav;
                        });
                      },
                      child: fav
                          ? Icon(
                              Icons.favorite,
                              color: AppColors.cC8151D_100,
                              size: 107.sp,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 107.sp,
                            ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(
                            text: 'Seller',
                            size: 40.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 71.w,
                              ),
                              SizedBox(
                                width: 22.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text: 'MUHAMMAD AIMAN',
                                    size: 36.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.c000000_100,
                                  ),
                                  SmallText(
                                    text: '012******',
                                    size: 36.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.c000000_50,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(
                            text: 'Ending in :',
                            size: 40.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          SmallText(
                            text: '24 : 00 : 20',
                            size: 48.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.c000000_100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 57.h,
                ),
                Container(
                  padding: EdgeInsets.all(32.h),
                  height: 156.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppColors.cCCD9FF_100,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          showBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        AppColors.c0079F0_100,
                                        AppColors.c00DBCE_100
                                      ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.center)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 964,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 100.h,
                                            left: 100.h,
                                            right: 100.h,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  const Align(
                                                    child: MyBackButton(
                                                      color:
                                                          AppColors.cFFFFFF_100,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: BigText(
                                                      text: 'Ranking',
                                                      size: 64.sp,
                                                      color:
                                                          AppColors.cFFFFFF_100,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 219.w,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 90.h,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      16.h),
                                                          child: BigText(
                                                            text: 'RM 5',
                                                            size: 42.sp,
                                                            color: AppColors
                                                                .cFFFFFF_100,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 300.w,
                                                          height: 250.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(15
                                                                              .r)),
                                                              color: AppColors
                                                                  .c97E4EE_100),
                                                          child: Center(
                                                            child: Text(
                                                              '2',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      128.sp,
                                                                  color: AppColors
                                                                      .cFFFFFF_100,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 90.h,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      16.h),
                                                          child: BigText(
                                                            text: 'RM 500',
                                                            size: 42.sp,
                                                            color: AppColors
                                                                .cFFFFFF_100,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 300.w,
                                                          // height:
                                                          //     3.h56,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(15
                                                                              .r)),
                                                              color: AppColors
                                                                  .cFF856F_100),
                                                          child: Center(
                                                            child: Text(
                                                              '1',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      128.sp,
                                                                  color: AppColors
                                                                      .cFFFFFF_100,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 90.h,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      16.h),
                                                          child: BigText(
                                                            text: 'RM 1',
                                                            size: 42.sp,
                                                            color: AppColors
                                                                .cFFFFFF_100,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 300.w,
                                                          height: 200.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(15
                                                                              .r)),
                                                              color: AppColors
                                                                  .cB3D3FF_100),
                                                          child: Center(
                                                            child: Text(
                                                              '3',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      128.sp,
                                                                  color: AppColors
                                                                      .cFFFFFF_100,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1196,
                                          child: Container(
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: AppColors.cFFFFFF_100,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(50.r),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 50.h,
                                                ),
                                                Container(
                                                  height: 1.h,
                                                  width: 145.w,
                                                  color: AppColors.c333333_25,
                                                ),
                                                SizedBox(
                                                  height: 78.h,
                                                ),
                                                ListView.builder(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 100.w),
                                                    itemCount: 4,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    100.w,
                                                                vertical: 25.h),
                                                        child: ListTile(
                                                          leading: SmallText(
                                                            text: (index + 4)
                                                                .toString(),
                                                            size: 64.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          title: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 65.h,
                                                              ),
                                                              SizedBox(
                                                                width: 39.w,
                                                              ),
                                                              SmallText(
                                                                text: 'MUH****',
                                                                size: 57.sp,
                                                                color: AppColors
                                                                    .c000000_100,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )
                                                            ],
                                                          ),
                                                          trailing: SmallText(
                                                            text: 'RM5000000',
                                                            size: 48.sp,
                                                            color: AppColors
                                                                .c333333_50,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                SizedBox(
                                                  height: 78.h,
                                                ),
                                                MyElevatedButton(
                                                    color:
                                                        AppColors.c003FFF_100,
                                                    text: 'Place Bid',
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.bar_chart_outlined,
                              size: 89.sp,
                              color: AppColors.c003FFF_100,
                            ),
                            SizedBox(
                              width: 22.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Highest Bid',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.c003FFF_100,
                                          fontSize: 32.sp)),
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.c003FFF_100,
                                    size: 28.sp,
                                  ))
                                ])),
                                SmallText(
                                  text: 'RM 200',
                                  size: 36.sp,
                                  color: AppColors.c000000_100,
                                  fontWeight: FontWeight.w600,
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: Align(
                        child: SizedBox(
                            height: 156.h,
                            width: 450.w,
                            child: ElevatedButton(
                              onPressed: () {
                                //you won the bid
                                // showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return CupertinoAlertDialog(
                                //         content: Column(
                                //           children: [
                                //             Icon(
                                //               Icons.done,
                                //               size: 100.sp,
                                //               color: AppColors.c000000_100,
                                //             ),
                                //             SmallText(
                                //               text: 'You won the bid!',
                                //               size: 48.sp,
                                //               fontWeight: FontWeight.w600,
                                //               color: AppColors.c000000_100,
                                //             )
                                //           ],
                                //         ),
                                //       );
                                //     });

                                //place bid ver 1
                                // showModalBottomSheet<dynamic>(
                                //     backgroundColor: Colors.transparent,
                                //     isScrollControlled: true,
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return Container(
                                //         width: 1320.w,
                                //         height: 1845.h,
                                //         decoration: BoxDecoration(
                                //             color: AppColors.cFFFFFF_100,
                                //             borderRadius: BorderRadius.circular(
                                //                 50.r)),
                                //         child: Column(
                                //           children: [
                                //             Padding(
                                //               padding: EdgeInsets.all(
                                //                   32.h),
                                //               child: Stack(children: [
                                //                 const MyExitButton(),
                                //                 Align(
                                //                   alignment: Alignment.center,
                                //                   child: BigText(
                                //                     text: 'Laptop Asus',
                                //                     size: 64.sp,
                                //                     color:
                                //                         AppColors.c333333_100,
                                //                   ),
                                //                 )
                                //               ]),
                                //             ),
                                //             Padding(
                                //               padding: EdgeInsets.symmetric(
                                //                   horizontal:
                                //                       187.w),
                                //               child: Column(
                                //                 children: [
                                //                   Row(
                                //                     children: [
                                //                       Expanded(
                                //                           child: Column(
                                //                         mainAxisAlignment:
                                //                             MainAxisAlignment
                                //                                 .center,
                                //                         children: [
                                //                           SmallText(
                                //                             text: 'RM300.00',
                                //                             size: Dimentions
                                //                                 64.sp,
                                //                             color: AppColors
                                //                                 .c000000_100,
                                //                           ),
                                //                           SmallText(
                                //                             text: 'Highest Bid',
                                //                             size: Dimentions
                                //                                 48.sp,
                                //                             color: AppColors
                                //                                 .c000000_100,
                                //                           ),
                                //                         ],
                                //                       )),
                                //                       Expanded(
                                //                           child: Column(
                                //                         mainAxisAlignment:
                                //                             MainAxisAlignment
                                //                                 .center,
                                //                         children: [
                                //                           SmallText(
                                //                             text: 'RM130.00',
                                //                             size: Dimentions
                                //                                 64.sp,
                                //                             color: AppColors
                                //                                 .c000000_100,
                                //                           ),
                                //                           SmallText(
                                //                             text:
                                //                                 'Starting Price',
                                //                             size: Dimentions
                                //                                 48.sp,
                                //                             color: AppColors
                                //                                 .c000000_100,
                                //                           ),
                                //                         ],
                                //                       )),
                                //                     ],
                                //                   ),
                                //                   SizedBox(
                                //                     height:
                                //                         98.h,
                                //                   ),
                                //                   SizedBox(
                                //                     height:
                                //                         143.h,
                                //                     width:
                                //                         920.w,
                                //                     child: CupertinoTheme(
                                //                       data: CupertinoThemeData(
                                //                           textTheme: CupertinoTextThemeData(
                                //                               dateTimePickerTextStyle: GoogleFonts.inter(
                                //                                   height:
                                //                                       Dimentions
                                //                                           2.h,
                                //                                   fontSize:
                                //                                       Dimentions
                                //                                           .font22_4,
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w600))),
                                //                       child:
                                //                           CupertinoDatePicker(
                                //                               mode: CupertinoDatePickerMode
                                //                                   .dateAndTime,
                                //                               minimumDate:
                                //                                   minDate,
                                //                               maximumDate:
                                //                                   maxDate,
                                //                               initialDateTime:
                                //                                   pickuptime,
                                //                               onDateTimeChanged:
                                //                                   (DateTime
                                //                                       newTime) {
                                //                                 setState(() {
                                //                                   newtime =
                                //                                       newTime;
                                //                                 });
                                //                               }),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //             const Spacer(),
                                //             Align(
                                //               alignment: Alignment.bottomCenter,
                                //               child: Container(
                                //                 height: 750.h,
                                //                 width: double.maxFinite,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             Dimentions
                                //                                 50.r),
                                //                     image: const DecorationImage(
                                //                         image: AssetImage(
                                //                             'assets/images/nasilemak.png'),
                                //                         fit: BoxFit.cover)),
                                //                 child: Align(
                                //                     alignment:
                                //                         Alignment.bottomCenter,
                                //                     child: Padding(
                                //                       padding: EdgeInsets.all(
                                //                           50.h),
                                //                       child: MyElevatedButton(
                                //                           text: 'Bid',
                                //                           onPressed: () {}),
                                //                     )),
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //       );
                                //     });

                                //place bid ver 2
                                // showModalBottomSheet<dynamic>(
                                //     backgroundColor: Colors.transparent,
                                //     isScrollControlled: true,
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return Container(
                                //         height: 1129.h,
                                //         width: 1620.w,
                                //         decoration: BoxDecoration(
                                //             color: AppColors.cFFFFFF_100,
                                //             borderRadius: BorderRadius.vertical(
                                //                 top: Radius.circular(
                                //                     50.r))),
                                //         child: Column(
                                //           children: [
                                //             SizedBox(
                                //               height: 50.h,
                                //             ),
                                //             Container(
                                //               height: 1.h,
                                //               width: 145.w,
                                //               color: AppColors.c333333_25,
                                //             ),
                                //             SizedBox(
                                //               height: 133.h,
                                //             ),
                                //             SmallText(
                                //               text: 'Place bid',
                                //               size: 48.sp,
                                //               fontWeight: FontWeight.w600,
                                //               color: AppColors.c003FFF_100,
                                //             ),
                                //             SizedBox(
                                //               height: 33.h,
                                //             ),
                                //             Container(
                                //               height: 1.h,
                                //               width: 200.w,
                                //               decoration: BoxDecoration(
                                //                   color: AppColors.c003FFF_100,
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           20.r)),
                                //             ),
                                //             SizedBox(
                                //               height: 156.h,
                                //             ),
                                //             SizedBox(
                                //               height: 171.h,
                                //               width: 920.w,
                                //               child: CupertinoTheme(
                                //                 data: CupertinoThemeData(
                                //                     textTheme: CupertinoTextThemeData(
                                //                         dateTimePickerTextStyle:
                                //                             GoogleFonts.inter(
                                //                                 height:
                                //                                     Dimentions
                                //                                         2.h,
                                //                                 fontSize:
                                //                                     Dimentions
                                //                                         .font19_2,
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w600))),
                                //                 child: Transform.scale(
                                //                     scale: 1.5,
                                //                     child: CupertinoPicker(
                                //                         itemExtent:
                                //                             50.h,
                                //                         onSelectedItemChanged:
                                //                             (int index) {},
                                //                         children: const [])),
                                //               ),
                                //             ),
                                //             SizedBox(
                                //               height: 156.h,
                                //             ),
                                //             MyElevatedButton(
                                //                 color: AppColors.c003FFF_100,
                                //                 text: 'Bid',
                                //                 onPressed: () {
                                //                   Navigator.pop(context);
                                //                 })
                                //           ],
                                //         ),
                                //       );
                                //     });

                                // contact info
                                // showModalBottomSheet<dynamic>(
                                //     backgroundColor: Colors.transparent,
                                //     isScrollControlled: true,
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return Container(
                                //         height: 1129.h,
                                //         width: 1620.w,
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 200.w),
                                //         decoration: BoxDecoration(
                                //             color: AppColors.cFFFFFF_100,
                                //             borderRadius: BorderRadius.vertical(
                                //                 top: Radius.circular(
                                //                     50.r))),
                                //         child: Column(
                                //           children: [
                                //             SizedBox(
                                //               height: 50.h,
                                //             ),
                                //             Container(
                                //               height: 1.h,
                                //               width: 145.w,
                                //               color: AppColors.c333333_25,
                                //             ),
                                //             SizedBox(
                                //               height: 133.h,
                                //             ),
                                //             SmallText(
                                //               text: 'Contact Info',
                                //               size: 48.sp,
                                //               fontWeight: FontWeight.w600,
                                //               color: AppColors.cC8151D_100,
                                //             ),
                                //             SizedBox(
                                //               height: 33.h,
                                //             ),
                                //             Container(
                                //               height: 1.h,
                                //               width: 200.w,
                                //               decoration: BoxDecoration(
                                //                   color: AppColors.cC8151D_100,
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           20.r)),
                                //             ),
                                //             SizedBox(
                                //               height: 90.h,
                                //             ),
                                //             Align(
                                //               alignment: Alignment.centerLeft,
                                //               child: SmallText(
                                //                 text:
                                //                     'Please contact this number :',
                                //                 size: 36.sp,
                                //                 fontWeight: FontWeight.bold,
                                //               ),
                                //             ),
                                //             SizedBox(
                                //               height: 50.h,
                                //             ),
                                //             Align(
                                //                 alignment: Alignment.centerLeft,
                                //                 child: Row(
                                //                   children: [
                                //                     CircleAvatar(
                                //                       radius:
                                //                           71.w,
                                //                     ),
                                //                     SizedBox(
                                //                       width:
                                //                           22.w,
                                //                     ),
                                //                     Column(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment
                                //                               .start,
                                //                       children: [
                                //                         SmallText(
                                //                           text:
                                //                               'MUHAMMAD AIMAN',
                                //                           size: Dimentions
                                //                               48.sp,
                                //                           fontWeight:
                                //                               FontWeight.bold,
                                //                           color: AppColors
                                //                               .c000000_100,
                                //                         ),
                                //                         SmallText(
                                //                           text: '01234567890',
                                //                           size: Dimentions
                                //                               57.sp,
                                //                           fontWeight:
                                //                               FontWeight.bold,
                                //                           color: AppColors
                                //                               .cC8151D_100,
                                //                         ),
                                //                       ],
                                //                     )
                                //                   ],
                                //                 )),
                                //           ],
                                //         ),
                                //       );
                                //     });
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r)),
                                  backgroundColor: AppColors.c003FFF_100),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Place a Bid  ',
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.cFFFFFF_100,
                                        fontSize: 36.sp)),
                                const WidgetSpan(
                                    child: Icon(
                                  Icons.gavel,
                                  color: AppColors.cFFFFFF_100,
                                ))
                              ])),
                            )),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: 'Description',
                      size: 40.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    SmallText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet quam facilisis mi consectetur lobortis vel facilisis mi. Proin tellus elit, tincidunt sit amet placerat vel, tincidunt et ante. Phasellus non interdum orci. Suspendisse congue lacus sollicitudin auctor aliquet. Donec eget nulla id massa ullamcorper mattis... read more',
                      size: 32.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
