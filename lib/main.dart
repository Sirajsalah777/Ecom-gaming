import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/cart_provider.dart';
import 'screens/home_screen.dart';
import 'providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Shop Gaming',
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
} 