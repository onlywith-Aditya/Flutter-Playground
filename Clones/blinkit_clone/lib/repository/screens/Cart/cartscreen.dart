import 'package:blinkit_clone/widgets/uihelper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  // const Cartscreen({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        SizedBox(height: 36),
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Color(0xFFF7CB45),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          UiHelper.CustomText(
                            text: "Blinkit in",
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            fontsize: 14,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 28),
                          UiHelper.CustomText(
                            text: "15 minutes",
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 30),
                          UiHelper.CustomText(
                            text: "HOME -",
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            fontsize: 12,
                          ),
                          SizedBox(width: 5),
                          UiHelper.CustomText(
                            text: "Aditya Dadhich, Jodhpur (Raj)",
                            color: Colors.black,
                            fontweight: FontWeight.bold,
                            fontsize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // User Login Icons
              Positioned(
                right: 20,
                bottom: 100,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
              ),

              // Adding Search Bar
              Positioned(
                bottom: 30,
                left: 20,
                child: UiHelper.CustomTextField(controller: searchController),
              ),
            ],
          ),

          SizedBox(height: 20),
          UiHelper.CustomImage(img: "shopping-cart.png"),
          SizedBox(height: 10),
          UiHelper.CustomText(
            text: "Reordering will be easy",
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 16,
          ),

          SizedBox(height: 20),
          UiHelper.CustomText(
            text: "Items you order will show up here so you can buy",
            color: Colors.black,
            fontweight: FontWeight.w400,
            fontsize: 12,
          ),

          SizedBox(height: 5),
          UiHelper.CustomText(
            text: "them again easily.",
            color: Colors.black,
            fontweight: FontWeight.w400,
            fontsize: 12,
          ),

          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 30),
              UiHelper.CustomText(
                text: "Bestseller",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 16,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),

              Stack(
                children: [
                  UiHelper.CustomImage(img: "milk.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 98, left: 60),
                    child: UiHelper.CustomButton(() {}),
                  ),
                ],
              ),

              SizedBox(width: 20),

              Stack(
                children: [
                  UiHelper.CustomImage(img: "potato.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 98, left: 60),
                    child: UiHelper.CustomButton(() {}),
                  ),
                ],
              ),

              SizedBox(width: 20),

              Stack(
                children: [
                  UiHelper.CustomImage(img: "tomato.png"),
                  Padding(
                    padding: EdgeInsets.only(top: 98, left: 60),
                    child: UiHelper.CustomButton(() {}),
                  ),
                  // UiHelper.CustomImage(img: "potato.png"),
                  // UiHelper.CustomImage(img: "tomato.png"),
                ],
              ),
            ],
          ),

          Row(
            children: [
              SizedBox(width: 30),

              UiHelper.CustomText(
                text: "Amul Milk",
                color: Colors.black,
                fontweight: FontWeight.w400,
                fontsize: 10,
              ),

              SizedBox(width: 60),

              UiHelper.CustomText(
                text: "Potato(Aloo)",
                color: Colors.black,
                fontweight: FontWeight.w400,
                fontsize: 10,
              ),

              SizedBox(width: 40),

              UiHelper.CustomText(
                text: "Tomato",
                color: Colors.black,
                fontweight: FontWeight.w400,
                fontsize: 10,
              ),
            ],
          ),

          // Timer
          Row(
            children: [
              SizedBox(width: 28),
              Image.asset("assets/images/timer.png", width: 18, height: 20),
              UiHelper.CustomText(
                text: "16 MINS",
                color: const Color.fromARGB(255, 87, 87, 87),
                fontweight: FontWeight.w400,
                fontsize: 12,
              ),

              SizedBox(width: 40),

              Image.asset("assets/images/timer.png", width: 18, height: 20),
              UiHelper.CustomText(
                text: "16 MINS",
                color: const Color.fromARGB(255, 87, 87, 87),
                fontweight: FontWeight.w400,
                fontsize: 12,
              ),

              SizedBox(width: 35),

              Image.asset("assets/images/timer.png", width: 18, height: 20),
              UiHelper.CustomText(
                text: "16 MINS",
                color: const Color.fromARGB(255, 87, 87, 87),
                fontweight: FontWeight.w400,
                fontsize: 12,
              ),
            ],
          ),

          //Price
          SizedBox(height: 10),

          Row(
            children: [
              SizedBox(width: 32),

              UiHelper.CustomText(
                text: "₹40",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20,
              ),

              SizedBox(width: 75),

              UiHelper.CustomText(
                text: "₹40",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20,
              ),

              SizedBox(width: 75),

              UiHelper.CustomText(
                text: "₹40",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
