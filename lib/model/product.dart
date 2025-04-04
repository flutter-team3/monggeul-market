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
    // this.imageUrl,
  });
}
