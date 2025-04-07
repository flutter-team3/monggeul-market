import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/model/cart_item.dart';
import 'package:project_name_change/provider/cart_provider.dart';
import 'package:project_name_change/ui/cart/widgets/cart_item_texts.dart';
import 'package:project_name_change/ui/cart/widgets/total_price_row.dart';
import 'package:project_name_change/util/util.dart';
import 'package:project_name_change/widgets/cart_item_amount.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/constants/app_colors.dart';
import '../../widgets/app_cached_image.dart';
import '../product_detail/product_detail_page.dart';

const double imageDimension = 80;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = CartProvider.of(context).cartItems;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '장바구니',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child:
            cartItems.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animations/empty_cart_lottie.json',
                        width: 240,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '장바구니가 비어있습니다',
                        style: TextStyle(
                          fontSize: 21,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.separated(
                          itemCount: cartItems.length + 1,
                          itemBuilder: (context, index) {
                            if (index == cartItems.length) {
                              return TotalPriceRow(
                                CartProvider.of(context).totalPrice,
                              );
                            }
                            final cartItem = cartItems[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 15 : 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailPage(),
                                      settings: RouteSettings(
                                        arguments: cartItem.product,
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: AppCachedImage(
                                        imageUrl:
                                            '${AppConstants.randomImageUrl}seed/${cartItem.product.imageSeed}/${imageDimension.toStringAsFixed(0)}/${imageDimension.toStringAsFixed(0)}',
                                        width: imageDimension,
                                        height: imageDimension,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(child: CartItemTexts(cartItem)),
                                    SizedBox(
                                      height: imageDimension,
                                      width: 90,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            top: 0,
                                            right: 5,
                                            child: InkWell(
                                              onTap:
                                                  () => CartProvider.of(
                                                    context,
                                                  ).removeCartItem(index),
                                              child: Icon(
                                                Icons.delete,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: CartItemAmount(
                                              amount: cartItems[index].amount,
                                              onPlusIconTap:
                                                  () => CartProvider.of(
                                                    context,
                                                  ).increaseCartItemAmount(
                                                    index,
                                                  ),
                                              onMinusIconTap:
                                                  () => CartProvider.of(
                                                    context,
                                                  ).decreaseCartItemAmount(
                                                    index,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder:
                              (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 17),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () async {
                        if (CartProvider.of(context).totalPrice > 0) {
                          final String? result = await showAppCupertinoDialog(
                            context: context,
                            title: '네이버 쇼핑으로 이동할까요?',
                            content:
                                '현재 구매 기능은 아직 준비 중입니다. 네이버 쇼핑에서 비슷한 상품을 찾아보시겠어요?',
                            showCancel: true,
                          );
                          if (result == '확인') {
                            String searchQuery = cartItems
                                .sublist(0, min(3, cartItems.length))
                                .map(
                                  (cartItem) =>
                                      '${cartItem.product.category.label}%20용품',
                                )
                                .join('%20');
                            final url = Uri.parse(
                              'https://search.shopping.naver.com/ns/search?query=$searchQuery',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          }
                        }
                      },
                      child: Text(
                        '구매하기',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
