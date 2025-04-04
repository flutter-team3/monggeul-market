import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
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

class ProductProviderWrapper extends StatefulWidget {
  final Widget child;

  const ProductProviderWrapper({super.key, required this.child});

  @override
  _ProductProviderWrapperState createState() => _ProductProviderWrapperState();
}

class _ProductProviderWrapperState extends State<ProductProviderWrapper> {
  List<Product> _products = AppConstants.productList;

  //상품 추가
  void addProduct(Product product) {
    setState(() {
      _products = [..._products, product];
    });
  }

  //기능 추가시 함수 작성 및 생성자에 매개변수 추가

  @override
  Widget build(BuildContext context) {
    return ProductProvider(productList: _products, addProduct: addProduct, child: widget.child);
  }
}
