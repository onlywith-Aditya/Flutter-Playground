//import 'package:currency_converter/currency_converter_cupertino_page.dart';
//import 'package:flutter/cupertino.dart';
import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  ); // Why we used const-> Bec. we used it below and it imp. performance.  Don't have to rebuilt.
}

//Type of Widgets
//1. StatelessWidget
//2. StatefullWidget

//Create Own Widgets--------------------------------------|Start

//MaterialApp

class MyApp extends StatelessWidget {
  // To avoid MyApp warning we need to add super.key and why we optionally taking
  //some stuff from constructor.

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CurrencyConverterMaterialPage());
  }
}

//CupertinoApp

// class MyCupertinoApp extends StatelessWidget {
//   // To avoid MyApp warning we need to add super.key and why we optionally taking
//   //some stuff from constructor.
//   const MyCupertinoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(home: CurrencyConverterCupertinoPage());
//   }
// }


///Conclusion: What we did we create class and return text to it that we want to show
     ///so earlier we used in main() class and it make our code broad to solve this problem
     ///we create new class to make things organized.
////Create Own Widgets--------------------------------------|End