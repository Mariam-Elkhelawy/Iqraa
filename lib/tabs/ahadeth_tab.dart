import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadith_details.dart';
import 'package:islami_app/models/hadith_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AhadithTab extends StatefulWidget {
  const AhadithTab({super.key});

  @override
  State<AhadithTab> createState() => _AhadithTabState();
}

class _AhadithTabState extends State<AhadithTab> {
  List<HadithModel> ahadithData = [];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    if (ahadithData.isEmpty) {
      LoadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/ic_hadith_top.png'),
        Divider(
          thickness: 3,
          color: AppTheme.primaryColor,
        ),
        Text(
    local.ahadeth,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Divider(
          thickness: 3,
          color: AppTheme.primaryColor,
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadithDetails.routeName,
                    arguments: ahadithData[index]);
              },
              child: Text(ahadithData[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            );
          },
          itemCount: ahadithData.length,
        ))
      ],
    );
  }

  LoadHadithFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((hadithFile) {
      List<String> ahadith = hadithFile.split('#');
      for (int i = 0; i < ahadith.length; i++) {
        String hadith = ahadith[i];
        List<String> hadithLines = hadith.trim().split('\n');
        String title = hadithLines[0];
        hadithLines.removeAt(0);
        List<String> hadithContent = hadithLines;
        ahadithData.add(HadithModel(title: title, content: hadithContent));
      }
      setState(() {});
    });
  }
}
