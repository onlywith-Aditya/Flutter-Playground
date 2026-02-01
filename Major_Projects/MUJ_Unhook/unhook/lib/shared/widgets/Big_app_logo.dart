// ignore: file_names
import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

// ignore: use_key_in_widget_constructors
class BigAppLogo extends StatelessWidget {
  final Color mujColor;
  final Color unhookColor;
  final double scale;

  const BigAppLogo({
    super.key,
    this.mujColor = AppColors.black,
    this.unhookColor = AppColors.yellow,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: Offset(-5, 155),
              child: Text(
                'MUJ',
                style: AppTextStyle.mujHeadingBlackBig.copyWith(
                  color: mujColor,
                  // shadows: [
                  //   Shadow(
                  //     color: const Color.fromARGB(255, 75, 75, 75),
                  //     offset: Offset(1, 1),
                  //     blurRadius: 10,
                  //   ),
                  // ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(10, 162),
              child: Text(
                'unhook',
                style: AppTextStyle.unhookHeadingYellowBig.copyWith(
                  color: unhookColor,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
