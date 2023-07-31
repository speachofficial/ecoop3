import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../functions/rolerouter_function.dart';
import '../../../functions/signin_function.dart';
import '../../../utils/colors.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/textformfield.dart';
import '../../../widgets/smalltext.dart';
import '../forgot password/forgotpassword.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 344.h),
      width: 920.w,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        MyTextFormField(
          text: 'IC number or email address',
          onChanged: (value) {
            signInUsername = value;
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        MyTextFormField(
          text: 'Password',
          onChanged: (value) {
            signInPassword = value;
          },
          obsecure: true,
        ),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainForgotPasswordPage(),
                  ),
                );
              },
              child: SmallText(
                text: 'Forgotten password?',
                size: 32.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.c3B8CF4_100,
              ),
            )),
        SizedBox(
          height: 47.h,
        ),
        MyElevatedButton(
            text: 'Sign In',
            onPressed: () {
              signInFunction(context);
              rolerouter(context);
            }),
      ]),
    );
  }
}
