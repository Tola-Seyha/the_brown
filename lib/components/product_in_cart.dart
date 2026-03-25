import 'package:flutter/material.dart';

class ProductInCart extends StatefulWidget {
  final String imagePath;
  final String name;
  final String size;
  final double price;
  final Function()? onPressed;
  final int quantity;
  final Function(int)? onQuantityChanged;

  const ProductInCart({
    super.key,
    required this.imagePath,
    required this.name,
    required this.size,
    required this.price,
    required this.onPressed,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {
  late int _qty;

  @override
  void initState() {
    super.initState();
    _qty = widget.quantity;
  }
  
  @override
  void didUpdateWidget(covariant ProductInCart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantity != widget.quantity) {
      _qty = widget.quantity;
    }
  }

  double get _totalPrice => widget.price * _qty;

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
                  // color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Image.asset(widget.imagePath),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: 100,
                // color: Colors.teal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.size,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "\$${_totalPrice.toStringAsFixed(2)}",
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
                  SizedBox(
                    height: double.infinity,
                    width: 100,
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: widget.onPressed, 
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red.shade600,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (_qty > 1) {
                                  setState(() {
                                    _qty--;
                                  });
                                  if (widget.onQuantityChanged != null) {
                                    widget.onQuantityChanged!(_qty);
                                  }
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                          Text(
                            "$_qty",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _qty++;
                                });
                                if (widget.onQuantityChanged != null) {
                                  widget.onQuantityChanged!(_qty);
                                }
                              },
                              icon: Icon(Icons.add, size: 18, color: Colors.blue),
                            ),
                          ),
                        ],
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
