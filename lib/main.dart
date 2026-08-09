import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'package:paged/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:paged/themes/light.dart';
import 'package:paged/themes/dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  final supabase = Supabase.instance.client;
  if (supabase.auth.currentUser == null) {
    try {
      await supabase.auth.signInAnonymously();
      debugPrint("Anonymous user created successfully!");
    } catch (e) {
      debugPrint("Failed to create anonymous user: $e");
    }
  }
  
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
      home: OnboardingScreen(),
    );
  }
}
