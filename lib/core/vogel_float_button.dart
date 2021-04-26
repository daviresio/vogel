import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_button.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

class VogelFloatButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const VogelFloatButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: VogelSpacing.big1),
      width: double.maxFinite,
      child: VogelButton(
        label: label,
        onPressed: onPressed,
      ),
    );
  }
}
