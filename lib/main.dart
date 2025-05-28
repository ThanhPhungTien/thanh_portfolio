import 'package:flutter/material.dart';
import 'package:thanh_portfolio/presentation/core/palette.dart';
import 'package:thanh_portfolio/presentation/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final brightnessListenable = ValueNotifier(Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: brightnessListenable,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Palette.primary,
              brightness: value,
            ),
          ),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
