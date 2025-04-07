import 'package:flutter/material.dart';
import 'package:project_name_change/util/util.dart';

class TotalPriceRow extends StatelessWidget {
  final int totalPrice;

  const TotalPriceRow(this.totalPrice, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20, bottom: 45, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '총 결제 금액',
            style: TextStyle(
              fontSize: 21,
              // fontWeight: FontWeight.w600,
              color: Colors.grey[900],
            ),
          ),
          Text(
            formatKrw(totalPrice),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ],
      ),
    );
  }
}
