import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shellhack_project/app/views/home_sceen.dart';
import 'package:shellhack_project/app/views/login/register.dart';
import 'package:shellhack_project/app/views/portafolio/portafolio.dart';
import 'app/views/login/login.dart';
import 'app/views/splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      title: 'Hackathon',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF41BEA5),
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreenView()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/register', page: () => RegisterView()),
        GetPage(name: '/search', page: () => PortafolioView()),
      ],
    );
  }
}
