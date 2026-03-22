import 'package:flutter/material.dart';

class ProductCardCpn extends StatelessWidget {
  final String name;
  final String size;
  final double price;
  final String imagePath;
  final Function()? onPressed;

  const ProductCardCpn({
    super.key,
    required this.name,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 0.5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),  
                      child: Image.asset(imagePath, fit: BoxFit.fill),       
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(   
                      alignment: .center, 
                      
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary, 
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30, 
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {}, 
                          icon: Icon(Icons.favorite_border, size: 20,), 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ), 
                          SizedBox(height: 5),
                          Text(
                            size,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ), 
                          SizedBox(height: 5),
                          Text(
                            "\$ ${price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDFC9B9),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onPressed,
                          icon: Icon(Icons.add),
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
