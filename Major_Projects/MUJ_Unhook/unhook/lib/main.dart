import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:unhook/features/auth/screens/login_screen.dart';
import 'package:unhook/features/onboarding/screens/Dimension.dart';

// ignore: unused_importx

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Dimension());
  }
}
