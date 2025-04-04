import 'package:project_name_change/model/product.dart';

class CartItem {
  final Product product;
  int _amount = 1;
  int get amount => _amount;

  CartItem({required this.product});

  void addOne() {
    _amount++;
  }

  void removeOne() {
    _amount--;
  }
}