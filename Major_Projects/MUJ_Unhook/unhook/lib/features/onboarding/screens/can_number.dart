import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class GetNumber extends StatelessWidget {
  const GetNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wholeWhite,
      // Add this to prevent screen resizing when keyboard opens
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Make the upper content scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120),

                  // Title regular Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Can we get\nyour number?',
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'We only use your phone number to make sure your\nare authenticate MUJ Student.',
                        style: AppTextStyle.suggestionText.copyWith(
                          height: 1.2,
                          wordSpacing: 0,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 91+ Number Card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 1.5),
                          boxShadow: [BoxShadow(color: AppColors.wholeWhite)],
                        ),
                        width: 75,
                        height: 50,
                        child: Center(
                          child: Text('IN+91', style: AppTextStyle.indRegular),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Textbox with shadow and border
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 0),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0,
                              spreadRadius: 0,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Container(
                          width: 260,
                          height: 50,
                          margin: EdgeInsets.only(
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 1.5),
                            color: Colors.white,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter your phone number',
                              hintStyle: AppTextStyle.hintText.copyWith(
                                wordSpacing: -2,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Add some extra space at bottom
                  const SizedBox(height: 50),
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