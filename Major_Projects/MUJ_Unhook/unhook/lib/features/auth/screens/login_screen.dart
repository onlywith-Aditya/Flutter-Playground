import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:unhook/core/constants/app_colors.dart';
import 'package:unhook/core/constants/app_text_style.dart';
import 'package:unhook/shared/widgets/Big_app_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 58, 56, 56),

      // 1st Column

      //////// Button - 2
      body: Container(
        // Adding Images
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Stock Images/Couple.jpg'),
            fit: BoxFit.fitHeight,
            // scale: 0.5,
            alignment: Alignment.center
          ),
        ),

        // Button
        child: Column(
          children: [
            const Expanded(child: Center(child: BigAppLogo())),
            // 2nd Column
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        // Press Action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        minimumSize: const Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Text-> Create an account
                      child: Text(
                        'Create an account',
                        style: AppTextStyle.regularTextBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            //////// Button - 2
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        // Press Action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          23,
                          255,
                          255,
                          255,
                        ),
                        //backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.white, width: 0.1),
                        minimumSize: const Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Text-> Create an account
                      child: Text(
                        'I have an account',
                        style: AppTextStyle.regularTextYellow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
