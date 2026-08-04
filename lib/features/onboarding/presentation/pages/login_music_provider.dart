import 'package:flutter/material.dart';
import 'package:paged/features/components/custom_buton.dart';

class LoginMusicProvider extends StatefulWidget {
  const LoginMusicProvider({super.key});

  @override
  State<LoginMusicProvider> createState() => _LoginMusicProviderState();
}

class _LoginMusicProviderState extends State<LoginMusicProvider> {
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
              SizedBox(height: 300),
              CustomButton(
                text: 'Connect with Spotify',
                onPressed: () {},
                variant: ButtonVariant.outlined,
                style: ButtonStyle(
                  side: WidgetStateBorderSide.resolveWith((states) {
                    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
                      return const BorderSide(color: Colors.black, width: 2);
                    }
                    return const BorderSide(color: Colors.grey, width: 1);
                  }),
                  foregroundColor: WidgetStateColor.resolveWith((states) {
                    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
                      return Colors.black;
                    }
                    return Colors.grey;
                  }),
                  backgroundColor: WidgetStateColor.resolveWith((states) {
                    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
                      return const Color.fromARGB(255, 30, 215, 96);
                    }
                    return Colors.transparent;
                  }),
                  textStyle: WidgetStateTextStyle.resolveWith((states) {
                    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
                      return const TextStyle(color: Colors.black);
                    }
                    return const TextStyle(color: Colors.grey);
                  }),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Connect with Youtube Music',
                onPressed: () {
                  // Handle Youtube Music login
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