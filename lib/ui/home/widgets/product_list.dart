import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,int index) => const Divider(),
      itemCount : AppConstants.productList.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductForList(AppConstants.productList[index]);
      },
    );
  }
}