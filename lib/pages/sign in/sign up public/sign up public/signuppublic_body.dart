import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../functions/signup_function.dart';
import '../../../../utils/my_package.dart';
import '../../../../widgets/elevatedbutton.dart';
import '../../../../widgets/textformfield.dart';

class SignUp1Body extends StatefulWidget {
  const SignUp1Body({super.key});

  @override
  State<SignUp1Body> createState() => _SignUp1BodyState();
}

class _SignUp1BodyState extends State<SignUp1Body> {
  final signupkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupkey,
      child: Column(
        children: [
          MyTextFormField(
            text: 'Full name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else if (!RegExp(r"^[A-Z\s‘\']+ BIN [A-Z\s‘\']+$")
                  .hasMatch(value)) {
                return 'Name must have BIN or BINTI and all capital letters';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              fullname = value;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          role == 'student'
              ? MyTextFormField(
                  text: 'Class',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else if (!RegExp(
                            r'^[1-5]\s(BESTARI|CITA|DINAMIK|JAYA|MAJU|USAHA)$')
                        .hasMatch(value)) {
                      return 'Please enter a valid format: 1 BESTARI';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    class_ = value;
                  },
                )
              : MyTextFormField(
                  text: 'Phone Number',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else if (!RegExp(r'^0\d{9,10}$').hasMatch(value)) {
                      return 'Please enter a valid format: 0123456789';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    phonenumber = value;
                  },
                ),
          SizedBox(
            height: 30.h,
          ),
          MyTextFormField(
            text: 'IC Number',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else if (!RegExp(r'^\d{12,}$').hasMatch(value)) {
                return 'Please enter a valid format: 01020304100123';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              icnumber = value;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextFormField(
            text: 'Email',
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
              email = value;
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextFormField(
            text: 'Password',
            obsecure: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$')
                  .hasMatch(value)) {
                return 'Password must have at least 1 number & capital letter';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 49.h,
          ),
          MyElevatedButton(
              text: 'Confirm',
              onPressed: () {
                if (signupkey.currentState!.validate()) {
                  signUpFunction();
                }
              })
        ],
      ),
    );
  }
}
