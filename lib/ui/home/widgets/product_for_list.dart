import 'package:flutter/material.dart';
import 'package:monggeul_market/app/constants/app_constants.dart';
import 'package:monggeul_market/model/product.dart';
import 'package:monggeul_market/ui/product_detail/product_detail_page.dart';
import 'package:monggeul_market/util/util.dart';

class ProductForList extends StatelessWidget {
  final Product product;

  const ProductForList(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(), settings: RouteSettings(arguments: product)));
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(fit: BoxFit.cover, '${AppConstants.randomImageUrl}seed/${product.imageSeed}/300/300')
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 100,
                // color: Colors.white,
                child: Padding(padding: const EdgeInsets.all(10.0), child: productInformation()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column productInformation({double nameFontSize = 15, double descriptionFontSize = 12, double priceFontSize = 14}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: Text(product.name, style: TextStyle(fontSize: nameFontSize))),
              SizedBox(height: 4),
              Align(alignment: Alignment.centerLeft, child: productDescription(descriptionFontSize)),
            ],
          ),
        ),
        Align(alignment: Alignment.bottomRight, child: Text(style: TextStyle(fontSize: priceFontSize), formatKrw(product.price))),
      ],
    );
  }

  Widget productDescription(double fontSize) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(style: TextStyle(color: Colors.black, fontSize: fontSize), text: product.description),
    );
  }
}
