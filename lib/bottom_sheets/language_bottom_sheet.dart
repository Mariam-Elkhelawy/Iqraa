import 'package:flutter/material.dart.';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changeLanguageCode('en');
                },
                child: Text(local.english,
                    style: GoogleFonts.elMessiri(
                      fontSize: 28,
                      color: provider.languageCode == 'en'
                          ? AppTheme.primaryColor
                          : AppTheme.blackColor,
                    )),
              ),
              if (provider.languageCode == 'en') ...[
                Icon(
                  Icons.done,
                  size: 30,
                  color: AppTheme.primaryColor,
                )
              ]
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  provider.changeLanguageCode('ar');
                },
                child: Text(local.arabic,
                    style: GoogleFonts.elMessiri(
                      fontSize: 28,
                      color: provider.languageCode == 'ar'
                          ? AppTheme.primaryColor
                          : AppTheme.blackColor,
                    )),
              ),
              if (provider.languageCode == 'ar') ...[
                Icon(
                  Icons.done,
                  size: 30,
                  color: AppTheme.primaryColor,
                )
              ]
            ],
          ),
        ],
      ),
    );
  }
}
