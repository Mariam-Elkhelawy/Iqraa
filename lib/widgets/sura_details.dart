import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../app_theme.dart';
import '../models/SuraAudioModel.dart';
import '../models/sura_model.dart';
import '../providers/my_provider.dart';
import '../providers/sura_details_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  final player = AudioPlayer();

  bool isTapped = false;
  int currentAyahIndex = 0;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    Future<SuraAudioModel> getSuraAudio() async {
      var url = Uri.parse(
          'http://api.alquran.cloud/v1/surah/${model.index + 1}/ar.alafasy');
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SuraAudioModel.fromJson(json);
    }

    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFiles(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var uIProvider = Provider.of<MyProvider>(context);

        return FutureBuilder(
          future: getSuraAudio(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: uIProvider.mode == ThemeMode.light
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
            final ayahModel = snapshot.data as SuraAudioModel;
            List<Ayahs> ayahs = ayahModel.data?.ayahs ?? [];

            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(uIProvider.getBackgroundImage()),
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
                      color: uIProvider.mode == ThemeMode.light
                          ? const Color(0xFFF8F8F8).withOpacity(.8)
                          : const Color(0xFF141A2E),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'سورة ${model.name}',
                              style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: uIProvider.mode == ThemeMode.light
                                      ? AppTheme.blackColor
                                      : AppTheme.yellowColor),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            IconButton(
                              icon: Icon(
                                isTapped
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                size: 27,
                                color: uIProvider.mode == ThemeMode.light
                                    ? AppTheme.blackColor
                                    : AppTheme.yellowColor,
                              ),
                              onPressed: () async {
                                setState(() {
                                  isTapped = !isTapped;
                                });

                                if (isTapped) {
                                  for (int i = currentAyahIndex;
                                      i < ayahs.length;
                                      i++) {
                                    final audioUrl = ayahs[i].audio;
                                    if (audioUrl != null) {
                                      await player.play(UrlSource(audioUrl));
                                      currentAyahIndex = i;
                                      Duration duration =
                                          await player.getDuration() ??
                                              Duration.zero;
                                      await Future.delayed(duration);
                                      if (!isTapped) break;
                                    }
                                  }
                                } else {
                                  await player.pause();
                                }
                              },
                            ),
                          ],
                        ),
                        Divider(
                          indent: 50,
                          endIndent: 50,
                          color: uIProvider.mode == ThemeMode.light
                              ? AppTheme.primaryColor
                              : AppTheme.yellowColor,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  provider.verses[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: uIProvider.mode == ThemeMode.light
                                        ? AppTheme.blackColor
                                        : AppTheme.yellowColor,
                                  ),
                                ),
                              );
                            },
                            itemCount: provider.verses.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
