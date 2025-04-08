import 'package:flutter/material.dart';
import 'package:monggeul_market/app/constants/app_styles.dart';

import '../../../model/cart_item.dart';
import '../../../util/util.dart';

class CartItemTexts extends StatelessWidget {
  final CartItem cartItem;

  const CartItemTexts(this.cartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cartItem.product.name, style: AppStyles.productName),
          SizedBox(height: 2),
          Text('카테고리: ${cartItem.product.category.label}', style: AppStyles.productCategoryLabel),
          SizedBox(height: 4),
          Text(formatKrw(cartItem.product.price), style: AppStyles.productPrice),
        ],
      ),
    );
  }
}
