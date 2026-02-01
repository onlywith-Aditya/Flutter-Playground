import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class GetEmail extends StatelessWidget {
  const GetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wholeWhite,
      // Add this to prevent screen resizing
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
                        "What's your\nEmail?",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 320,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(color: AppColors.suggestionGrey),
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                              bottom: 0,
                            ),
                            // Single Underline
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.black, width: 2),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.black, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.black, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verify you MUJ email for double authentication.',
                        style: AppTextStyle.suggestionText.copyWith(
                          height: 1.2,
                          wordSpacing: 0,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),

                  // Add some extra space at bottom for scrolling
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),

          // Spacer pushes button to bottom
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