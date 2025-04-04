import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/model/product.dart';
import 'package:project_name_change/ui/product_detail/product_detail_page.dart';
import 'package:project_name_change/util/util.dart';

class ProductForList extends StatelessWidget {
  Product product;

  ProductForList(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(),
            settings: RouteSettings(arguments: product),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Image.network(
                fit: BoxFit.cover,
                AppConstants.randomImageUrl+'300/300',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 100,
                // color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: productInformation(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column productInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: Text(product.name)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  product.description,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(style: TextStyle(fontSize: 10), formatKrw(product.price)),
        ),
      ],
    );
  }
}
