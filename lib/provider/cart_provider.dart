import 'package:flutter/material.dart';
import 'package:monggeul_market/model/cart_item.dart';
import 'package:monggeul_market/model/product.dart';

class CartProvider extends InheritedWidget {
  /// 장바구니 상품 목록
  final List<CartItem> cartItems;

  /// 장바구니 총 금액
  final int totalPrice;

  /// 장바구니에 상품 추가, 이미 있으면 상품 개수 증가
  final void Function(Product, int) addProductToCart;

  /// 장바구니에서 특정 인덱스 상품 삭제
  final void Function(int) removeCartItem;

  /// 장바구니 특정 인덱스 상품의 수량을 1개 증가
  final void Function(int) increaseCartItemAmount;

  /// 장바구니 특정 인덱스 상품의 수량을 1개 감소
  final void Function(int) decreaseCartItemAmount;

  const CartProvider({
    super.key,
    required super.child,
    required this.cartItems,
    required this.totalPrice,
    required this.addProductToCart,
    required this.removeCartItem,
    required this.increaseCartItemAmount,
    required this.decreaseCartItemAmount,
  });

  @override
  /// cartItems 개수나 totalPrice가 바뀌면 리빌드 (UI가 그 값에 의존하니까)
  bool updateShouldNotify(covariant CartProvider oldWidget) {
    return oldWidget.cartItems.length != cartItems.length || oldWidget.totalPrice != totalPrice;
  }

  static CartProvider of(BuildContext context) {
    final CartProvider? result = context.dependOnInheritedWidgetOfExactType<CartProvider>();

    assert(result != null, 'No CartProvider found in context');
    return result!;
  }
}

class CartProviderWrapper extends StatefulWidget {
  final Widget child;

  const CartProviderWrapper({super.key, required this.child});

  @override
  State<CartProviderWrapper> createState() => _CartProviderWrapperState();
}

class _CartProviderWrapperState extends State<CartProviderWrapper> {
  final List<CartItem> _cartItems = [];
  int _totalPrice = 0;

  /// 장바구니에 상품 추가, 이미 있으면 수량 추가
  void addProductToCart(Product product, int additional) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product == product);

    if (index != -1) {
      setState(() {
        _totalPrice += product.price * additional;
        _cartItems[index].addAdditional(additional);
      });
    } else {
      setState(() {
        setState(() {
          _totalPrice += product.price * additional;
          _cartItems.add(CartItem(product, amount: additional));
        });
      });
    }
  }

  /// 장바구니에서 특정 인덱스 상품 삭제
  void removeCartItem(int cartItemIndex) {
    setState(() {
      _totalPrice -= _cartItems[cartItemIndex].product.price * _cartItems[cartItemIndex].amount;
      _cartItems.removeAt(cartItemIndex);
    });
  }

  /// 장바구니 특정 인덱스 상품의 수량을 1개 증가
  void increaseCartItemAmount(int cartItemIndex) {
    setState(() {
      _totalPrice += _cartItems[cartItemIndex].product.price;
      _cartItems[cartItemIndex].addOne();
    });
  }

  /// 장바구니 특정 인덱스 상품의 수량을 1개 감소
  void decreaseCartItemAmount(int cartItemIndex) {
    if (_cartItems[cartItemIndex].amount > 1) {
      setState(() {
        _totalPrice -= _cartItems[cartItemIndex].product.price;
        _cartItems[cartItemIndex].removeOne();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CartProvider(
      cartItems: _cartItems,
      totalPrice: _totalPrice,
      addProductToCart: addProductToCart,
      removeCartItem: removeCartItem,
      increaseCartItemAmount: increaseCartItemAmount,
      decreaseCartItemAmount: decreaseCartItemAmount,
      child: widget.child,
    );
  }
}
