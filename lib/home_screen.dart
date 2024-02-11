import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/tabs/ahadeth_tab.dart';
import 'package:islami_app/tabs/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
import 'package:islami_app/tabs/settings_tab.dart';

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'إسلامي',
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFFB7935F),
            iconSize: 35,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Color(0xFFF8F8F8),
            selectedItemColor: Color(0xFF242424),
            selectedLabelStyle:
                TextStyle(fontSize: 14, color: Color(0xFF242424)),
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: 'الراديو',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_radio.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'التسبيح',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_sebha.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'الاحاديث',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_ahadeth.png'),
                ),
              ),
              BottomNavigationBarItem(
                label: 'القرآن',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  label: 'الاعدادات')
            ]),
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
