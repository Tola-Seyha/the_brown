import 'package:flutter/material.dart';
import 'package:the_brown/screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: "Roboto",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xffF6F8F6),
          brightness: Brightness.light,
        ),
      ),
      home: SignupScreen(),
    );
  }
}
