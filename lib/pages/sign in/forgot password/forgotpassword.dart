import 'package:ecoop3/functions/resetpass_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/arrowback.dart';
import '../../../widgets/bigtext.dart';
import '../../../utils/my_package.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/textformfield.dart';

class MainForgotPasswordPage extends StatefulWidget {
  const MainForgotPasswordPage({super.key});

  @override
  State<MainForgotPasswordPage> createState() => _MainForgotPasswordPageState();
}

class _MainForgotPasswordPageState extends State<MainForgotPasswordPage> {
  final forgotpasswordkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32.h),
          child: Column(
            children: [
              const MyBackButton(),
              SizedBox(
                height: 234.h,
              ),
              SizedBox(
                width: 920.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Please verify your',
                      size: 75.sp,
                      textAlign: TextAlign.start,
                    ),
                    BigText(
                      text: 'E-mail',
                      size: 75.sp,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 135.h,
                    ),
                    Form(
                        key: forgotpasswordkey,
                        child: Column(
                          children: [
                            MyTextFormField(
                              text: 'Your Email',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (!RegExp(
                                        r'^[A-Za-z0-9]+[-.]?[A-Za-z0-9]+@[a-z]+[-.]?[a-z]+(\.edu){0,2}(\.com|\.my)$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid format: xxxxx123@xxxx.com';
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                resetemail1 = value;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            MyTextFormField(
                              text: 'Confirm Email',
                              onChanged: (value) {
                                resetemail2 = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (resetemail2 != resetemail1) {
                                  return 'Please enter the same email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 49.h,
                    ),
                    MyElevatedButton(
                        text: 'Confirm',
                        onPressed: () async {
                          if (forgotpasswordkey.currentState!.validate()) {
                            resetPasswordFunction(context);
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
