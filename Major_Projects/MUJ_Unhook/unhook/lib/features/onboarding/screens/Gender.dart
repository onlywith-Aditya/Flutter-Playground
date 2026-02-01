import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
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
                "Hola! Name",
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
                  "We love that you're here. Pick the gender\nwhich describe you best.",
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

          // Gender Label
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Choose your gender:",
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

          // Male Option
          // Male Option
          // Male Option
          // Male Option
          // Male Option
          // Male Option
          // Male Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Container(
                      width: 260,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.yellow, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Male',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                wordSpacing: -2,
                                color: Colors.black, // Always black text
                              ),
                            ),
                            // Checkbox - Moved to right side
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Square with corner radius
                                border: Border.all(
                                  color: Colors.black, // Always black border
                                  width: 2,
                                ),
                                color:
                                    selectedGender == 'Male'
                                        ? Colors
                                            .black // Filled when selected
                                        : const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ), // Empty when not selected
                              ),
                              child:
                                  selectedGender == 'Male'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.yellow,
                                      )
                                      : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Female Option
          // Female Option
          // Female Option
          // Female Option
          // Female Option
          // Female Option
          // Female Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Container(
                      width: 260,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.yellow, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Female',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                wordSpacing: -2,
                                fontWeight: FontWeight.w400,
                                color: Colors.black, // Always black text
                              ),
                            ),
                            // Checkbox - Moved to right side
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Square with corner radius
                                border: Border.all(
                                  color: Colors.black, // Always black border
                                  width: 2,
                                ),
                                color:
                                    selectedGender == 'Female'
                                        ? Colors
                                            .black // Filled when selected
                                        : const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ), // Empty when not selected
                              ),
                              child:
                                  selectedGender == 'Female'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.yellow,
                                      )
                                      : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Other Option
          // Other Option
          // Other Option
          // Other Option
          // Other Option
          // Other Option
          // Other Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Other';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Container(
                      width: 260,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.yellow, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Other',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                wordSpacing: -2,
                                color: Colors.black, // Always black text
                              ),
                            ),
                            // Checkbox - Moved to right side
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Square with corner radius
                                border: Border.all(
                                  color: Colors.black, // Always black border
                                  width: 2,
                                ),
                                color:
                                    selectedGender == 'Other'
                                        ? Colors
                                            .black // Filled when selected
                                        : const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ), // Empty when not selected
                              ),
                              child:
                                  selectedGender == 'Other'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.yellow,
                                      )
                                      : null,
                            ),
                          ],
                        ),
                      ),
                    ),
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
