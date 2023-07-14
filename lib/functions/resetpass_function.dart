import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/my_package.dart';
import '../widgets/smalltext.dart';

Future resetPasswordFunction(BuildContext context) async {
  await FirebaseAuth.instance
      .sendPasswordResetEmail(email: resetemail1.trim())
      .then((value) {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              content: SizedBox(
                width: 438.w,
                child: SmallText(
                    text:
                        'Check the link that we have sent in your e-mail to change your password',
                    color: AppColors.c000000_100,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    size: 48.sp),
              ),
            ));
  }).onError((e, stackTrace) => showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                content: SmallText(
                    text: e.toString(),
                    color: AppColors.c000000_100,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    size: 48.sp),
              )));
}
