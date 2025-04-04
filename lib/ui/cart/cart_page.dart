import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/model/cart_item.dart';
import 'package:project_name_change/widgets/cart_item_amount.dart';
import 'package:project_name_change/util/util.dart';

import '../../app/constants/app_colors.dart';

const double imageDimension = 80;

class CartPage extends StatelessWidget {
  List<CartItem> cartItems;

  CartPage({required this.cartItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cartBackground,
      appBar: AppBar(
        title: Text('장바구니', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColors.cartBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView.separated(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    '${AppConstants.randomImageUrl}seed/${cartItem.product.imageSeed}/${imageDimension.
                    toStringAsFixed(0)}/${imageDimension.toStringAsFixed(0)}',
                    width: imageDimension,
                    height: imageDimension,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: imageDimension,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '카테고리: ${cartItem.product.category.label}',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 4),
                          Text(
                            formatKrw(cartItem.product.price),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: imageDimension,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [CartItemAmount(cartItem.amount)],
                  ),
                ),
              ],
            );
          },
          separatorBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: Colors.grey, height: 1, thickness: 1),
              ),
        ),
      ),
    );
  }
}
