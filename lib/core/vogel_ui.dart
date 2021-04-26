import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:vogel_app/core/vogel_colors.dart';

class VogelUI {
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
