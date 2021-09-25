import 'package:flutter/material.dart';
import 'package:shellhack_project/app/views/home_sceen.dart';

import 'app/views/login/login.dart';
import 'app/views/portafolio/portafolio.dart';
import 'app/views/splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      title: 'Hackathon',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF41BEA5),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash': (context) => const SplashScreenView(),
        '/login': (context) => const LoginView(),
        '/home' : (context) => const HomeScreen(),
      },
    );
  }
}
