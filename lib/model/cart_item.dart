import 'package:monggeul_market/model/product.dart';

class CartItem {
  final Product product;
  int _amount;
  int get amount => _amount;

  CartItem(this.product, {required amount}) : _amount = amount;

  /// Adds one product to the CartItem.
  void addOne() {
    _amount++;
  }

  void addAdditional(int additional) {
    _amount += additional;
  }

  // 나중에 검증 추가하기 (개수가 0보다 작으면 예의 throw)
  void removeOne() {
    _amount--;
  }
}
