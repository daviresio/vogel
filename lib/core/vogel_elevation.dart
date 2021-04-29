import 'package:flutter/widgets.dart';
import 'package:vogel_app/core/vogel_colors.dart';

//Here is defined Boxshadow styles used inside application
class VogelElevation {
  static BoxShadow medium() {
    return BoxShadow(
      color: VogelColors.black.withOpacity(0.08),
      offset: Offset(0, 8),
      blurRadius: 18,
      spreadRadius: 0,
    );
  }
}
