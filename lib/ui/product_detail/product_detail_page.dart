import 'package:flutter/material.dart';
import 'package:project_name_change/provider/cart_provider.dart';
import '../../app/constants/app_constants.dart';
import '../../model/product.dart';
import '../../util/util.dart';
import '../../widgets/cart_item_amount.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text('제품 상세')),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.network(
              '${AppConstants.randomImageUrl}seed/${product.imageSeed}/300/200',
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text((product.name), style: TextStyle(fontSize: 24)),
                Expanded(child: SizedBox()),
                Text(
                  formatKrw(product.price),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Text(product.description, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CartItemAmount(
                          amount: amount,
                          onPlusIconTap: () {
                            setState(() {
                              amount++;
                            });
                          },
                          onMinusIconTap: () {
                            amount > 1
                                ? setState(() {
                                  amount--;
                                })
                                : {};
                          },
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: Text(
                          formatKrw(product.price),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showAppCupertinoDialog(
                              context: context,
                              title: '성공',
                              content: "${product.name} $amount개를 장바구니에 담겼습니다.",
                            );
                            CartProvider.of(
                              context,
                            ).addProductToCart(product, amount);
                          },
                          child: Text('장바구니 담기'),
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showAppCupertinoDialog(
                              showCancel: true,
                              context: context,
                              title: '구매 확인',
                              content: '${product.name} $amount개 구매하시겠습니까?',
                            );
                          },
                          child: Text('구매하기'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
