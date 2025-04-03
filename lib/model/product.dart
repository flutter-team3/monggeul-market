import 'package:project_name_change/app/constants/app_constants.dart';

import 'category.dart';

class Product {
  final String name;
  final String description;
  final int price;
  String? imageUrl;
  final Category category;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.imageUrl,
  });

  static List<Product> generateProductList() {  // Product.generateProductList() 로 호출. 나중에 다른 파일로 옮기기
    final List<Product> productList = [];

    for (int i = 0; i < AppConstants.baseProductList.length; i++) {
      final baseProduct = AppConstants.baseProductList[i];

      productList.add(Product(
        name: baseProduct.name,
        description: baseProduct.description,
        price: baseProduct.price,
        category: baseProduct.category,
        imageUrl: 'https://picsum.photos/200/300?random=${i + 1}',
      ));
    }
    return productList;
  }
}
