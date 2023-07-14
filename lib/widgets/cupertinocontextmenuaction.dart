// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:ecoop3/utils/colors.dart';
import 'package:ecoop3/widgets/smalltext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCupertinoContextMenuAction extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  FontWeight fontWeight;
  var onpressed;
  var trailingIcon;
  var iconsize;
  bool isDestructiveAction;
  MyCupertinoContextMenuAction(
      {super.key,
      required this.text,
      this.color = AppColors.c000000_100,
      required this.size,
      this.fontWeight = FontWeight.w500,
      required this.onpressed,
      this.trailingIcon,
      this.iconsize,
      this.isDestructiveAction = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenuAction(
      onPressed: onpressed,
      // trailingIcon: trailingIcon,
      isDestructiveAction: isDestructiveAction,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: text,
            size: size,
            color: color,
            fontWeight: fontWeight,
          ),
          Icon(
            trailingIcon,
            size: 47.sp,
            color: color,
          )
        ],
      ),
    );
  }
}
