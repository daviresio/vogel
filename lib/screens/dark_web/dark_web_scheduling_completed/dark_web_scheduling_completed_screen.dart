import 'package:flutter/material.dart';
import 'package:vogel_app/components/vogel_button.dart';
import 'package:vogel_app/components/vogel_center_message.dart';
import 'package:vogel_app/components/vogel_float_button.dart';

class DarkWebScheduleCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VogelCenterMessage(
        image: Image.asset(
          'assets/images/dark_web.png',
          width: 91,
          height: 91,
          alignment: Alignment.centerLeft,
        ),
        title: 'Scheduled weekly check',
        description:
            'We will check weekly if your data is on the dark web. Don\'t worry, your email/username will only be stored on your cell phone with encryption',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: VogelFloatButton(
        label: 'Done',
        variation: VogelButtonVariation.darkWeb,
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    );
  }
}
