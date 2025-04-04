import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_colors.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';
import 'package:project_name_change/ui/home/widgets/product_list.dart';
import 'package:project_name_change/ui/product_detail/product_detail_page.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';

class HomePage extends StatelessWidget {
  String title = '상품 리스트';
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Column(children: [ProductForList(AppConstants.productList[0])]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ProductList(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductRegisterPage(),
                  ));
                },
                child: Icon(
                  Icons.add,
                  size: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
