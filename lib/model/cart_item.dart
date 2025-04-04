import 'package:project_name_change/model/product.dart';

class CartItem {
  final Product product;
  int _amount = 1;
  int get amount => _amount;

  CartItem(this.product);

  /// Adds one product to the CartItem.
  void addOne() {
    _amount++;
  }

  // 나중에 검증 추가하기 (개수가 0보다 작으면 예의 throw)
  void removeOne() {
    _amount--;
  }
}