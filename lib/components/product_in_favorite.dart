import 'package:flutter/material.dart';
import 'package:the_brown/model/product_model.dart';

class ProductInFavorite extends StatelessWidget {
  final String imagePath;
  final String name;
  final String size;
  final double price;
  final ProductModel product;
  final Function()? onRemovePressed;
  final Function()? onDetailsPressed;
  const ProductInFavorite({
    super.key,
    required this.imagePath,
    required this.name,
    required this.size,
    required this.price,
    required this.product,
    this.onRemovePressed,
    this.onDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Image.asset(imagePath),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: 100,
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      size,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(height: double.infinity, width: 100),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDFC9B9),
                        borderRadius: BorderRadius.circular(100),
                      ), 
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onDetailsPressed,
                          icon: Icon(Icons.add, size: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container( 
                      decoration: BoxDecoration(   
                        // color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(100),     
                      ),
                      child: SizedBox( 
                        width: 35,
                        height: 35,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onRemovePressed,  
                          icon: Icon(Icons.delete_outline, size: 23, color: Theme.of(context).colorScheme.error,), 
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
  }
}
