import 'package:flutter/material.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

//This FloatButton needs to be used with property "floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,"
//for be positioned correctly
class VogelFloatButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final VogelButtonVariation variation;

  const VogelFloatButton({
    required this.label,
    required this.onPressed,
    required this.variation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (VogelSpacing.big1 * 2),
      margin: EdgeInsets.only(bottom: VogelSpacing.big1),
      child: VogelButton(
        label: label,
        onPressed: onPressed,
        variation: variation,
      ),
    );
  }
}
