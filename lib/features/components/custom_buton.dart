import 'package:flutter/material.dart';

enum ButtonVariant { primary, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final ButtonStyle? style;

  const CustomButton({super.key, required this.text, required this.onPressed, this.variant = ButtonVariant.primary, this.style,});

  @override
  Widget build(BuildContext context) {
    final defaultStyle = switch (variant) {
      ButtonVariant.primary => ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(305, 64),
        textStyle: const TextStyle(fontSize: 20),
      ),
      ButtonVariant.outlined => OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black, width: 2),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(305, 64),
        textStyle: const TextStyle(fontSize: 20),
      ),
    };

    return switch (variant) {
      ButtonVariant.primary => ElevatedButton(
        onPressed: onPressed,
        style: defaultStyle.merge(style),
        child: Text(text, softWrap: true, textAlign: TextAlign.center),
      ),
      ButtonVariant.outlined => OutlinedButton(
        onPressed: onPressed,
        style: defaultStyle.merge(style),
        child: Text(text, softWrap: true, textAlign: TextAlign.center),
      ),
    };
  }
}