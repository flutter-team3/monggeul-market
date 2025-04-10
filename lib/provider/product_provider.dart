import 'package:flutter/material.dart';
import 'package:monggeul_market/app/constants/app_constants.dart';
import 'package:monggeul_market/model/filter_element.dart';
import 'package:monggeul_market/model/product.dart';

class ProductProvider extends InheritedWidget {
  final List<Product> productList;
  final List<Product> productListFiltered;
  final void Function(Product) addProduct;
  final void Function(FilterElement) filterProduct;

  const ProductProvider({
    super.key,
    required super.child,
    required this.productList,
    required this.addProduct,
    required this.filterProduct,
    required this.productListFiltered,
  });

  @override
  bool updateShouldNotify(covariant ProductProvider oldWidget) {
    return oldWidget.productList != productList || oldWidget.productListFiltered != productListFiltered;
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
  State<ProductProviderWrapper> createState() => _ProductProviderWrapperState();
}

class _ProductProviderWrapperState extends State<ProductProviderWrapper> {
  List<Product> _products = AppConstants.productList;
  List<Product> _productsfiltered = AppConstants.productList;

  //상품 추가
  void addProduct(Product product) {
    setState(() {
      _products = [..._products, product];
    });
  }

  void filterProduct(FilterElement filterElement){
    setState(() {
      if(filterElement.category == null){
        _productsfiltered = _products.where((product) => product.name.contains(filterElement.word))
        .toList();
      }
      else{
        _productsfiltered = _products
        .where((product) => product.category == filterElement.category)
        .where((product) => product.name.contains(filterElement.word))
        .toList();
      }
    });
  }

  //기능 추가시 함수 작성 및 생성자에 매개변수 추가

  @override
  Widget build(BuildContext context) {
    return ProductProvider(
      productList: _products,
      addProduct: addProduct,
      filterProduct: filterProduct,
      productListFiltered: _productsfiltered,
      child: widget.child,
    );
  }
}
