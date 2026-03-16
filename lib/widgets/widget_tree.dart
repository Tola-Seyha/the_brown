import 'package:flutter/material.dart';
import 'package:the_brown/model/navigator_notifier.dart';
import 'package:the_brown/screen/cart_screen.dart';
import 'package:the_brown/screen/category_screen.dart';
import 'package:the_brown/screen/favorite_screen.dart';
import 'package:the_brown/screen/home_screen.dart';
import 'package:the_brown/screen/profile_screen/profile_screen.dart';
import 'package:the_brown/widgets/navigation_widget.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<WidgetTree> {
  List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) { 
    return ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child) {
      return Scaffold(
       body: pages.elementAt(selectedPage), 
       bottomNavigationBar:  NavigationWidget(),  
    ); 
    },);
  }
}