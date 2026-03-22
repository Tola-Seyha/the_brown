import 'package:flutter/material.dart';
import 'package:the_brown/components/product_card_cpn.dart';
import 'package:the_brown/model/product_model.dart';
import 'package:the_brown/model/product_provider.dart';
import 'package:the_brown/screen/category_screen/product_detail.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final pro = ProductProvider();

  bool isSearchActive = true;
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> categories = ["All", "Matcha", "Coffee", "Tea", "Material"];
  String seletedCategory = "All";
  String searchProduct = "";

  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
      () => setState(() {
        _isTyping = _searchCtrl.text.isNotEmpty;
      }),
    );
  }

  void _closeIcon() {
    searchProduct = "";
    _searchCtrl.clear();
    _focusNode.unfocus();
    // FocusScope.of(context).unfocus();
  }

  List<ProductModel> filterProduct(List<ProductModel> products) {
    List<ProductModel> filtered = products;
    if (seletedCategory != "All") {
      filtered = filtered
          .where(
            (p) => p.category.toLowerCase() == seletedCategory.toLowerCase(),
          )
          .toList();
    }
    if (searchProduct.isNotEmpty) {
      filtered = filtered
          .where(
            (e) => e.name.toLowerCase().contains(
              searchProduct.trim().toLowerCase(),
            ),
          )
          .toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> filtered = filterProduct(pro.products);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fine what you want here",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xffAF7950),
          ),
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: TextField(
              controller: _searchCtrl,
              focusNode: _focusNode,
              onTapOutside: (event) {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChanged: (value) {
                setState(() {
                  searchProduct = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                // fillColor: Color( ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                suffixIcon: IconButton(
                  icon: _isTyping
                      ? Icon(Icons.close, size: 25)
                      : Icon(Icons.search, size: 25),

                  onPressed: () {
                    setState(() {
                      if (_isTyping) {
                        _closeIcon();
                      } else {
                        _focusNode.requestFocus();
                      }
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      showCheckmark: false,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide.none,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      label: Text(
                        e,
                        style: TextStyle(
                          fontSize: 16,
                          color: seletedCategory == e
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onSelected: (value) {
                        setState(() {
                          seletedCategory = e;
                        });
                      },
                      selected: seletedCategory == e,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: GridView.builder(
                itemCount: filtered.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final p = filtered[index];
                  return ProductCardCpn(
                    imagePath: p.imagePath,
                    name: p.name,
                    size: p.size,
                    price: p.price,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetail(
                              name: p.name,
                              imagePath: p.imagePath,
                              price: p.price,
                              item: p,
                            );
                          },
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
