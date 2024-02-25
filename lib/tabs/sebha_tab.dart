import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'استغفر الله'
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              counter++;
              if (counter == 34) {
                index++;
                counter = 1;

                if (index == azkar.length) {
                  index = 0;
                }
              }
              setState(() {});
            },
            child: Image.asset(provider.mode == ThemeMode.light
                ? 'assets/images/ic_sebha_top.png'
                : 'assets/images/dark_ic_sebha_top.png'),
          ),
          SizedBox(height: 40),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 40),
          Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.mode == ThemeMode.light
                  ? AppTheme.primaryColor.withOpacity(.57)
                  : Color(0xFF141A2E),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.mode == ThemeMode.light
                  ? AppTheme.primaryColor.withOpacity(.57)
                  : AppTheme.yellowColor,
            ),
            child: Center(
              child: Text(
                '${azkar[index]}',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  color: provider.mode == ThemeMode.light
                      ? Colors.white
                      : Color(0xFF0F1424),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
