import 'package:flutter/material.dart';
import 'package:football_news_mobile/screens/menu.dart';

void main() {
  runApp(const FootballNewsApp());
}

class FootballNewsApp extends StatelessWidget {
  const FootballNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football News',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.indigo,
          ).copyWith(
          secondary: Colors.indigo,
        ),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
