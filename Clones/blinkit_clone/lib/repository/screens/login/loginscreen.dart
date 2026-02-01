import 'package:blinkit_clone/repository/screens/bottomnav/bottomnavScreen.dart';
import 'package:blinkit_clone/widgets/uihelper.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Add OnboardingScreen
          UiHelper.CustomImage(img: "OnboardingScreen.png"),

          //Add MiniLogo
          SizedBox(height: 30),
          UiHelper.CustomImage(img: "miniLogo.png"),

          //Add Text
          SizedBox(height: 20),
          UiHelper.CustomText(
            text: "India's last minute app",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 20,
            fontfamily: "Poppins_Bold",
          ),

          // Login Container
          SizedBox(height: 15),
          // ignore: sized_box_for_whitespace
          Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    UiHelper.CustomText(
                      text: "Aditya",
                      color: Colors.black,
                      fontweight: FontWeight.w400,
                      fontsize: 15,
                    ),
                    SizedBox(height: 5),
                    UiHelper.CustomText(
                      text: "9950860637",
                      color: Color.fromRGBO(156, 156, 156, 1),
                      fontweight: FontWeight.w400,
                      fontsize: 15,
                    ),

                    // Login Button
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 295,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(226, 55, 68, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UiHelper.CustomText(
                                text: "Login with",
                                color: Colors.white,
                                fontweight: FontWeight.w700,
                                fontsize: 14,
                              ),
                              SizedBox(width: 5),
                              UiHelper.CustomImage(img: "zomato.png"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                    UiHelper.CustomText(
                      text:
                          "Access your saved addresses from Zomato automatically!",
                      color: Color.fromRGBO(156, 156, 156, 1),
                      fontweight: FontWeight.normal,
                      fontsize: 8.5,
                    ),

                    SizedBox(height: 15),

                    UiHelper.CustomText(
                      text: "or login with phone number",
                      color: Color.fromRGBO(38, 146, 55, 1),
                      fontweight: FontWeight.normal,
                      fontsize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
