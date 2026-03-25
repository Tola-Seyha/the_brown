import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brown/components/product_in_cart.dart';
import 'package:the_brown/model/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final value = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Selector<ProductProvider, int>(
          builder: (context, itemCount, child) {
            return Text(
              "My Carts ($itemCount) ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          },
          selector: (context, count) => count.itemCount,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Selector<ProductProvider, bool>(
              selector: (coontext, provider) {
                return provider.addToCart.isNotEmpty;
              },
              builder: (context, isNotEmpty, child) {
                return isNotEmpty
                    ? TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: const Text(
                                  "Do you want to clear your cart?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<ProductProvider>()
                                          .removeAll();
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
                      )
                    : TextButton(
                        onPressed: () {},
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color:  Colors.red.shade200, 
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
                  return value.addToCart.isEmpty
                      ? Center(
                          child: Text(
                            "Your cart is empty",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: value.addToCart.length,
                          itemBuilder: (context, index) {
                            final p = value.addToCart[index];
                            return ProductInCart(
                              imagePath: p.imagePath,
                              name: p.name,
                              size: p.size,
                              price: p.price,
                              quantity: p.quantity,
                              onPressed: () {
                                context.read<ProductProvider>().removeFromCart(
                                  index,
                                );
                              },
                              onQuantityChanged: (newQty) {
                                context.read<ProductProvider>().updateQuantity(
                                  index,
                                  newQty,
                                );
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
