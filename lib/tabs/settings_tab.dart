import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/bottom_sheets/language_bottom_sheet.dart';
import 'package:islami_app/bottom_sheets/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            local.language,
            style: theme.textTheme.headlineLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .72,
                      child: LanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppTheme.primaryColor,
                    ),
                    color: Colors.transparent),
                child: provider.languageCode == 'ar'
                    ? Text(
                        local.arabic,
                        style: theme.textTheme.bodyLarge,
                      )
                    : Text(
                        local.english,
                        style: theme.textTheme.bodyLarge,
                      )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Text(
            local.theme,
            style: theme.textTheme.headlineLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .72,
                      child: ThemeBottomSheet(),
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppTheme.primaryColor,
                  ),
                  color: Colors.transparent),
              child: Text(
                local.light,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
