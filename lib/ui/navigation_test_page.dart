import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/model/cart_item.dart';
import 'package:project_name_change/ui/cart/cart_page.dart';
import 'package:project_name_change/ui/home/home_page.dart';
import 'package:project_name_change/ui/product_detail/product_detail_page.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';

class NavigationTestPage extends StatelessWidget {
  const NavigationTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Test Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductDetailPage(),
                    ),
                  );
                },
                child: const Text('아이템 상세 페이지', style: textStyle),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductRegisterPage(),
                    ),
                  );
                },
                child: const Text('아이템 등록 페이지', style: textStyle),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => CartPage(
                        cartItems:
                        AppConstants.productList
                            .map((product) => CartItem(product))
                            .toList(),
                      ),
                    ),
                  );
                },
                child: const Text('장바구니 페이지', style: textStyle),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
