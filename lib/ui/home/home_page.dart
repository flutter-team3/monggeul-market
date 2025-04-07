import 'package:flutter/material.dart';
import 'package:monggeul_market/app/constants/app_colors.dart';
import 'package:monggeul_market/model/filter_element.dart';
import 'package:monggeul_market/model/product.dart';
import 'package:monggeul_market/provider/product_provider.dart';
import 'package:monggeul_market/ui/home/widgets/product_list_widget.dart';
import 'package:monggeul_market/ui/product_register/product_register_page.dart';
import 'package:monggeul_market/model/category.dart';

import '../cart/cart_page.dart';

class HomePage extends StatelessWidget {
  String title = '상품 리스트';
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
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductRegisterPage()));
          provider.filterProduct(filterElement);
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
                elevation: WidgetStatePropertyAll(0.5),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )),
                hintText: '검색어를 입력하세요',
                onChanged: (value) {
                  provider.filterProduct(filterElement.setWord(value));
                },
                controller: _textEditingController,
                leading: const Icon(Icons.search),
                trailing: [
                  Tooltip(
                    message: 'remove text',
                    child: _textEditingController.text == '' ? null : IconButton(onPressed: () {
                      _textEditingController.clear();
                      provider.filterProduct(filterElement.resetWord());
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
        title = category == null ? '상품 리스트' : category.label;
        Navigator.of(context).pop();
        _textEditingController.clear();
        provider.filterProduct(filterElement.changeCategory(category));
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (category != null) Container(margin: EdgeInsets.only(right: 10), child: Image.asset(category.imgPath, width: 30)),
            Text(category?.label ?? '전체'),
          ],
        ),
      ),
    );
  }
}
