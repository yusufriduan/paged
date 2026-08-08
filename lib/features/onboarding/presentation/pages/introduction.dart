import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_buton.dart';

class IntroductionPage extends StatefulWidget {
  final int pageIndex;
  final int currentPage;
  final VoidCallback onNext;
  const IntroductionPage({super.key, required this.pageIndex, required this.currentPage, required this.onNext});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        final active = i == widget.currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: active ? 20 : 6,
          decoration: BoxDecoration(
            color: active ? Colors.blue : Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

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
              SizedBox(height: 280),
              _buildDots(),
              SizedBox(height: 50),
              Text(
                'A social app where your friendships is a playlist. Listen together or listen yourself!',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Continue',
                onPressed: widget.onNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}