import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../widgets/hadith_details.dart';
import '../providers/ahadith_details_provider.dart';
import '../providers/my_provider.dart';

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
      create: (context) => AhadithDetailsProvider()..loadHadithFile(),
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
              separatorBuilder: (context, index) => const SizedBox(height: 10),
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
