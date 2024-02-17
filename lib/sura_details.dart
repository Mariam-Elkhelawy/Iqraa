import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFiles(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
           local.islami
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.all(20),
            decoration:BoxDecoration(
                color: Color(0xFFF8F8F8).withOpacity(.8),
              borderRadius: BorderRadius.circular(25)
               ),
            child: Column(
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سورة ${model.name}',
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 27,
                      color: AppTheme.blackColor,
                    ),
                  ],
                ),
                Divider(
                  indent: 50,
                  endIndent: 50,
                  color: AppTheme.primaryColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 20,color: AppTheme.blackColor),
                      );
                    },
                    itemCount: verses.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadFiles(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('/n');
    verses = lines;
    setState(() {});
  }
}
