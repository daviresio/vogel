import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_float_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/core/vogel_text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:vogel_app/core/vogel_ui.dart';
import 'package:pedantic/pedantic.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_controller.dart';

class DarkWebUserDataScreen extends StatelessWidget {
  final controller = DarkWebUserDataController();

  @override
  Widget build(BuildContext context) {
    var displayFloatButton = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      appBar: VogelUI.appBar(context, title: 'Dark Web'),
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
                  controller.nodeFocusEmail,
                  controller.nodeFocusUsername,
                ],
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: VogelSpacing.medium1, top: VogelSpacing.medium2),
                  child: Image.asset(
                    'assets/images/dark_web.png',
                    width: 91,
                    height: 91,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(height: VogelSpacing.extraBig1),
                Padding(
                  padding: const EdgeInsets.only(
                    left: VogelSpacing.big1,
                    right: VogelSpacing.big1,
                    bottom: VogelSpacing.medium1,
                  ),
                  child: VogelTextField(
                    label: 'Email',
                    controller: controller.emailCtl,
                    focusNode: controller.nodeFocusEmail,
                    onChanged: controller.setEmail,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: VogelSpacing.big1,
                    right: VogelSpacing.big1,
                  ),
                  child: VogelTextField(
                    label: 'Username',
                    controller: controller.usernameCtl,
                    focusNode: controller.nodeFocusUsername,
                    onChanged: controller.setUsername,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: displayFloatButton
          ? VogelFloatButton(
              label: 'Search',
              onPressed: () async {
                var result = await controller.searchLakedData();
                if (result == null) {
                  //TODO implement error snackbar
                  return;
                } else {
                  unawaited(
                    Navigator.of(context).pushNamed(VogelRoutes.darkWebResult,
                        arguments: {'lakedAccounts': result}),
                  );
                }
              },
            )
          : Container(height: 0),
    );
  }
}
