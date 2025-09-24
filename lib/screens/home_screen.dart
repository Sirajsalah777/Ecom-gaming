import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../data/products_data.dart';
import '../providers/products_provider.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  String _selectedCategory = 'Tous';
  final List<String> _categories = ['Tous', ...products.map((p) => p.category).toSet().toList()];
  late AnimationController _animationController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Product> _getFilteredProducts(List<Product> products) {
    if (_selectedCategory == 'Tous') {
      return products;
    }
    return products.where((product) => product.category == _selectedCategory).toList();
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Trier par'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Nom (A-Z)'),
              onTap: () {
                Provider.of<ProductsProvider>(context, listen: false)
                    .setSortOption(SortOption.nameAsc);
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              title: const Text('Nom (Z-A)'),
              onTap: () {
                Provider.of<ProductsProvider>(context, listen: false)
                    .setSortOption(SortOption.nameDesc);
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              title: const Text('Prix croissant'),
              onTap: () {
                Provider.of<ProductsProvider>(context, listen: false)
                    .setSortOption(SortOption.priceAsc);
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              title: const Text('Prix décroissant'),
              onTap: () {
                Provider.of<ProductsProvider>(context, listen: false)
                    .setSortOption(SortOption.priceDesc);
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Shop Gaming'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: _showSortDialog,
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              Consumer<CartProvider>(
                builder: (context, cart, child) => Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    Provider.of<ProductsProvider>(context, listen: false)
                        .setSearchQuery('');
                  },
                ),
              ),
              onChanged: (value) {
                Provider.of<ProductsProvider>(context, listen: false)
                    .setSearchQuery(value);
              },
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    selected: _selectedCategory == _categories[index],
                    label: Text(_categories[index]),
                    onSelected: (selected) {
                      if (_categories[index] != 'Tous') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                              category: _categories[index],
                              products: products.where((p) => p.category == _categories[index]).toList(),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _selectedCategory = _categories[index];
                        });
                      }
                    },
                    selectedColor: Theme.of(context).primaryColor,
                    checkmarkColor: Colors.white,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Consumer<ProductsProvider>(
              builder: (context, productsProvider, child) {
                final filteredProducts = _getFilteredProducts(
                  productsProvider.filteredAndSortedProducts,
                );
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: filteredProducts[index],
                      onAddToCart: () {
                        _animationController.forward(from: 0);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 