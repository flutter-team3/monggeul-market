import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_colors.dart';
import 'package:project_name_change/model/filter_element.dart';
import 'package:project_name_change/model/product.dart';
import 'package:project_name_change/provider/product_provider.dart';
import 'package:project_name_change/ui/home/widgets/product_list_widget.dart';
import 'package:project_name_change/ui/product_register/product_register_page.dart';
import 'package:project_name_change/model/category.dart';

import '../cart/cart_page.dart';

class HomePage extends StatelessWidget {
  String title = '상품 리스트';
  late List<Product> products;
  final TextEditingController _textEditingController = TextEditingController();
  final FilterElement filterElement = FilterElement('', null);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ProductProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductRegisterPage()));
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
                    child: Text('장바구니', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                    },
                  ),
                  Spacer(),
                  Text('찜리스트'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
          child: Column(
            children: [
              SearchBar(
                onChanged: (value) {
                  filterElement.word = value;
                  provider.filterProduct(filterElement);
                },
                controller: _textEditingController,
                leading: const Icon(Icons.search),
                trailing: [
                  Tooltip(
                    message: 'hi',
                    child: IconButton(onPressed: () {
                      _textEditingController.clear();
                      filterElement.word = '';
                      provider.filterProduct(filterElement);
                    }, icon: Icon(Icons.highlight_remove)),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Expanded(child: ProductListWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryButton(Category? category, BuildContext context) {
    final provider = ProductProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        _textEditingController.clear();
        filterElement.word = '';
        filterElement.category = category;
        provider.filterProduct(filterElement);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.amber,
        margin: EdgeInsets.all(25), 
        child: Text(category?.label ?? '전체')
      ));
  }
}
