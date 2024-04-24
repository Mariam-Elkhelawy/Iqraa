import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqraa_app/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../app_theme.dart';
import '../models/hadith_model.dart';

class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});
  static const String routeName = 'HadithDetails';

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var provider = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as HadithModel;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(provider.getBackgroundImage()),
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
              color: provider.mode == ThemeMode.light
                  ? const Color(0xFFF8F8F8).withOpacity(.8)
                  : const Color(0xFF141A2E),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  model.title,
                  style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: provider.mode == ThemeMode.light
                          ? AppTheme.blackColor
                          : AppTheme.yellowColor),
                ),
                Divider(
                  indent: 50,
                  endIndent: 50,
                  color: provider.mode == ThemeMode.light
                      ? AppTheme.primaryColor
                      : AppTheme.yellowColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(model.content[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            color: provider.mode == ThemeMode.light
                                ? AppTheme.blackColor
                                : AppTheme.yellowColor,
                          ),);
                    },
                    itemCount: model.content.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
