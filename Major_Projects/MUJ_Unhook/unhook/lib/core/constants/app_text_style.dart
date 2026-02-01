import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyle {
  //--------------------------------------Yellow|

  // 1. Heading-> MUJ----------------| Yellow
  static TextStyle get mujHeadingYellow => GoogleFonts.bungeeShade(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    //color: AppColors.yellow,
  );
  // 2. Heading-> Unhook----------------| Yellow
  static TextStyle get unhookHeadingYellow => GoogleFonts.pattaya(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    //color: AppColors.yellow,
  );

  // 3. Regular Text----------------------| Yellow
  static TextStyle get regularTextYellow => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.yellow,
  );

  // 1a. Heading-> MUJ----------------| Yellow-----{BIG LOGO}
  static TextStyle get mujHeadingYellowBig => GoogleFonts.bungeeShade(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    //color: AppColors.yellow,
  );
  // 2a. Heading-> Unhook----------------| Yellow-----{BIG LOGO}
  static TextStyle get unhookHeadingYellowBig => GoogleFonts.pattaya(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    //color: AppColors.yellow,
  );

  //--------------------------------------Black|

  // 1. Heading-> MUJ----------------| Black
  static TextStyle get mujHeadingBlack => GoogleFonts.bungeeShade(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    //color: AppColors.black,
  );

  // 2. Heading-> Unhook----------------| Black
  static TextStyle get unhookHeadingBlack => GoogleFonts.pattaya(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    //color: AppColors.black,
  );

  // 3.Regular Text----------------------| Black
  static TextStyle get regularTextBlack => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // 4.Regular Title Text----------------------| Black
  static TextStyle get regularTitleTextBlack => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // 1a. Heading-> MUJ----------------| Black-----{BIG LOGO}
  static TextStyle get mujHeadingBlackBig => GoogleFonts.bungeeShade(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    //color: AppColors.black,
  );

  // 2a. Heading-> Unhook----------------| Black-----{BIG LOGO}
  static TextStyle get unhookHeadingBlackBig => GoogleFonts.pattaya(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    //color: AppColors.black,
  );

  //White|--------------------------------
  //--------------------------------------
  //--------------------------------------
  //--------------------------------White|

  // Regular Text----------------------| White
  static TextStyle get regularTextWhite => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  //--------------------------------------White|

  // Hint-Text----------------------| Grey
  static TextStyle get hintText => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  //Suggestion Text
  static TextStyle get suggestionText => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: const Color.fromARGB(255, 110, 110, 110),
  );

  // 3.IN 91+----------------------| Black
  static TextStyle get indRegular => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
