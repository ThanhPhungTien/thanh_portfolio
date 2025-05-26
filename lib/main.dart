import 'package:flutter/material.dart';
import 'package:thanh_portfolio/presentation/core/palette.dart';
import 'package:thanh_portfolio/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.primary,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}
