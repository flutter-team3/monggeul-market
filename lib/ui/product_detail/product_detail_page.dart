import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../../util/util.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

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
              'https://picsum.photos/300/200', // 추후 이미지 로드 방식 변경에 따라 수정
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
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('-,+ 수량변경 버튼'), // 버튼 위젯으로 변경 예정
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
                          onPressed: () {},
                          child: Text('장바구니 담기'),
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
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
