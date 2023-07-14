import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/my_package.dart';
import '../../../../../widgets/loadinghairil.dart';

class PromotionAdminNoticeContent extends StatelessWidget {
  const PromotionAdminNoticeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getPromotionNotice(),
        builder: (context, snapshot) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingHairil();
                }
                return Align(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 90.h),
                    height: 742.h,
                    width: 1320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image:
                            NetworkImage(snapshot.data!.docs[index].get("url")),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
