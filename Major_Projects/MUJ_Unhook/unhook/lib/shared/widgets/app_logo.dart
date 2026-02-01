import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class AppLogo extends StatelessWidget {
  final double scale;

  const AppLogo({
    super.key,
    this.scale = 1.0, // Default scale
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale, // Scale both texts together
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(10, 40),
            child: Text('MUJ', style: AppTextStyle.mujHeadingBlack),
          ),
          Transform.translate(
            offset: Offset(25, 50),
            child: Text('unhook', style: AppTextStyle.unhookHeadingBlack),
          ),
        ],
      ),
    );
  }
}
