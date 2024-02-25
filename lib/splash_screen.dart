import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return FlutterSplashScreen.fadeIn(
      duration: Duration(seconds: 6),
      backgroundImage: provider.mode == ThemeMode.light
          ? Image(
              image: AssetImage('assets/images/splash.png'),
            )
          : Image(
              image: AssetImage('assets/images/splash_dark.png'),
            ),
      nextScreen: HomeScreen(),
      childWidget: SizedBox(),
    );
  }
}
