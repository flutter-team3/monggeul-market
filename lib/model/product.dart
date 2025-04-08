import 'category.dart';

class Product {
  final String name;
  final String description;
  final int price;
  late int imageSeed;
  final Category category;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
  }) {
    imageSeed = name.codeUnits.fold(0, (sum, char) => sum + char) % 1000;
  }
}
