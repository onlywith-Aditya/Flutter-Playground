import 'package:flutter/material.dart';
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';

class Dimension extends StatefulWidget {
  const Dimension({super.key});

  @override
  State<Dimension> createState() => _DimensionState();
}

class _DimensionState extends State<Dimension> {
  // Height variables (feet and inches)
  int selectedFeet = 0;
  int selectedInches = 0;

  // Weight variable
  TextEditingController weightController = TextEditingController();
  final FocusNode _weightFocusNode = FocusNode();

  @override
  void dispose() {
    weightController.dispose();
    _weightFocusNode.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.only(top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can change your dimension later also.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.suggestionText.copyWith(
                    color: AppColors.suggestionGrey,
                    height: 2,
                    wordSpacing: 2,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

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

          // Height Selection Widget (Scrollable)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Feet Picker
              Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),

                  color: AppColors.yellow,

                  // Box Shadow
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListWheelScrollView(
                  itemExtent: 50,
                  diameterRatio: 2,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedFeet = index + 3; // Range: 3-8 feet
                    });
                  },
                  children: List.generate(6, (index) {
                    int feet = index + 3; // 3 to 8 feet
                    return Center(
                      child: Text(
                        "$feet ft",
                        style: AppTextStyle.regularTextBlack.copyWith(
                          fontSize: 24,
                          color:
                              selectedFeet == feet
                                  ? Colors.black
                                  : Colors.black54,
                          fontWeight:
                              selectedFeet == feet
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(width: 20),

              // Inches Picker
              Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 1.5),
                  color: AppColors.yellow,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListWheelScrollView(
                  itemExtent: 50,
                  diameterRatio: 2,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedInches = index;
                    });
                  },
                  children: List.generate(12, (index) {
                    return Center(
                      child: Text(
                        "$index in",
                        style: AppTextStyle.regularTextBlack.copyWith(
                          fontSize: 24,
                          color:
                              selectedInches == index
                                  ? Colors.black
                                  : Colors.black54,
                          fontWeight:
                              selectedInches == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Current Height Display
          Text(
            "Current height: $selectedFeet ft $selectedInches in",
            style: AppTextStyle.suggestionText.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          // Weight Label
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Your weight(in kg):",
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

          // Weight Input with Numeric Keyboard
          // Weight Input with Numeric Keyboard
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
                height: 60,
                width: 200,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 1.5),
                  color: AppColors.yellow,
                ),
                child: Stack(
                  children: [
                    // TextField without suffix
                    TextField(
                      controller: weightController,
                      focusNode: _weightFocusNode,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      buildCounter:
                          (
                            context, {
                            required currentLength,
                            required isFocused,
                            maxLength,
                          }) => null,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regularTextBlack.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter weight",
                        hintStyle: AppTextStyle.hintText.copyWith(fontSize: 15),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          right: 50,
                        ), // Space for "kg"
                        counterText: "",
                      ),
                    ),
                    // Static "kg" overlay
                    Positioned(
                      right: 15,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Text(
                          " kg",
                          style: AppTextStyle.regularTextBlack.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Spacer and Button
          const Spacer(),

          // Next Button
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Dismiss keyboard
                  _weightFocusNode.unfocus();
                  // Process data
                  print("Height: $selectedFeet ft $selectedInches in");
                  print("Weight: ${weightController.text} kg");
                  // Add your navigation logic here
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
}
