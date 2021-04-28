import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vogel_app/core/settings.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_routes.dart';
import 'package:vogel_app/screens/dark_web/dark_web_presentation/dark_web_presentation_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_result/dark_web_result_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_scheduling_completed/dark_web_scheduling_completed_screen.dart';
import 'package:vogel_app/screens/dark_web/dark_web_user_data/dark_web_user_data_screen.dart';
import 'package:vogel_app/screens/dashboard/dashboard_screen.dart';

void main() async {
  //Only execute code above if app is already initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Lock orientation on portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Load env configurantion here, to load as soon as the app runs
    Settings.loadEnvFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vogel',
      //Here i will define some global styles
      theme: ThemeData(
        //Define scaffold background as white. I use Scaffold in all pages,
        //so all pages will have a white background.
        scaffoldBackgroundColor: VogelColors.white,
        //Define all texts styles variations here, for use on whole project,
        //i can make some change locally, but in the general i will use this styles.
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
      //All routes are defined here, in ""VogelRoutes" i store the string, and
      //here i use a simple switch case for get each screen by respective route string name
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
              builder: (_) => DarkWebResultScreen(
                leakedAccounts: (settings.arguments! as Map)['leakedAccounts'],
              ),
            );
          case VogelRoutes.darkWebScheduleCompleted:
            return CupertinoPageRoute(
              builder: (_) => DarkWebScheduleCompletedScreen(),
            );
          default:
            return CupertinoPageRoute(
              builder: (_) => DashboardScreen(),
            );
        }
      },
    );
  }
}
