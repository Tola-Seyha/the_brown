import 'package:flutter/material.dart';
import 'package:the_brown/screen/signup_screen.dart';
import 'package:the_brown/theme/them_mode.dart';
import 'package:the_brown/widgets/widget_tree.dart';

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
      
      theme: colorMode, 
      home: WidgetTree(),
    ); 
 
  }
}
