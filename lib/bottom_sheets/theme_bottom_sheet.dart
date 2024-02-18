import 'package:flutter/material.dart.';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                  provider.changeThemeMode(ThemeMode.light);
                },
                child: Text(local.light,
                    style: GoogleFonts.elMessiri(
                      fontSize: 28,
                      color: provider.mode == ThemeMode.light
                          ? AppTheme.primaryColor
                          : AppTheme.blackColor,
                    )),
              ),
              if ( provider.mode == ThemeMode.light) ...[
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
                  provider.changeThemeMode(ThemeMode.dark);
                },
                child: Text(local.dark,
                    style: GoogleFonts.elMessiri(
                      fontSize: 28,
                      color: provider.mode == ThemeMode.dark
                          ? AppTheme.primaryColor
                          : AppTheme.blackColor,
                    )),
              ),
              if (provider.mode == ThemeMode.dark) ...[
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
