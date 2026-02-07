import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  String? selectedLevel;
  String? selectedCourse;
  String? selectedYear;

  // Define courses based on level
  List<String> graduationCourses = [
    'B.Tech / B.E.',
    'B.Sc.',
    'B.A.',
    'B.Com',
    'BBA',
    'BCA',
    'MBBS',
    'LLB',
    'B.Arch',
    'B.Pharm',
    'Other',
  ];

  List<String> postgradCourses = [
    'M.Tech / M.E.',
    'M.Sc.',
    'M.A.',
    'M.Com',
    'MBA',
    'MCA',
    'MD / MS',
    'LLM',
    'M.Arch',
    'M.Pharm',
    'Other',
  ];

  List<String> phdCourses = [
    'Ph.D. (Engineering)',
    'Ph.D. (Sciences)',
    'Ph.D. (Arts & Humanities)',
    'Ph.D. (Commerce)',
    'Ph.D. (Medical)',
    'Ph.D. (Law)',
    'Other',
  ];

  List<String> yearOptions = ['1st', '2nd', '3rd', '4th', '5th'];

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
                "Your\nAcademic\nBackground",
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
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              "This helps us understand your background better.",
              textAlign: TextAlign.center,
              style: AppTextStyle.suggestionText.copyWith(
                color: AppColors.suggestionGrey,
                height: 1.2,
                wordSpacing: 2,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Level Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Level Selection:",
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

          const SizedBox(height: 10),

          // Bachelor's and Master's in one row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bachelor's Option
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = "Bachelor's";
                      selectedCourse = null;
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
                      width: 180,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bachelor's",
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                color:
                                    selectedLevel == "Bachelor's"
                                        ? Colors.black
                                        : AppColors.yellow,
                              ),
                              child:
                                  selectedLevel == "Bachelor's"
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

              // Master's Option
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLevel = "Master's";
                      selectedCourse = null;
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
                      width: 180,
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Master's",
                              style: AppTextStyle.regularTextBlack.copyWith(
                                fontSize: 16,
                                wordSpacing: -1,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                color:
                                    selectedLevel == "Master's"
                                        ? Colors.black
                                        : AppColors.yellow,
                              ),
                              child:
                                  selectedLevel == "Master's"
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

          const SizedBox(height: 10),

          // PhD Option (centered)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = "PhD";
                    selectedCourse = null;
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
                    width: 180,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1.5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PhD",
                            style: AppTextStyle.regularTextBlack.copyWith(
                              fontSize: 16,
                              wordSpacing: -1,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black, width: 2),
                              color:
                                  selectedLevel == "PhD"
                                      ? Colors.black
                                      : AppColors.yellow,
                            ),
                            child:
                                selectedLevel == "PhD"
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
            ],
          ),

          const SizedBox(height: 20),

          // Course Selection - Fixed spelling
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Course Selection:",
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

          const SizedBox(height: 10),

          // Course Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCourse,
                      isExpanded: true,
                      hint: Text(
                        selectedLevel == null
                            ? "Select level first"
                            : "Select your course",
                        style: AppTextStyle.hintText.copyWith(fontSize: 14),
                      ),
                      items:
                          _getCoursesForLevel().map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppTextStyle.regularTextBlack.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged:
                          selectedLevel == null
                              ? null
                              : (String? newValue) {
                                setState(() {
                                  selectedCourse = newValue;
                                });
                              },
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Year Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Year of Completion:",
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

          const SizedBox(height: 10),

          // Year Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  yearOptions.map((year) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedYear = selectedYear == year ? null : year;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1.5),
                          color:
                              selectedYear == year
                                  ? Colors.black
                                  : Colors.white,
                        ),
                        child: Text(
                          year,
                          style: AppTextStyle.regularTextBlack.copyWith(
                            fontSize: 14,
                            color:
                                selectedYear == year
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          const Spacer(),

          // Next Button
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add validation and navigation here
                  if (selectedLevel == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select your education level"),
                      ),
                    );
                    return;
                  }
                  if (selectedCourse == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select your course")),
                    );
                    return;
                  }
                  if (selectedYear == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select year of completion"),
                      ),
                    );
                    return;
                  }

                  // Navigate to next screen
                  print("Level: $selectedLevel");
                  print("Course: $selectedCourse");
                  print("Year: $selectedYear");
                },
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

  // Helper method to get courses based on selected level
  List<String> _getCoursesForLevel() {
    switch (selectedLevel) {
      case "Bachelor's":
        return graduationCourses;
      case "Master's":
        return postgradCourses;
      case "PhD":
        return phdCourses;
      default:
        return [];
    }
  }
}
