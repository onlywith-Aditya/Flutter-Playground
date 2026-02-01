import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class Dimension extends StatefulWidget {
  const Dimension({super.key});

  @override
  State<Dimension> createState() => _GenderState();
}

class _GenderState extends State<Dimension> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wholeWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 120),

          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Now let's talk\n   about you.",
                style: AppTextStyle.regularTitleTextBlack.copyWith(
                  color: AppColors.black,
                  height: 1,
                  wordSpacing: 2,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),

          // Suggestion Text
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can change you dimension later also.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.suggestionText.copyWith(
                    color: AppColors.black,
                    height: 1.2,
                    wordSpacing: 2,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Height Label
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Your height:",
                  style: AppTextStyle.regularTextBlack.copyWith(
                    color: AppColors.black,
                    height: 1,
                    wordSpacing: 2,
                    letterSpacing: 0,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Input of height in feets.

          // Weight Label
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Your weight:",
                  style: AppTextStyle.regularTextBlack.copyWith(
                    color: AppColors.black,
                    height: 1,
                    wordSpacing: 2,
                    letterSpacing: 0,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          // Spacer and Button
          const Spacer(),

          // Next Button
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Next', style: AppTextStyle.regularTextWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
