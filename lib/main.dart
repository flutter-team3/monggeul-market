import 'package:flutter/material.dart';
import 'package:project_name_change/provider/product_provider.dart';
import 'package:project_name_change/ui/home/home_page.dart';
import 'app/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductProviderWrapper(
      child: MaterialApp(
        title: '몽글마켓',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.buildTheme(),
        home: HomePage(),
      ),
    );
  }
}
