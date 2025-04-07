import 'package:flutter/material.dart';

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({super.key});

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
            '0원',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ],
      ),
    );
  }
}
