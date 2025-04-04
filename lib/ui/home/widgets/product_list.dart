import 'package:flutter/material.dart';
import 'package:project_name_change/provider/product_provider.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = ProductProvider.of(context).productList;
    return ListView.separated(
      separatorBuilder: (context, int index) => const Divider(),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        // return ProductForList(AppConstants.productList[index]);
        return ProductForList(productList[index]);
      },
    );
  }
}
