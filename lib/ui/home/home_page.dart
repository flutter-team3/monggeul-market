import 'package:flutter/material.dart';
import 'package:project_name_change/ui/home/widgets/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Product(),
          ]
        ),
      ),
    );
  }
}