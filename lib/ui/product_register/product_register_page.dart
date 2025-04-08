import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monggeul_market/app/constants/app_colors.dart';
import 'package:monggeul_market/app/constants/app_constants.dart';
import 'package:monggeul_market/model/category.dart';
import 'package:monggeul_market/model/product.dart';
import 'package:monggeul_market/provider/product_provider.dart';
import 'package:monggeul_market/util/util.dart';
import 'package:monggeul_market/widgets/app_cached_image.dart';

class ProductRegisterPage extends StatefulWidget {
  const ProductRegisterPage({super.key});

  @override
  State<ProductRegisterPage> createState() => _ProductRegisterPageState();
}

class _ProductRegisterPageState extends State<ProductRegisterPage> {
  //image 추가 예정
  String? name;
  String? description;
  int? price;
  Category? category;
  final int randomSeed = Random().nextInt(100) + 1; // 생성자 시점에 고정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상품 등록"), centerTitle: true),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: AppCachedImage(imageUrl: "${AppConstants.randomImageUrl}/seed/${randomSeed}300/300", fit: BoxFit.fitWidth),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("카테고리", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 40, // 칩 높이 설정
                            child: ListView(
                              scrollDirection: Axis.horizontal, // 가로 스크롤
                              children:
                                  Category.values.map((value) {
                                    bool isSelected = category == value;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            category = isSelected ? null : value;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

                                          decoration: BoxDecoration(
                                            color: isSelected ? AppColors.primary : Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: isSelected ? AppColors.primary : Colors.grey),
                                          ),
                                          child: Text(
                                            value.label,
                                            style: TextStyle(
                                              color: isSelected ? Colors.white : Colors.black,
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("상품 이름", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "상품 이름",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("상품 가격", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextField(
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 숫자만 입력
                            onChanged: (value) {
                              setState(() {
                                price = int.parse(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "상품 가격",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("상품 설명", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                description = value;
                              });
                            },
                            maxLines: 5,
                            minLines: 5,
                            decoration: InputDecoration(
                              hintText: "상품 설명",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              child: Container(
                color: areAllFieldsFilled(name, price, description, category) ? AppColors.primary : Colors.grey[300],
                height: 70,
                width: double.infinity,
                child: Center(
                  child: Text("등록하기", style: TextStyle(color: areAllFieldsFilled(name, price, description, category) ? Colors.white : Colors.black)),
                ),
              ),
              onTap: () async {
                if (areAllFieldsFilled(name, price, description, category)) {
                  _addList(context);

                  String? result = await showAppCupertinoDialog(context: context, title: '성공', content: "상품 등록이 완료되었습니다.");
                  if (result == '확인') {
                    Navigator.pop(context); // ✅ 이제 안전
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addList(BuildContext context) {
    final provider = ProductProvider.of(context);
    provider.addProduct(Product(name: name!, price: price!, description: description!, category: category!));
  }

  bool areAllFieldsFilled(String? name, int? price, String? description, Category? category) {
    if (name == null || price == null || description == null || name.isEmpty || description.isEmpty || category == null) {
      return false; // 하나라도 비어 있으면 false 반환
    }
    return true; // 모두 입력되었으면 true 반환
  }
}
