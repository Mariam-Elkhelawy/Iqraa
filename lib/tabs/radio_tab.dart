import 'dart:convert';
import 'package:Iqraa/app_theme.dart';
import 'package:Iqraa/models/RadioModel.dart';
import 'package:Iqraa/providers/my_provider.dart';
import 'package:Iqraa/widgets/radio_item.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var local = AppLocalizations.of(context)!;

    return FutureBuilder(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: provider.mode == ThemeMode.light
                  ? AppTheme.primaryColor
                  : AppTheme.primaryDarkColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              local.wrong,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }
        final radioModel = snapshot.data as RadioModel;
        List<Radios> radios = radioModel.radios ?? [];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 115, bottom: 50),
              child: Image.asset('assets/images/ic_radio_tab.png'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: radios.length,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  return RadioItem(
                    radios: radios[index],
                    player: player,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  Future<RadioModel> getRadio() async {
    var url = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return RadioModel.fromJson(json);
  }
}
