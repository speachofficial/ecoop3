import 'package:ecoop3/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  FontWeight fontWeight;
  TextAlign textAlign;
  BigText(
      {super.key,
      required this.text,
      this.color = AppColors.c333333_100,
      required this.size,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.fugazOne(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
