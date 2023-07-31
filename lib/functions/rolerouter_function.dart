import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoop3/functions/navbar.dart';
import 'package:flutter/material.dart';

import '../pages/sign in/sign in /signin_bg.dart';
import '../utils/my_package.dart';

void rolerouter(BuildContext context) async {
  FirebaseFirestore.instance
      .collection('Users')
      .doc(userid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    // if (documentSnapshot.get('role') == "admin") {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const MainPage(),
    //     ),
    //   );
    // } else if (documentSnapshot.get('role') == "student") {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const MainPage(),
    //     ),
    //   );
    // } else if (documentSnapshot.get('role') == "parent") {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const MainPage(),
    //     ),
    //   );
    // }
    if (documentSnapshot.get('role') != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainSignInPage(),
        ),
      );
    }
  });
}
