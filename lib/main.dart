import 'package:flutter/material.dart';
import 'package:sneaker_shop/global_variables.dart';
import 'package:sneaker_shop/home_page.dart';
import 'package:sneaker_shop/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 247, 124, 23),
          primary: const Color.fromARGB(255, 247, 124, 23),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromARGB(255, 107, 106, 106),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Sneaker Shop',
      home: ProductDetailsPage(
        product: products[0],
      ),
    );
  }
}
