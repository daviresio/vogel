import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_radius.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

//Styled snackbar with warning and error styles
class VogelSnackbar {
  static final VogelSnackbar _instance = VogelSnackbar._internal();
  VogelSnackbar._internal();

  factory VogelSnackbar() {
    return _instance;
  }

  static void show({
    required String text,
    required VogelSnackBarStatus status,
    required BuildContext context,
  }) {
    var snackbar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(VogelRadius.small),
      ),
      backgroundColor: values[status]!.backgroundColor,
      content: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(values[status]!.icon, color: values[status]!.contentColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: VogelSpacing.small1),
                child: Text(
                  text,
                  softWrap: true,
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        color: values[status]!.contentColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
            InkWell(
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              child: Icon(
                Icons.close_outlined,
                color: values[status]!.contentColor,
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.symmetric(
        horizontal: VogelSpacing.small4,
        vertical: VogelSpacing.tiny2,
      ),
      margin: EdgeInsets.all(VogelSpacing.big1),
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

enum VogelSnackBarStatus { error, warning }

class _VogelSnackBarValue {
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;

  _VogelSnackBarValue({
    required this.icon,
    required this.backgroundColor,
    required this.contentColor,
  });
}

Map<VogelSnackBarStatus, _VogelSnackBarValue> values = {
  VogelSnackBarStatus.warning: _VogelSnackBarValue(
    icon: Icons.warning_amber_sharp,
    backgroundColor: VogelColors.warningLight,
    contentColor: VogelColors.warningDark,
  ),
  VogelSnackBarStatus.error: _VogelSnackBarValue(
    icon: Icons.error_outline,
    backgroundColor: VogelColors.dangerLight,
    contentColor: VogelColors.dangerDark,
  ),
};
