import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
// import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/home_page.dart';
// import 'package:shop_app_flutter/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme =
        ThemeData.light(); // use base theme to get default text styles

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          textTheme: GoogleFonts.oswaldTextTheme(baseTheme.textTheme).copyWith(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            titleMedium: GoogleFonts.oswald(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              // color: Colors.black,
            ),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 199, 1),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
        // home: ProductDetailsPage(product: products[0]),
      ),
    );
  }
}
