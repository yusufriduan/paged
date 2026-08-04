import 'package:flutter/material.dart';
import 'package:paged/features/onboarding/presentation/pages/create_option.dart';
import 'package:paged/themes/light.dart';
import 'package:paged/themes/dark.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paged',
      theme: lightMode,
      darkTheme: darkMode,
      home: CreateOption(),
    );
  }
}
