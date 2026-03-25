import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brown/components/product_in_favorite.dart';
import 'package:the_brown/model/product_provider.dart';
import 'package:the_brown/screen/category_screen/product_detail.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Selector<ProductProvider, int>(
          builder: (context, favoriteCount, child) {
            return Text(
              "My Favorites ($favoriteCount)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          },
          selector: (context, provider) => provider.favoriteCount,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Selector<ProductProvider, bool>(
              selector: (p0, provider) => provider.favorites.isEmpty, 
              builder: (context, isEmpty, child) {
                return isEmpty
                    ? TextButton(
                        onPressed: () {},
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade200,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text(
                                  "Do you want to clear all favorites?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProductProvider>()
                                          .removeAllFavorites();
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green.shade600,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return value.favorites.isEmpty
                      ? Center(
                          child: Text(
                            "No favorites yet!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.favorites.length,
                          itemBuilder: (context, index) {
                            final p = value.favorites[index];
                            return ProductInFavorite(
                              imagePath: p.imagePath,
                              name: p.name,
                              size: p.size,
                              price: p.price,
                              product: p,
                              onDetailsPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ProductDetail(
                                        name: p.name,
                                        imagePath: p.imagePath,
                                        price: p.price,
                                        item: p,
                                        size: p.size,
                                      );
                                    },
                                  ),
                                );
                              },
                              onRemovePressed: () {
                                context
                                    .read<ProductProvider>()
                                    .removeFromFavorites(index);
                              },
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
