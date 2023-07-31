import 'package:ecoop3/pages/preorder/cart%20public/cartpublic_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/textformfield.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 258.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgappbar.png'),
              fit: BoxFit.fill)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 306,
            child: SizedBox(
                height: 104.h,
                child: Image.asset('assets/images/ecoopmart.png',
                    fit: BoxFit.fitHeight)),
          ),
          Expanded(
            flex: 900,
            child: SizedBox(
              height: 100.h,
              child: MyTextFormField(
                enabled: false,
                text: null,
                controller: TextEditingController(),
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.c000000_25,
                  size: 55.sp,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 306,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) =>
                //                 const MainNotificationsPage()));
                //   },
                //   child: Icon(
                //     Icons.notifications_outlined,
                //     size: 92.sp,
                //     color: AppColors.c000000_25,
                //   ),
                // ),
                role != 'admin'
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainCartPage()));
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 92.sp,
                          color: AppColors.c000000_25,
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
