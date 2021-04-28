import 'package:flutter/material.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/components/vogel_float_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';

class DarkWebPresentationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(VogelSpacing.big1),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Image.asset(
              'assets/images/dark_web.png',
              width: 91,
              height: 91,
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: VogelSpacing.huge1),
            Text(
              'Control access to your personal data on Dark Web',
              maxLines: 1,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: VogelSpacing.medium1),
            Text(
              'Vogel will monitor the dark web for data breaches that impact you.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: VogelSpacing.small4),
            Text(
              'Please provide your email and/or phone number. Vogel will provide you up-to-date data breach information using a dark web monitoring service.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: VogelSpacing.medium1),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: VogelFloatButton(
        label: 'Start',
        variation: VogelButtonVariation.darkWeb,
        onPressed: () {
          Navigator.of(context).pushNamed(VogelRoutes.darkWebUserData);
        },
      ),
    );
  }
}
