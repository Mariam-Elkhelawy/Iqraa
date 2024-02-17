import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/models/hadith_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});
  static const String routeName = 'HadithDetails';

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    var model = ModalRoute.of(context)!.settings.arguments as HadithModel;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.islami),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xFFF8F8F8).withOpacity(.8),
                borderRadius: BorderRadius.circular(25),),
            child: Column(
              children: [
                SizedBox(height: 12),
                Text('${model.title}',
                    style: Theme.of(context).textTheme.bodyMedium),
                Divider(
                  indent: 50,
                  endIndent: 50,
                  color: AppTheme.primaryColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        model.content[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 20,color: AppTheme.blackColor),
                      );
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
