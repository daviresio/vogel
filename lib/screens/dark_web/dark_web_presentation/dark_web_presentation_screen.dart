import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_button.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/core/vogel_ui.dart';
import 'package:vogel_app/services/dark_web_service.dart';

class DarkWebPresentationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    searchUnprotectedData();

    return Scaffold(
      appBar: VogelUI.appBar(title: 'Dark Web'),
      body: ListView(
        children: [
          Text(
            'Control access to your personal data on Dark Web',
          ),
          Text(
            'Vogel will monitor thr dark web for data breaches that impact you.',
          ),
          Text(
            'Please provide your email and/or phone number. Vogel will provide you up-to-date data breach information using a dark web monitoring service.',
          ),
          VogelButton(
            label: 'Start',
            onPressed: () {
              Navigator.of(context).pushNamed(VogelRoutes.dashboard);
            },
          ),
        ],
      ),
    );
  }
}
