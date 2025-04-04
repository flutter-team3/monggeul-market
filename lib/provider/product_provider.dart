import 'package:flutter/material.dart';
import 'package:project_name_change/model/product.dart';

class ProductProvider extends InheritedWidget {
  final List<Product> productList;
  final Function(Product) addProduct;

  const ProductProvider({super.key, required super.child, required this.productList, required this.addProduct});

  @override
  bool updateShouldNotify(covariant ProductProvider oldWidget) {
    return oldWidget.productList != productList;
  }

  static ProductProvider of(BuildContext context) {
    final ProductProvider? result = context.dependOnInheritedWidgetOfExactType<ProductProvider>();

    assert(result != null, 'No ProductProvider found in context');
    return result!;
  }
}
