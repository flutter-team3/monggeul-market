import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('제품 상세')),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.network(
              'https://picsum.photos/300/200',
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text('상품 이름', style: TextStyle(fontSize: 24)),
                Expanded(child: SizedBox()),
                Text(
                  '16,000 원',
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
                  Text('이 제품은 사슴벌레 젤리입니다.', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 120,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text('-, + 수량변경 버튼'),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        child: Text(
                          '16,000원',
                          style: TextStyle(
                            fontSize: 22,
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
