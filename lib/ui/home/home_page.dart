import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monggeul_market/app/constants/app_colors.dart';
import 'package:monggeul_market/model/filter_element.dart';
import 'package:monggeul_market/provider/product_provider.dart';
import 'package:monggeul_market/ui/home/widgets/product_list_widget.dart';
import 'package:monggeul_market/ui/product_register/product_register_page.dart';
import 'package:monggeul_market/model/category.dart';

import '../../app/constants/app_colors.dart';
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
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(title),
        centerTitle: true,
        actions: [],
        //상단바 색상
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(254, 252, 248, 1),

        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductRegisterPage()));
          provider.filterProduct(filterElement);
        },
        child: Icon(Icons.add),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 252, 243, 231),
        width: 280,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 95, bottom: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [SizedBox(height: 3), Text('장바구니', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]),
                      SizedBox(width: 20),
                      Image.asset('assets/images/shopping_cart.png', width: 25, height: 25),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchBar(
                elevation: WidgetStatePropertyAll(0.5),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                hintText: '검색어를 입력하세요',
                backgroundColor: const WidgetStatePropertyAll(Color.fromRGBO(254, 252, 248, 1)),
                onChanged: (value) {
                  provider.filterProduct(filterElement.setWord(value));
                },
                controller: _textEditingController,
                leading: const Icon(Icons.search),
                trailing: [
                  Tooltip(
                    message: 'remove text',
                    child:
                        _textEditingController.text == ''
                            ? null
                            : IconButton(
                              onPressed: () {
                                _textEditingController.clear();
                                provider.filterProduct(filterElement.resetWord());
                              },
                              icon: Icon(Icons.highlight_remove),
                            ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (category != null) Container(margin: EdgeInsets.only(right: 10), child: Image.asset(category.imgPath, width: 30)),
            Text(category?.label ?? '전체 상품 보기', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
