import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_spacing.dart';
import 'package:vogel_app/core/vogel_text_field.dart';

class DarkWebResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(VogelSpacing.big1),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/dark_web.png',
              width: 91,
              height: 91,
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: VogelSpacing.medium1),
            VogelTextField(
              label: '',
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: VogelSpacing.medium1),
            VogelButton(
              label: 'Repeat Weekly?',
              onPressed: () {
                Navigator.of(context).pushNamed(VogelRoutes.darkWebUserData);
              },
            ),
            SizedBox(height: VogelSpacing.medium1),
            VogelButton(
              label: 'Done',
              onPressed: () {
                Navigator.of(context).popUntil(
                  (route) => route.settings.name == VogelRoutes.dashboard,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
