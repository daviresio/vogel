import 'package:flutter/material.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/components/vogel_center_message.dart';
import 'package:vogel_app/components/vogel_text_field.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/components/vogel_ui.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/components/item_leaked.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/dark_web_result_controller.dart';

class DarkWebResultScreen extends StatelessWidget {
  final List<BreachedAccountModel> leakedAccounts;

  const DarkWebResultScreen({required this.leakedAccounts});

  void goToCompletedScheduleScreen(BuildContext context) {
    Navigator.of(context).pushNamed(VogelRoutes.darkWebScheduleCompleted);
  }

  Widget get _darkWebLogo => Image.asset(
        'assets/images/dark_web.png',
        width: 91,
        height: 91,
        alignment: Alignment.centerLeft,
      );

  @override
  Widget build(BuildContext context) {
    final controller = DarkWebResultController();

    var displayFloatButton = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: leakedAccounts.isNotEmpty
            ? ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: VogelSpacing.big1,
                      left: VogelSpacing.big1,
                    ),
                    child: _darkWebLogo,
                  ),
                  SizedBox(height: VogelSpacing.medium1),
                  ...leakedAccounts.map((e) => ItemLeaked(e)).toList(),
                  SizedBox(height: VogelSpacing.huge1 * 2),
                ],
              )
            : VogelCenterMessage(
                image: _darkWebLogo,
                title: 'No Leaked data found!',
                description:
                    'We don\'t found any lakes data for this email/username on Dark Web',
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: displayFloatButton
          ? Container(
              width:
                  MediaQuery.of(context).size.width - (VogelSpacing.big1 * 2),
              margin: EdgeInsets.only(bottom: VogelSpacing.big1),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.maxFinite,
                      child: VogelButton(
                        label: 'Repeat Weekly?',
                        variation: VogelButtonVariation.darkWeb,
                        onPressed: () async {
                          var result = await VogelUI.dialog(
                            context,
                            onConfirm: () async {
                              if (await controller.isBiometricAvailable()) {
                                Navigator.of(context).pop(true);
                              } else {
                                Navigator.of(context).pop(false);
                              }
                            },
                            confirmLabel: 'Confirm',
                            cancelLabel: 'Cancel',
                            title: 'Repeat Scan Weekly',
                            description:
                                'The dark web scan will be repeated weekly and the results will be available there',
                          );
                          if (result == null) {
                            return;
                          } else if (result == true) {
                            var authenticateSuccessFull =
                                await controller.authenticateUser();
                            if (authenticateSuccessFull) {
                              goToCompletedScheduleScreen(context);
                            }
                          } else if (result == false) {
                            await VogelUI.dialog(
                              context,
                              onConfirm: () {
                                Navigator.of(context).pop(true);
                                goToCompletedScheduleScreen(context);
                              },
                              confirmLabel: 'Confirm',
                              cancelLabel: 'Cancel',
                              title: 'Please, confirm your email and password',
                              descriptionWidget: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  VogelTextField(label: 'E-mail'),
                                  SizedBox(height: VogelSpacing.medium1),
                                  VogelTextField(
                                    label: 'Password',
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: VogelSpacing.medium1),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.maxFinite,
                      child: VogelButton(
                        label: 'Done',
                        variation: VogelButtonVariation.darkWeb,
                        onPressed: () => Navigator.of(context)
                            .popUntil((route) => route.isFirst),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(height: 0),
    );
  }
}
