import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/model/cart_item.dart';
import 'package:project_name_change/ui/cart/widgets/cart_item_texts.dart';
import 'package:project_name_change/ui/cart/widgets/total_price_row.dart';
import 'package:project_name_change/widgets/cart_item_amount.dart';

import '../../app/constants/app_colors.dart';

const double imageDimension = 80;

class CartPage extends StatelessWidget {
  List<CartItem> cartItems;

  CartPage({required this.cartItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('장바구니', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColors.lightBlue,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  itemCount: cartItems.length + 1,
                  itemBuilder: (context, index) {
                    if (index == cartItems.length) {
                      return TotalPriceRow();
                    }
                    final cartItem = cartItems[index];
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 15 : 0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              '${AppConstants.randomImageUrl}seed/${cartItem.product.imageSeed}/${imageDimension.toStringAsFixed(0)}/${imageDimension.toStringAsFixed(0)}',
                              width: imageDimension,
                              height: imageDimension,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(child: CartItemTexts(cartItem)),
                          SizedBox(
                            height: imageDimension, width: 80,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0, right: 5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.delete, color: AppColors.plusMinusIcon,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0, right: 0,
                                  child: CartItemAmount(cartItems[index].amount),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '구매하기',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
