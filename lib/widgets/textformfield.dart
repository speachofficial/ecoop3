// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class MyTextFormField extends StatelessWidget {
  var text;
  var controller;
  bool obsecure;
  var prefixIcon;
  var suffixIcon;
  var validator;
  var onChanged;
  var keyboardType;
  var enabled;

  MyTextFormField(
      {super.key,
      required this.text,
      this.controller,
      this.onChanged,
      this.obsecure = false,
      this.prefixIcon,
      this.keyboardType,
      this.validator,
      this.enabled,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      enabled: enabled,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obsecure,
      style: GoogleFonts.inter(fontSize: 32.sp),
      decoration: InputDecoration(
          labelText: text,
          contentPadding:
              EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.h),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.c000000_30),
              borderRadius: BorderRadius.circular(15.r)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorStyle: GoogleFonts.inter(fontSize: 30.sp)),
    );
  }
}
