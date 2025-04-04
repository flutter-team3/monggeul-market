import 'package:flutter/material.dart';

class ProductRegisterPage extends StatelessWidget {
  const ProductRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TITLE"), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(aspectRatio: 16 / 9, child: Container(width: double.infinity, color: Colors.grey, child: Center(child: Text('이미지')))),
            Row(children: [Text("상품 이름"), Expanded(child: TextField())]),
            Row(children: [Text("상품 가격"), Expanded(child: TextField())]),

            Text("상품 설명"),
            Expanded(child: TextField()),
            GestureDetector(
              child: Container(color: Colors.grey, height: 70, width: double.infinity, child: Center(child: Text("등록하기"))),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
