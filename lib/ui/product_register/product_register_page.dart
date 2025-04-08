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

  final int randomSeed = Random().nextInt(100) + 1;
  String? name;
  String? description;
  int? price;
  Category? category;

  // form 상태 확인을 위한 GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: const Text("상품 등록", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("카테고리", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 40, // 칩 높이 설정
                              child: ListView(
                                scrollDirection: Axis.horizontal,
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
                      // 상품 이름 필드
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("상품 이름", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              maxLength: 20,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "상품 이름",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '상품 이름을 입력해주세요.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              onSaved: (value) {
                                name = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      // 상품 가격 필드
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("상품 가격", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              maxLength: 10,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "상품 가격",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '상품 가격을 입력해주세요.';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  price = int.tryParse(value.trim());
                                });
                              },
                              onSaved: (value) {
                                price = int.tryParse(value!.trim());
                              },
                            ),
                          ],
                        ),
                      ),
                      // 상품 설명 필드
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("상품 설명", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              maxLength: 500,
                              maxLines: 5,
                              minLines: 5,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "상품 설명",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return '상품 설명을 입력해주세요.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  description = value;
                                });
                              },
                              onSaved: (value) {
                                description = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    if (category == null) {
                      await showAppCupertinoDialog(context: context, title: '실패', content: "카테고리를 선택해주세요.");
                      return;
                    }
                    _addList(context);
                    String? result = await showAppCupertinoDialog(context: context, title: '성공', content: "상품 등록이 완료되었습니다.");
                    if (result == '확인') {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Container(
                  color: areAllFieldsFilled(name, price, description, category) ? AppColors.primary : Colors.grey[300],
                  height: 70,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "등록하기",
                      style: TextStyle(color: areAllFieldsFilled(name, price, description, category) ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addList(BuildContext context) {
    final provider = ProductProvider.of(context);
    provider.addProduct(Product(name: name!, price: price!, description: description!, category: category!));
  }

  bool areAllFieldsFilled(String? name, int? price, String? description, Category? category) {
    return (name != null && name.trim().isNotEmpty) &&
        (price != null) &&
        (description != null && description.trim().isNotEmpty) &&
        (category != null);
  }
}
