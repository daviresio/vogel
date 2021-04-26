import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_button.dart';
import 'package:vogel_app/core/vogel_float_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/core/vogel_text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:vogel_app/core/vogel_ui.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class DarkWebUserDataScreen extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  final phoneCtl = MaskedTextController(mask: '000-000-0000');

  @override
  Widget build(BuildContext context) {
    var displayFloatButton = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      body: Form(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: KeyboardActions(
            config: VogelUI.keyboardActionsConfig(
              context,
              actions: VogelUI.keyboardActions(
                nodes: [
                  _nodeText1,
                  _nodeText2,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(VogelSpacing.big1),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset(
                    'assets/images/dark_web.png',
                    width: 91,
                    height: 91,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: VogelSpacing.huge1),
                  VogelTextField(
                    label: 'Email',
                    focusNode: _nodeText1,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: VogelSpacing.medium1),
                  VogelTextField(
                    label: 'Mobile/Cell phone number',
                    controller: phoneCtl,
                    focusNode: _nodeText2,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: VogelSpacing.medium1),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: displayFloatButton
          ? VogelFloatButton(
              label: 'Search',
              onPressed: () {
                Navigator.of(context).pushNamed(VogelRoutes.darkWebResult);
              },
            )
          : Container(height: 0),
    );
  }
}
