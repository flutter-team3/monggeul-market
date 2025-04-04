import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_name_change/model/product.dart';

class ProductForList extends StatelessWidget {
  Product product;
  
  ProductForList(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(width: 80, height: 80, color: Colors.amber),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.blueGrey,
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
                child: Text(product.description),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(product.price.toString()),
        ),
      ],
    );
  }
}
