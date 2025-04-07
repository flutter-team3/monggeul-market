import 'package:flutter/material.dart';

import '../app/constants/app_colors.dart';

class CartItemAmount extends StatelessWidget {
  final int amount;
  final void Function() onPlusIconTap;
  final void Function() onMinusIconTap;

  const CartItemAmount({
    required this.amount,
    required this.onPlusIconTap,
    required this.onMinusIconTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSpace = 3;
    return Row(
      children: [
        getPlusMinusIcon(isPlusIcon: false),
        SizedBox(width: iconSpace),
        Text(
          amount.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: iconSpace),
        getPlusMinusIcon(isPlusIcon: true),
      ],
    );
  }

  Widget getPlusMinusIcon({required bool isPlusIcon}) {
    IconData iconData =
        isPlusIcon ? Icons.add_circle_outline : Icons.remove_circle_outline;
    return InkWell(
      onTap: () {
        if (isPlusIcon) {
          onPlusIconTap();
        } else {
          onMinusIconTap();
        }
      },
      child: Icon(iconData, size: 29, color: AppColors.primary),
    );
  }
}
