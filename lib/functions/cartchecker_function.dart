import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/preorder/checkout student/preordercheckoutstudent_bg.dart';
import '../utils/colors.dart';
import '../utils/my_package.dart';
import '../widgets/smalltext.dart';

void cartchecker(BuildContext context) {
  FirebaseFirestore.instance
      .collection('Users')
      .doc(userid)
      .collection('cart')
      .get()
      .then((QuerySnapshot snapshot) {
    if (snapshot.docs.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: SmallText(
              text: 'Your cart does not have any items.',
              size: 50.sp,
              color: AppColors.c000000_100,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainCheckoutPage(),
        ),
      );
    }
  });
}
