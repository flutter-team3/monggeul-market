import 'package:flutter/material.dart';
import 'package:monggeul_market/model/product.dart';
import 'package:monggeul_market/provider/product_provider.dart';
import 'package:monggeul_market/ui/home/widgets/product_for_list.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ProductProvider.of(context).productListFiltered;
    return products.isNotEmpty ?
    ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductForList(products[index]);
      },
    ) : listIsEmpty(20);
  }

  Widget listIsEmpty(double fontSize) {
    return Center(child: Text(
    "상품이 없습니다",
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  ));
  }
}
