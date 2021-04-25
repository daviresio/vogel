import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/screens/dark_web/dark_web_presentation/dark_web_presentation_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_repeat/dark_web_repeat_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/dark_web_result_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_screen.dart';
import 'package:vogel_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: VogelRoutes.darkWebPresentation,
      routes: {
        VogelRoutes.home: (context) => HomeScreen(),
        VogelRoutes.darkWebPresentation: (context) =>
            DarkWebPresentationScreen(),
        VogelRoutes.darkWebUserData: (context) => DarkWebUserDataScreen(),
        VogelRoutes.darkWebResult: (context) => DarkWebResultScreen(),
        VogelRoutes.darkWebRepeat: (context) => DarkWebRepeatScreen(),
      },
    );
  }
}
