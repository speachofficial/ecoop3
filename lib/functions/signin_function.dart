import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/my_package.dart';
import '../widgets/smalltext.dart';

void signInFunction(context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUsername, password: signInPassword);
    userid = FirebaseAuth.instance.currentUser!.uid;
  } on FirebaseAuthException catch (e) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: SmallText(
                text: 'ERROR',
                size: 36.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.c000000_100,
                textAlign: TextAlign.center,
              ),
              content: SmallText(
                text: e.message.toString(),
                size: 35.sp,
                color: AppColors.c000000_100,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  child: SmallText(
                    text: 'Try Again',
                    size: 36.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.c0096FF_100,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
