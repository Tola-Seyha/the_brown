import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_brown/model/product_model.dart';
import 'package:the_brown/model/product_provider.dart';

class ProductDetail extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;
  final ProductModel item;
  final String size;
  int index;
    ProductDetail({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.item,
    required this.size,
    this.index=0
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String selectedSize = widget.size;
  int _qty = 1;

  List<String> size = ["200g", "500g", "1kg"];

  double get _currentPrice {
    double basePrice = widget.price;
    if (selectedSize == "500g") return basePrice * 2;
    if (selectedSize == "1kg") return basePrice * 3;
    return basePrice;
  }

  double get _totalPrice => _currentPrice * _qty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ),
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: .start,
          children: [ 
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Image.asset(widget.imagePath, fit: BoxFit.contain),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0F172A),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting",
                    ),
                  ),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "\$${_currentPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: size
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: ChoiceChip(
                                  label: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: selectedSize == e
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.tertiary
                                          : Color(0xff0F172A),
                                    ),
                                  ),
                                  onSelected: (value) {
                                    setState(() {
                                      selectedSize = e;
                                    });
                                  },
                                  selected: selectedSize == e,
                                  showCheckmark: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  selectedColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  side: BorderSide.none,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Shipping",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA6A6A6),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Free",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff00B906),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Rating",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA6A6A6),
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    "4.0",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Delivery",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA6A6A6),
                                ),
                              ),
                              Spacer(),
                              Text("On Monday, May"),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_qty > 1) {
                              setState(() {
                                _qty--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 23,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        Text(
                          "$_qty",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _qty++;
                            });
                          },
                          icon: Icon(Icons.add, size: 23, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Total: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0F172A),
                        ),
                      ),
                      Text(
                        "\$${_totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: ElevatedButton(
                onPressed: () {
                  bool added = context.read<ProductProvider>().addPToCart(
                    ProductModel(
                      name: widget.item.name,
                      size: selectedSize,
                      price: _currentPrice,
                      imagePath: widget.item.imagePath,
                      category: widget.item.category,
                      quantity: _qty,
                    ),
                  );
                  if (added) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [ 
                            Text("Added ${widget.item.name} to Cart"),
                            Spacer(), 
                            ElevatedButton( 
                              style: ElevatedButton.styleFrom(  
                               backgroundColor: Colors.grey.shade50   
                              ),
                              onPressed: () {
                                context.read<ProductProvider>().removeFromCart(widget.index);
                              },
                              child: Text("Undo"),
                            ), 
                          ],
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${widget.item.name} is already in the Cart",
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    SizedBox(width: 5,),  
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
