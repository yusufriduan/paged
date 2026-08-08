import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_buton.dart';

class LoginMusicProvider extends StatefulWidget {
  final int pageIndex;
  final int currentPage;
  final VoidCallback onNext;
  const LoginMusicProvider({super.key, required this.pageIndex, required this.currentPage, required this.onNext});

  @override
  State<LoginMusicProvider> createState() => _LoginMusicProviderState();
}

class _LoginMusicProviderState extends State<LoginMusicProvider> {
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
                'Please select your music provider to continue.',
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
              CustomButton(
                text: 'Connect with Spotify',
                onPressed: widget.onNext,
                variant: ButtonVariant.outlined,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Connect with Youtube Music',
                onPressed: () {
                  // Handle Youtube Music login
                  widget.onNext();
                },
                variant: ButtonVariant.outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}