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

  void removeOne() {
    _amount--;
  }

  void addAdditional(int additional) {
    _amount += additional;
  }
}
