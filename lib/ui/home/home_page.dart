import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_colors.dart';
import 'package:project_name_change/model/product.dart';
import 'package:project_name_change/provider/product_provider.dart';
import 'package:project_name_change/ui/home/widgets/product_list_widget.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';
import 'package:project_name_change/model/category.dart';

import '../cart/cart_page.dart';

class HomePage extends StatelessWidget {
  String title = '상품 리스트';

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        // backgroundColor: AppColors.primary,
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductRegisterPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 95, horizontal: 65),
              child: Row(
                children: [
                  GestureDetector(
                    child: Text(
                      '장바구니',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/shopping_cart.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(),
                    categoryButton(null, context),
                    Divider(),
                    categoryButton(Category.hedgehog, context),
                    Divider(),
                    categoryButton(Category.lizard, context),
                    Divider(),
                    categoryButton(Category.parrot, context),
                    Divider(),
                    categoryButton(Category.raccoon, context),
                    Divider(),
                    categoryButton(Category.stagBeetle, context),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ProductListWidget(),
        ),
      ),
    );
  }

  Widget categoryButton(Category? category, BuildContext context) {
    final provider = ProductProvider.of(context);
    return GestureDetector(
      onTap: () {
        title = category == null ? '상품 리스트' : category.label;
        Navigator.of(context).pop();
        provider.filterProduct(category);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (category != null)
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(category!.imgPath, width: 30),
              ),
            Text(
              category?.label ?? '전체',
              style: TextStyle(fontSize: category?.label == null ? 18 : 15),
            ),
          ],
        ),
      ),
    );
  }
}
