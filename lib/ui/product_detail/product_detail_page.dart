import 'package:flutter/material.dart';
import 'package:monggeul_market/app/constants/app_colors.dart';
import 'package:monggeul_market/provider/cart_provider.dart';
import 'package:monggeul_market/widgets/app_cached_image.dart';
import '../../app/constants/app_constants.dart';
import '../../model/product.dart';
import '../../util/util.dart';
import '../../widgets/cart_item_amount.dart';
import '../cart/cart_page.dart';

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
            child: AppCachedImage(imageUrl: '${AppConstants.randomImageUrl}seed/${product.imageSeed}/300/200', fit: BoxFit.cover),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text((product.name), style: TextStyle(fontSize: 24)),
                Expanded(child: SizedBox()),
                Text(formatKrw(product.price), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(children: [Text(product.description, style: TextStyle(fontSize: 16))]),
            ),
          ),
          Material(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: SizedBox()),
                              CartItemAmount(
                                amount: amount,
                                onPlusIconTap: () {
                                  amount < 99
                                      ? setState(() {
                                        amount++;
                                      })
                                      : {};
                                },
                                onMinusIconTap: () {
                                  amount > 1
                                      ? setState(() {
                                        amount--;
                                      })
                                      : {};
                                },
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
                        Expanded(
                          child: Text(
                            formatKrw(product.price),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                              showAppCupertinoDialog(context: context, title: '성공', content: "${product.name} $amount개를 장바구니에 담았습니다.");
                              CartProvider.of(context).addProductToCart(product, amount);
                            },
                            child: Text('장바구니 담기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(width: 25),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final String? result = await showAppCupertinoDialog(
                                showCancel: true,
                                context: context,
                                title: '구매 확인',
                                content: '${product.name} $amount개 구매하시겠습니까? 장바구니로 이동합니다.',
                              );
                              if (!context.mounted) {
                                return;
                              } // await 후에 context 안전한 사용
                              if (result == '확인') {
                                CartProvider.of(context).addProductToCart(product, amount);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                              }
                            },

                            child: Text('구매하기', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
