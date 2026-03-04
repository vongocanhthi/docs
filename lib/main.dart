import 'package:flutter/material.dart';

import 'pages/app_list_page.dart';

void main() {
  runApp(const DocsApp());
}

class DocsApp extends StatelessWidget {
  const DocsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Điều khoản & Chính sách',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AppListPage(),
    );
  }
}
