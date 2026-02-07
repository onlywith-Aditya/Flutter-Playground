import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class CampusLife extends StatelessWidget {
  const CampusLife({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wholeWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Make the upper content scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120),

                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tell me about\nyour campus\nlife...",
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
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "College Club:",
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

                  // Add some extra space at bottom for scrolling
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // The Spacer will push the button to bottom
          const Spacer(),

          // Next Button at bottom (stays fixed)
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
