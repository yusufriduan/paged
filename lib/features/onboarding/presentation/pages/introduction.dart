import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_buton.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:50.0, right: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Paged!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 300),
              Text(
                'A social app where your friendships is a playlist. Listen together or listen yourself!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 80),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // Handle Youtube Music login
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}