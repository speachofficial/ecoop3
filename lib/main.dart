import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'functions/rolerouter_function.dart';
import 'pages/sign in/sign in /signin_bg.dart';
import 'utils/my_package.dart';
import 'widgets/loadinghairil.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ScreenUtilInit(
  //       designSize: const Size(1620, 2160),
  //       minTextAdapt: true,
  //       splitScreenMode: true,
  //       builder: (BuildContext context, Widget? child) {
  //         return MaterialApp(
  //           home: child,
  //         );
  //       },
  //       child: const MaterialApp(home: MainAddYourProductPage()));
  // }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1620, 2160),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: child,
        );
      },
      child: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingHairil();
          }
          if (snapshot.hasData) {
            // userid = FirebaseAuth.instance.currentUser!.uid;
            FirebaseFirestore.instance
                .collection('Users')
                .doc(userid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              role = documentSnapshot.get('role');
              fullname = documentSnapshot.get('Name');
              role == 'student'
                  ? class_ = documentSnapshot.get('Class')
                  : phonenumber = documentSnapshot.get('Phone Number');
            });
            rolerouter(context);
          }
          return const MainSignInPage();
        },
      ),
    );
  }
}
