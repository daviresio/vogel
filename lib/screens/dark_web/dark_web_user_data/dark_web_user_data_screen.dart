import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/components/vogel_loader.dart';
import 'package:vogel_app/components/vogel_snackbar.dart';
import 'package:vogel_app/components/vogel_float_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/components/vogel_text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:vogel_app/components/vogel_ui.dart';
import 'package:pedantic/pedantic.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_controller.dart';

class DarkWebUserDataScreen extends StatelessWidget {
  final controller = DarkWebUserDataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return VogelLoader(
            isLoading: controller.isLoading,
            title: 'Looking on Dark Web, Please wait...',
            description:
                'It might take a minute or two depending on the network connections...',
            child: Form(
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
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: VogelSpacing.medium1,
                            top: VogelSpacing.medium2),
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
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Observer(builder: (context) {
        var displayFloatButton = !controller.isLoading &&
            MediaQuery.of(context).viewInsets.bottom == 0;
        return displayFloatButton
            ? VogelFloatButton(
                label: 'Search',
                variation: VogelButtonVariation.darkWeb,
                onPressed: () async {
                  if (controller.fieldsAreEmpty) {
                    VogelSnackbar.show(
                      text: 'Please input your e-mail or username',
                      status: VogelSnackBarStatus.warning,
                      context: context,
                    );
                    return;
                  }

                  if (!controller.emailIsValid) {
                    VogelSnackbar.show(
                      text: 'Please inpute a valid e-mail!',
                      status: VogelSnackBarStatus.warning,
                      context: context,
                    );
                    return;
                  }

                  var result = await controller.searchleakedData();
                  if (result == null) {
                    VogelSnackbar.show(
                      text:
                          'unfortunately an error happened, please check your internet and try again',
                      status: VogelSnackBarStatus.error,
                      context: context,
                    );
                    return;
                  } else {
                    unawaited(
                      Navigator.of(context).pushNamed(
                        VogelRoutes.darkWebResult,
                        arguments: {'leakedAccounts': result},
                      ),
                    );
                  }
                },
              )
            : Container(height: 0);
      }),
    );
  }
}
