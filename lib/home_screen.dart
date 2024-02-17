import 'package:flutter/material.dart';
import 'package:islami_app/tabs/ahadeth_tab.dart';
import 'package:islami_app/tabs/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
import 'package:islami_app/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'Home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(local.islami),),
        bottomNavigationBar: BottomNavigationBar(
         iconSize: 35,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: local.radio,
              icon: ImageIcon(
                AssetImage('assets/images/ic_radio.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.sebha,
              icon: ImageIcon(
                AssetImage('assets/images/ic_sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.ahadeth,
              icon: ImageIcon(
                AssetImage('assets/images/ic_ahadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.quran,
              icon: ImageIcon(
                AssetImage('assets/images/ic_quran.png'),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label:local.settings,)
          ],
        ),
        body: tabs[index],
      ),
    );
  }
}

List<Widget> tabs = [
  RadioTab(),
  SebhaTab(),
  AhadithTab(),
  QuranTab(),
  SettingsTab(),
];
