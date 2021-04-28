import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/core/vogel_ui.dart';
import 'package:vogel_app/models/breached_account/breached_account_model.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/components/item_leaked.dart';

class DarkWebResultScreen extends StatelessWidget {
  final List<BreachedAccountModel> leakedAccounts;

  const DarkWebResultScreen({required this.leakedAccounts});

  Widget get _darkWebLogo => Image.asset(
        'assets/images/dark_web.png',
        width: 91,
        height: 91,
        alignment: Alignment.centerLeft,
      );

  @override
  Widget build(BuildContext context) {
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
            : Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: VogelSpacing.big1),
                  margin: EdgeInsets.only(bottom: VogelSpacing.huge1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _darkWebLogo,
                      SizedBox(height: VogelSpacing.medium1),
                      Text(
                        'No Leaked data found!',
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: VogelSpacing.medium1),
                      Text(
                        'We don\'t found any lakes data for this email/username on Dark Web',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
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
                        onPressed: () {
                          VogelUI.dialog(
                            context,
                            onConfirm: () {},
                            confirmLabel: 'Confirm',
                            cancelLabel: 'Cancel',
                            title: 'Repeat Scan Weekly',
                            description:
                                'The dark web scan will be repeated weekly and the results will be available there',
                          );
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
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            VogelRoutes.dashboard,
                            (route) => false,
                          );
                        },
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


                              // showMaterialModalBottomSheet(
                              //   context: context,
                              //   builder: (context) => LimitedBox(
                              //     maxHeight:
                              //         MediaQuery.of(context).size.height - 80,
                              //     child: Container(
                              //       constraints: BoxConstraints(
                              //           maxHeight:
                              //               MediaQuery.of(context).size.height -
                              //                   80),
                              //       padding: EdgeInsets.zero,
                              //       child: ClipRRect(
                              //         borderRadius: BorderRadius.only(
                              //           topLeft: Radius.circular(
                              //               VogelRadius.extraLarge),
                              //           topRight: Radius.circular(
                              //               VogelRadius.extraLarge),
                              //         ),
                              //         child: Material(
                              //           color: VogelColors.white,
                              //           child: SafeArea(
                              //             top: true,
                              //             child: Column(
                              //               mainAxisSize: MainAxisSize.min,
                              //               children: [
                              //                 Container(
                              //                   height: 570,
                              //                   decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                       VogelRadius.extraLarge,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );