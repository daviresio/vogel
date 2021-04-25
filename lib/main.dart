import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/screens/dark_web/dark_web_presentation/dark_web_presentation_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_repeat/dark_web_repeat_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/dark_web_result_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_screen.dart';
import 'package:vogel_app/screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vogel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: VogelColors.textPrimaryColor,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
          ),
          overline: TextStyle(
            fontSize: 13,
            color: VogelColors.textPrimaryColor,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w300,
            height: 1,
          ),
        ),
      ),
      initialRoute: VogelRoutes.dashboard,
      routes: {
        VogelRoutes.dashboard: (context) => DashboardScreen(),
        VogelRoutes.darkWebPresentation: (context) =>
            DarkWebPresentationScreen(),
        VogelRoutes.darkWebUserData: (context) => DarkWebUserDataScreen(),
        VogelRoutes.darkWebResult: (context) => DarkWebResultScreen(),
        VogelRoutes.darkWebRepeat: (context) => DarkWebRepeatScreen(),
      },
    );
  }
}
