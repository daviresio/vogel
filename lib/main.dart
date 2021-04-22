import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_routes.dart';
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
      initialRoute: VogelRoutes.home,
      routes: {
        VogelRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}
