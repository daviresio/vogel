import 'package:flutter/material.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

class VogelFloatButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const VogelFloatButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (VogelSpacing.big1 * 2),
      margin: EdgeInsets.only(bottom: VogelSpacing.big1),
      child: VogelButton(
        label: label,
        onPressed: onPressed,
        variation: VogelButtonVariation.darkWeb,
      ),
    );
  }
}
