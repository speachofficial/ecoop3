// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class LoadingHairil extends StatelessWidget {
  var height;
  var width;
  LoadingHairil({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/gif/loading.gif',
      height: null,
      width: null,
    );
  }
}
