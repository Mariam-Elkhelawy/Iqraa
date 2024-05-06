import 'package:Iqraa/providers/my_provider.dart';
import 'package:Iqraa/splash_screen.dart';
import 'package:Iqraa/widgets/sura_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'widgets/hadith_details.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: const IqraaApp(),
    ),
  );
}

class IqraaApp extends StatelessWidget {
  const IqraaApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale(provider.languageCode),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      themeMode: provider.mode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadithDetails.routeName: (context) => const HadithDetails(),
      },
    );
  }
}
