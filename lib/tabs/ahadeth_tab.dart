import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadith_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/ahadith_details_provider.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class AhadithTab extends StatefulWidget {
  const AhadithTab({super.key});

  @override
  State<AhadithTab> createState() => _AhadithTabState();
}

class _AhadithTabState extends State<AhadithTab> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return ChangeNotifierProvider<AhadithDetailsProvider>(
      create: (context) => AhadithDetailsProvider()..LoadHadithFile(),
      builder: (context, child) {
        var provider = Provider.of<AhadithDetailsProvider>(context);
        var providerC = Provider.of<MyProvider>(context);

        return Column(
          children: [
            Image.asset('assets/images/ic_hadith_top.png'),
            Divider(
              thickness: 3,
              color: providerC.mode == ThemeMode.light
                  ? AppTheme.primaryColor
                  : AppTheme.yellowColor,
            ),
            Text(
              local.ahadith,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Divider(
              thickness: 3,
              color: providerC.mode == ThemeMode.light
                  ? AppTheme.primaryColor
                  : AppTheme.yellowColor,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadithDetails.routeName,
                        arguments: provider.ahadithData[index]);
                  },
                  child: Text(provider.ahadithData[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                );
              },
              itemCount: provider.ahadithData.length,
            ))
          ],
        );
      },
    );
  }
}
