import 'package:Iqraa/providers/my_provider.dart';
import 'package:Iqraa/tabs/ahadeth_tab.dart';
import 'package:Iqraa/tabs/quran_tab.dart';
import 'package:Iqraa/tabs/radio_tab.dart';
import 'package:Iqraa/tabs/sebha_tab.dart';
import 'package:Iqraa/tabs/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var imageProvider = Provider.of<MyProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageProvider.getBackgroundImage()),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.islami),
        ),
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
              icon: const ImageIcon(
                AssetImage('assets/images/ic_radio.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.sebha,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_sebha.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.ahadith,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_ahadeth.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: local.quran,
              icon: const ImageIcon(
                AssetImage('assets/images/ic_quran.png'),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              label: local.settings,
            )
          ],
        ),
        body: tabs[index],
      ),
    );
  }
}

List<Widget> tabs = [
   RadioTab(),
  const SebhaTab(),
  const AhadithTab(),
  QuranTab(),
  const SettingsTab(),
];
