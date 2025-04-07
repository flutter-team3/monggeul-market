import 'package:flutter/material.dart';
import 'package:project_name_change/model/product.dart';
import 'package:project_name_change/provider/product_provider.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ProductProvider.of(context).productListFiltered;
    return ListView.separated(
      separatorBuilder: (context, int index) => const Divider(),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductForList(products[index]);
      },
    );
  }
}
