import 'package:flutter/material.dart';
import 'package:project_name_change/app/constants/app_constants.dart';
import 'package:project_name_change/ui/home/widgets/product_for_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(children: [ProductForList(AppConstants.baseProductList[0])]),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(co)
                },
                child: Icon(
                  Icons.add,
                  size: 80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
