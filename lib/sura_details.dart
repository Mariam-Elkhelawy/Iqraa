import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqraa_app/providers/my_provider.dart';
import 'package:iqraa_app/providers/sura_details_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});
  static const String routeName = 'SuraDetailsScreen';

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFiles(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var uIProvider = Provider.of<MyProvider>(context);

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(uIProvider.getBackgroundImage()),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(local.islami),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: uIProvider.mode == ThemeMode.light
                        ? const Color(0xFFF8F8F8).withOpacity(.8)
                        : const Color(0xFF141A2E),
                    borderRadius: BorderRadius.circular(25),),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سورة ${model.name}',
                          style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: uIProvider.mode == ThemeMode.light
                                  ? AppTheme.blackColor
                                  : AppTheme.yellowColor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.play_circle,
                          size: 27,
                          color: uIProvider.mode == ThemeMode.light
                              ? AppTheme.blackColor
                              : AppTheme.yellowColor,
                        ),
                      ],
                    ),
                    Divider(
                      indent: 50,
                      endIndent: 50,
                      color: uIProvider.mode == ThemeMode.light
                          ? AppTheme.primaryColor
                          : AppTheme.yellowColor,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(
                            provider.verses[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: uIProvider.mode == ThemeMode.light
                                  ? AppTheme.blackColor
                                  : AppTheme.yellowColor,
                            ),
                          );
                        },
                        itemCount: provider.verses.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
