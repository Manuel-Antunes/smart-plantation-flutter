import 'package:flutter/material.dart';
import 'package:smart_plantation/core/app_images.dart';
import 'package:smart_plantation/core/core.dart';

class SpanLandscape extends StatelessWidget {
  const SpanLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0),
      children: [
        Image.asset(AppImages.landscape),
        Text(
          "Smart Plantation",
          style: AppTextStyles.heading40,
        )
      ],
    );
  }
}
