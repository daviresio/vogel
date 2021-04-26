import 'package:flutter/cupertino.dart';
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
          headline2: TextStyle(
            fontSize: 20,
            color: VogelColors.textPrimaryColor,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
          overline: TextStyle(
            fontSize: 13,
            color: VogelColors.textPrimaryColor,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w300,
            height: 1,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            color: VogelColors.textPrimaryColor,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case VogelRoutes.dashboard:
            return CupertinoPageRoute(
              builder: (_) => DashboardScreen(),
            );
          case VogelRoutes.darkWebPresentation:
            return CupertinoPageRoute(
              builder: (_) => DarkWebPresentationScreen(),
            );
          case VogelRoutes.darkWebUserData:
            return CupertinoPageRoute(
              builder: (_) => DarkWebUserDataScreen(),
            );
          case VogelRoutes.darkWebResult:
            return CupertinoPageRoute(
              builder: (_) => DarkWebResultScreen(),
            );
          case VogelRoutes.darkWebRepeat:
            return CupertinoPageRoute(
              builder: (_) => DarkWebRepeatScreen(),
            );
        }
      },
    );
  }
}
