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
  //Receive leakedAccounts as params when user navigate to this screen
  final List<BreachedAccountModel> leakedAccounts;
  const DarkWebResultScreen({required this.leakedAccounts});

  //I create this function for navigate to completed screen because i use this
  // code on 2 different places in this page
  void goToCompletedScheduleScreen(BuildContext context) {
    Navigator.of(context).pushNamed(VogelRoutes.darkWebScheduleCompleted);
  }

  //I put this image on this getter function for reuse code, because i use this
  // image on 2 different places in this page
  Widget get _darkWebLogo => Image.asset(
        'assets/images/dark_web.png',
        width: 91,
        height: 91,
        alignment: Alignment.centerLeft,
      );

  @override
  Widget build(BuildContext context) {
    //mobx controller relative this page
    final controller = DarkWebResultController();

    return Scaffold(
      //is has leaked accounts show the list of items, otherwise show a message
      // explain don't find any leaked data
      body: leakedAccounts.isNotEmpty
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (VogelSpacing.big1 * 2),
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
                    //Open a dialog for confirm scheduller search
                    var result = await VogelUI.dialog(
                      context,
                      onConfirm: () async {
                        //If smartphone has faceId or fingerprint available return true,
                        //if not, return false
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
                    //If result is null, the user cancel operation, so just return
                    if (result == null) {
                      return;
                    } else if (result == true) {
                      //If has faceId or fingerprint available call them
                      var authenticateSuccessFull =
                          await controller.authenticateUser();
                      //If authorization was successfull navigate to completed page
                      if (authenticateSuccessFull) {
                        goToCompletedScheduleScreen(context);
                      }
                    } else if (result == false) {
                      //If user dont have faceId or fingerprint on your smartphone, open a modal for input
                      //your mail and password for authenticate.
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
                  //Back do dashboard page
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
