import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isSearchActive = true;
  final TextEditingController _searchCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String seletedCategory = "All";

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
    _searchCtrl.clear();
    _focusNode.unfocus();
    // FocusScope.of(context).unfocus();
  }

  List<String> categories = ["All", "Matcha", "Coffee", "Tea", "Material"];

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
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
                       
                        label: Text(e, style: TextStyle(fontSize: 16, color: seletedCategory ==e ? Theme.of(context).colorScheme.tertiary :  Theme.of(context).colorScheme.primary ,),), 
                        onSelected: (value) { 
                          setState(() {
                            seletedCategory = e; 
                          });
                        },
                        selected: seletedCategory ==e, 
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
