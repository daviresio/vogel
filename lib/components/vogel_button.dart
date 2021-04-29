import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';

//A button can have different colors, so i define a Variation, for when use a button
//specify which variation is for use diferrent colors in the same Button component
class VogelButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final VogelButtonVariation variation;

  const VogelButton({
    required this.onPressed,
    required this.label,
    required this.variation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: variationValues[variation],
          textStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        child: Text(label),
      ),
    );
  }
}

enum VogelButtonVariation { darkWeb }

Map<VogelButtonVariation, Color> variationValues = {
  VogelButtonVariation.darkWeb: VogelColors.darkWebColor,
};
