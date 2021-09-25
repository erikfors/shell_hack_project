import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash': (context) => const SplashScreenView(),
        '/login': (context) => const LoginView(),
        '/portafolio': (context) => const PortafolioView(),
      },
    );
  }
}
