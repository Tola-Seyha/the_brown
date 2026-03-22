import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(title: Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.addToCart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                offset: Offset(1, 2),
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                  ),
                                  child: Image.asset(
                                    value.addToCart[index].imagePath,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  width: 100,
                                  // color: Colors.teal,
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    mainAxisAlignment: .spaceEvenly,
                                    children: [
                                      Text(
                                        value.addToCart[index].name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        value.addToCart[index].size,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        "\$${value.addToCart[index].price.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: double.infinity,
                                      width: 100,
                                      // color: Colors.brown,
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      right: 15,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDFC9B9),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      right: 15,
                                      child: Container(
                                        alignment: .center,

                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.tertiary,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite_border,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
