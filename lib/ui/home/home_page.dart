import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';
import 'package:project_name_change/ui/product_detail/product_detail_page.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      endDrawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 95, horizontal: 65),
              child: Row(
                children: [
                  Text('장바구니', style: TextStyle(fontWeight: FontWeight.bold)),
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
        child: Stack(
          children: [
            Column(children: [ProductForList(AppConstants.productList[0])]),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductRegisterPage(),
                    ),
                  );
                },
                child: Icon(Icons.add, size: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String text) {
    return Container(margin: EdgeInsets.all(25), child: Text(text));
  }
}
