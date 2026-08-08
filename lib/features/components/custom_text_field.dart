import 'package:flutter/material.dart';

enum TextFieldVariant { primary, withButton }

class CustomTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final TextFieldVariant variant;
  final String hintText;
  final Icon? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomTextField({
    super.key,
    this.enabled = true,
    required this.controller,
    required this.hintText,
    this.variant = TextFieldVariant.primary,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      TextFieldVariant.primary => SizedBox(
        width: 305,
        height: 64,
        child:TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20
            ),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
      TextFieldVariant.withButton => Container(
          width: 305,
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: enabled,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: onActionPressed,
                  icon: actionIcon ?? const Icon(Icons.arrow_forward, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(width: 30, height: 30),
                  splashRadius: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),
    };
  }
}