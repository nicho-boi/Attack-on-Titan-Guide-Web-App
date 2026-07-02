import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'providers/favorite_provider.dart';

void main() {
  runApp(const AttackOnTitanApp());
}

class AttackOnTitanApp extends StatelessWidget {
  const AttackOnTitanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Attack on Titan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const LoginPage(),
      ),
    );
  }
}
