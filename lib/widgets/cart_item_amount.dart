import 'package:flutter/material.dart';

import '../app/constants/app_colors.dart';

class CartItemAmount extends StatelessWidget {
  final int amount;

  const CartItemAmount(this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getPlusMinusIcon(Icons.remove_circle_outline),
        SizedBox(width: 3),
        Text(
          amount.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 3),
        getPlusMinusIcon(Icons.add_circle_outline),
      ],
    );
  }

  Widget getPlusMinusIcon(IconData iconData) {
    return InkWell(
      onTap: () {
        // onTap();  // 나중에 로직 구현하기.
      },
      child: Icon(iconData, size: 29, color: AppColors.plusMinusIcon),
    );
  }
}
