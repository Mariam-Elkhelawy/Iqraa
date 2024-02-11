import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: Duration(seconds: 6),
      backgroundImage: Image(image: AssetImage('assets/images/splash.png')),
      nextScreen: HomeScreen(),
      childWidget: SizedBox(),
    );
  }
}
