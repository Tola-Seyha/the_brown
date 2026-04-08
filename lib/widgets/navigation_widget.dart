import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brown/model/navigator_notifier.dart';
import 'package:the_brown/model/product_provider.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            // backgroundColor: Colors.brown.shade500,
            backgroundColor: Color(0xFFAF7950),
            indicatorColor: Color(0xFFAF7950),
            indicatorShape: CircleBorder(),
            labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                );
              }
              return TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              );
            }),
          ),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white70,
                  size: 25,
                ),
                selectedIcon: Icon(Icons.home, color: Colors.white70, size: 25),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.category_outlined,
                  size: 25,
                  color: Colors.white70,
                ),
                selectedIcon: Icon(
                  Icons.category,
                  color: Colors.white70,
                  size: 25,
                ),
                label: "Category",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.save_as_outlined,
                  size: 25,
                  color: Colors.white70,
                ),
                selectedIcon: Icon(
                  Icons.save_as,
                  size: 25,
                  color: Colors.white70,
                ),
                label: "Favorites",
              ),
              Stack(
                children: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 25,
                      color: Colors.white70,
                    ),
                    selectedIcon: Icon(
                      Icons.shopping_bag,
                      size: 25,
                      color: Colors.white70,
                    ),
                    label: "Cart",
                  ),
                  Selector<ProductProvider, int>(
                    builder: (context, itemCount, child) {
                      return itemCount > 0
                          ? Positioned(
                              top: 10,
                              right: 20,
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                child: Text(
                                  itemCount.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(); 
                    },
                    selector: (context, provider) => provider.itemCount,
                  ),
                ],
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_3_outlined,
                  color: Colors.white70,
                  size: 25,
                ),
                selectedIcon: Icon(
                  Icons.person_3,
                  color: Colors.white70,
                  size: 25,
                ),
                label: "Profile",
              ),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
          ),
        );
      },
    );
  }
}
