import 'package:flutter/material.dart';

class VogelButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const VogelButton({
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
