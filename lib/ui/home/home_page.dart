import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_colors.dart';
import 'package:project_name_change/ui/home/widgets/product_list.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';

import '../cart/cart_page.dart';

class HomePage extends StatelessWidget {
  final String title = '상품 리스트';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductRegisterPage(),
            ),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            CartPage()),
                      );
                    },
                  ),
                  Spacer(),
                  Text('찜리스트'),
                ],
              ),
            ),
            Column(
              children: [
                Divider(),
                categoryButton('도마뱀'),
                Divider(),
                categoryButton('고슴도치'),
                Divider(),
                categoryButton('사슴벌레'),
                Divider(),
                categoryButton('앵무새'),
                Divider(),
                categoryButton('라쿤'),
                Divider(),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ProductList(),
        ),
      ),
    );
  }

  Widget categoryButton(String text) {
    return Container(margin: EdgeInsets.all(25), child: Text(text));
  }
}
