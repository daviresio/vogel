import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';

class VogelTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const VogelTextField({
    required this.label,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: 15,
        color: VogelColors.darkWebColor,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
      ),
      cursorColor: VogelColors.darkWebColor,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 15,
          color: VogelColors.textPrimaryColor,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: VogelColors.darkWebColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: VogelColors.darkWebColor, width: 2),
        ),
      ),
    );
  }
}
