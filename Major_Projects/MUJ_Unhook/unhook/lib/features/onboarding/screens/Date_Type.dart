// ignore: file_names
import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class DateType extends StatefulWidget {
  const DateType({super.key});

  @override
  State<DateType> createState() => _DateTypeState();
}

class _DateTypeState extends State<DateType> {
  String? dateType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 120),

          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What are you\nlooking for?",
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
                  "This is just for information, not affect your matches.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.suggestionText.copyWith(
                    color: AppColors.suggestionGrey,
                    height: 1.2,
                    wordSpacing: 2,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Date Type
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Choose Dating Type:",
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

          // Long-term Option
          // Long-term Option
          // Long-term Option
          // Long-term Option
          // Long-term Option
          // Long-term Option
          // Long-term Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dateType = 'Long-term';
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
                        color: Colors.white, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Long-term',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
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
                                    dateType == 'Long-term'
                                        ? const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ) // Filled when selected
                                        : AppColors
                                            .yellow, // Empty when not selected
                              ),
                              child:
                                  dateType == 'Long-term'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.yellow,
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

          // Short-term Option
          // Short-term Option
          // Short-term Option
          // Short-term Option
          // Short-term Option
          // Short-term Option
          // Short-term Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dateType = 'Short-term';
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
                        color: Colors.white, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Short-term',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
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
                                    dateType == 'Short-term'
                                        ? const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ) // Filled when selected
                                        : AppColors
                                            .yellow, // Empty when not selected
                              ),
                              child:
                                  dateType == 'Short-term'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.yellow,
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

          // Friendship Option
          // Friendship Option
          // Friendship Option
          // Friendship Option
          // Friendship Option
          // Friendship Option
          // Friendship Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dateType = 'Friendship';
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
                        color: Colors.white, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Friendship',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
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
                                    dateType == 'Friendship'
                                        ? const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ) // Filled when selected
                                        : AppColors
                                            .yellow, // Empty when not selected
                              ),
                              child:
                                  dateType == 'Friendship'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.yellow,
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

          // Casual Option
          // Casual Option
          // Casual Option
          // Casual Option
          // Casual Option
          // Casual Option
          // Casual Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dateType = 'Casual';
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
                        color: Colors.white, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Casual',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
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
                                    dateType == 'Casual'
                                        ? const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ) // Filled when selected
                                        : AppColors
                                            .yellow, // Empty when not selected
                              ),
                              child:
                                  dateType == 'Casual'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.yellow,
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

          // Figuring Out Option
          // Figuring Out Option
          // Figuring Out Option
          // Figuring Out Option
          // Figuring Out Option
          // Figuring Out Option
          // Figuring Out Option
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      dateType = 'Figuring Out';
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
                        color: Colors.white, // Always yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Space between text and checkbox
                          children: [
                            Text(
                              'Figuring Out',
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
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
                                    dateType == 'Figuring Out'
                                        ? const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ) // Filled when selected
                                        : AppColors
                                            .yellow, // Empty when not selected
                              ),
                              child:
                                  dateType == 'Figuring Out'
                                      ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: AppColors.yellow,
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
          // Spacer and Button
          // Spacer and Button
          // Spacer and Button
          // Spacer and Button
          // Spacer and Button
          // Spacer and Button
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
