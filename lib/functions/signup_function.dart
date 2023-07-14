import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/my_package.dart';

void signUpFunction() async {
  try {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => {
            if (role == 'student')
              {
                FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  'Name': fullname.toUpperCase(),
                  'IC Number': icnumber.trim(),
                  'Class': class_,
                  'Email': email,
                  'Password': password,
                  'role': role
                }),
              }
            else if (role == 'parent')
              {
                FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  'Name': fullname.toUpperCase(),
                  'IC Number': icnumber.trim(),
                  'Phone Number': phonenumber,
                  'Email': email,
                  'Password': password,
                  'role': role
                }),
              }
          },
        );
  } on FirebaseAuthException {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) => CupertinoAlertDialog(
    //           title: SmallText(
    //             text: 'ERROR',
    //             size: 36.sp,
    //             fontWeight: FontWeight.w600,
    //             color: AppColors.c000000_100,
    //             textAlign: TextAlign.center,
    //           ),
    //           content: SmallText(
    //             text: e.message.toString(),
    //             size: 28.sp,
    //             color: AppColors.c000000_100,
    //             fontWeight: FontWeight.normal,
    //             textAlign: TextAlign.center,
    //           ),
    //           actions: <CupertinoDialogAction>[
    //             CupertinoDialogAction(
    //               child: SmallText(
    //                 text: 'Try Again',
    //                 size: 36.sp,
    //                 fontWeight: FontWeight.w600,
    //                 color: AppColors.c0096FF_100,
    //               ),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: SmallText(
    //       text: 'Error',
    //       size: 36.sp,
    //       fontWeight: FontWeight.w600,
    //     ),
    //     content: SmallText(text: (e.toString()), size: 28.sp),
    //     actions: [
    //       CupertinoDialogAction(
    //         child: SmallText(
    //           text: 'Try Again',
    //           size: 36.sp,
    //           color: AppColors.c0096FF_100,
    //         ),
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //       )
    //     ],
    //   ),
    // );

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) => CupertinoAlertDialog(
    //           title: Text('ALERT'),
    //           content: Text(
    //             e.message.toString(),
    //             style: GoogleFonts.inter(fontSize: 20),
    //           ),
    //           actions: <CupertinoDialogAction>[
    //             CupertinoDialogAction(
    //               child: Text('ok'),
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //             )
    //           ],
    //         ));

    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: const Text("Test"),
    //   )
    // );
//
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Login Error'),
    //         content: Text("e.toString()"),
    //         actions: <Widget>[
    //           ElevatedButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //               },
    //               child: Text('OK'))
    //         ],
    //       );
    //     });
//
    // print(e.toString());
  }
}
