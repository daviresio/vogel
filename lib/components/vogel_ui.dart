import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_elevation.dart';
import 'package:vogel_app/core/vogel_radius.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

class VogelUI {
  static Future<dynamic> dialog(
    BuildContext context, {
    required void Function() onConfirm,
    void Function()? onCancel,
    required String confirmLabel,
    required String cancelLabel,
    required String title,
    String? description,
    Widget? descriptionWidget,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => SimpleDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(VogelRadius.small)),
        elevation: 0,
        backgroundColor: VogelColors.white,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: VogelSpacing.medium2),
            decoration: BoxDecoration(
              color: VogelColors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(VogelRadius.small)),
              boxShadow: [
                VogelElevation.medium(),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: VogelSpacing.medium2),
                Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: VogelSpacing.medium2),
                if (description != null)
                  Text(
                    description,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                if (descriptionWidget != null) descriptionWidget,
                SizedBox(height: VogelSpacing.medium2),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: 200,
                        child: VogelButton(
                          onPressed: () {
                            if (onCancel != null) {
                              onCancel();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          label: cancelLabel,
                          variation: VogelButtonVariation.darkWeb,
                        ),
                      ),
                    ),
                    SizedBox(width: VogelSpacing.medium1),
                    Flexible(
                      child: Container(
                        width: 200,
                        child: VogelButton(
                          onPressed: () {
                            onConfirm();
                          },
                          label: confirmLabel,
                          variation: VogelButtonVariation.darkWeb,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: VogelSpacing.medium2)
              ],
            ),
          )
        ],
      ),
    );
  }

  static KeyboardActionsConfig keyboardActionsConfig(
    BuildContext context, {
    required List<KeyboardActionsItem> actions,
  }) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: actions,
    );
  }

  static List<KeyboardActionsItem> keyboardActions({
    required List<FocusNode> nodes,
  }) {
    assert(nodes.isNotEmpty);

    // ignore: omit_local_variable_types
    List<KeyboardActionsItem> actions = [];

    nodes.forEach((node) {
      actions.add(
        KeyboardActionsItem(
            focusNode: node, toolbarButtons: _keyboardButtons()),
      );
    });

    return actions;
  }

  static List<Widget Function(FocusNode)> _keyboardButtons() {
    return [
      (node) {
        return GestureDetector(
          onTap: () => node.unfocus(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Finish',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                color: VogelColors.darkWebColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }
    ];
  }
}
