class ProductModel {
  final String name;
  final String size;
  final double price;
  final String category;
  final String imagePath;
  int quantity;

  ProductModel({
    required this.name,
    required this.size,
    required this.price,
    required this.imagePath,
    required this.category,
    this.quantity = 1,
  });
}
