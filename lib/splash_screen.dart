import 'package:Iqraa/home_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/my_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return FlutterSplashScreen.fadeIn(
      duration: const Duration(seconds: 3),
      backgroundImage: provider.mode == ThemeMode.light
          ? const Image(
              image: AssetImage('assets/images/splash.png'),
            )
          : const Image(
              image: AssetImage('assets/images/splash_dark.png'),
            ),
      nextScreen: const HomeScreen(),
      childWidget: const SizedBox(),
    );
  }
}
