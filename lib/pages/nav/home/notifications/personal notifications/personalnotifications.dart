import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../../widgets/arrowback.dart';
import '../../../../../widgets/smalltext.dart';

class MainPersonalNotificationsPageContent extends StatefulWidget {
  const MainPersonalNotificationsPageContent({super.key});

  @override
  State<MainPersonalNotificationsPageContent> createState() =>
      _MainPersonalNotificationsPageContent();
}

class _MainPersonalNotificationsPageContent
    extends State<MainPersonalNotificationsPageContent> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 28, child: MyBackButton()),
              Expanded(
                flex: 247,
                child: ListTile(
                  leading: Transform.scale(
                    scale: 3.h,
                    child: CircleAvatar(
                      radius: 68.h,
                    ),
                  ),
                  title: SmallText(
                    text: 'MUHAMMAD AIMAN',
                    size: 48.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.c333333_100,
                  ),
                ),
              ),
              Expanded(
                flex: 28,
                child: Icon(Icons.more_horiz_outlined,
                    size: 133.sp, color: AppColors.cC8151D_100),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1373.w),
                    child: Container(
                      margin: EdgeInsets.all(32.h),
                      padding: EdgeInsets.all(47.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55.r),
                          color: AppColors.cF2F2F2_100),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SmallText(
                          text:
                              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Amet purus gravida quis blandit turpis cursus in hac habitasse. Curabitur vitae nunc sed velit dignissim. Leo vel fringilla est ullamcorper eget nulla facilisi etiam. Nisl condimentum id venenatis a condimentum vitae sapien pellentesque habitant. Tincidunt vitae semper quis lectus. Est lorem ipsum dolor sit amet consectetur adipiscing elit pellentesque. Ultricies mi eget mauris pharetra et ultrices. Vitae purus faucibus ornare suspendisse. Sit amet nisl purus in mollis nunc sed. Tristique senectus et netus et malesuada fames ac turpis. Leo duis ut diam quam nulla porttitor massa id neque. Condimentum id venenatis a condimentum vitae sapien pellentesque habitant morbi. Id semper risus in hendrerit gravida rutrum. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Quis blandit turpis cursus in hac habitasse platea. Amet est placerat in egestas erat. Volutpat maecenas volutpat blandit aliquam etiam.,
                              Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis. Velit euismod in pellentesque massa. Non tellus orci ac auctor augue mauris. Ipsum dolor sit amet consectetur adipiscing. Pellentesque diam volutpat commodo sed egestas egestas. Nisl nunc mi ipsum faucibus. Condimentum mattis pellentesque id nibh tortor id. Imperdiet dui accumsan sit amet. Cursus in hac habitasse platea dictumst quisque sagittis purus sit. Adipiscing diam donec adipiscing tristique risus nec feugiat in fermentum. Non blandit massa enim nec dui nunc. Adipiscing at in tellus integer feugiat scelerisque varius morbi. Non enim praesent elementum facilisis leo vel. In dictum non consectetur a erat nam at lectus urna. Mattis molestie a iaculis at erat. Et pharetra pharetra massa massa ultricies mi. Cursus sit amet dictum sit amet justo.
                              A condimentum vitae sapien pellentesque habitant. Aenean pharetra magna ac placerat vestibulum lectus mauris ultrices. Quam pellentesque nec nam aliquam sem et. Tellus mauris a diam maecenas sed enim ut sem. Ac tortor vitae purus faucibus ornare suspendisse. Vitae justo eget magna fermentum iaculi''',
                          size: 36.sp,
                          color: AppColors.c333333_100,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
