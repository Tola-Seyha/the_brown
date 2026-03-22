import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brown/model/product_provider.dart';
import 'package:the_brown/theme/them_mode.dart';
import 'package:the_brown/widgets/widget_tree.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
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
