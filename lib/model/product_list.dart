import 'package:flutter/foundation.dart';
import 'package:project_name_change/model/product.dart';

class ProductList {
  List<Product> products;
  ProductList(this.products);
  List<Product> filterByCategory(Category category){
    return products.where((product) => product.category == category).toList();
  }
}