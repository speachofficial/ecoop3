// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:ecoop3/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  TextOverflow overFlow;
  FontWeight fontWeight;
  var textAlign;
  SmallText(
      {super.key,
      required this.text,
      this.color = AppColors.c333333_100,
      required this.size,
      this.overFlow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: text,
        style: GoogleFonts.inter(
            fontSize: size, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
