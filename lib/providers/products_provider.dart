import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../data/products_data.dart';

enum SortOption {
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
}

class ProductsProvider with ChangeNotifier {
  String _searchQuery = '';
  SortOption _sortOption = SortOption.nameAsc;

  List<Product> get filteredAndSortedProducts {
    List<Product> filteredProducts = products.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    switch (_sortOption) {
      case SortOption.nameAsc:
        filteredProducts.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.nameDesc:
        filteredProducts.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortOption.priceAsc:
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceDesc:
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
    }

    return filteredProducts;
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSortOption(SortOption option) {
    _sortOption = option;
    notifyListeners();
  }
} 