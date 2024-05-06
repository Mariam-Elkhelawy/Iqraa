import 'package:Iqraa/app_theme.dart';
import 'package:Iqraa/models/RadioModel.dart';
import 'package:Iqraa/providers/my_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  RadioItem({super.key, required this.radios, required this.player});
  AudioPlayer player;
  Radios radios;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Text(
              textDirection: TextDirection.rtl,
              widget.radios.name ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous,
                color: provider.mode == ThemeMode.light
                    ? AppTheme.primaryColor
                    : AppTheme.yellowColor,
                size: 45,
              ),
              IconButton(
                icon: Icon(
                  isTapped ? Icons.pause : Icons.play_arrow,
                  color: provider.mode == ThemeMode.light
                      ? AppTheme.primaryColor
                      : AppTheme.yellowColor,
                  size: 50,
                ),
                onPressed: () async {
                  isTapped
                      ? await widget.player.pause()
                      : await widget.player.play(
                          UrlSource(widget.radios.url ?? ''),
                        );
                  isTapped = !isTapped;
                  setState(() {});
                },
              ),
              Icon(
                Icons.skip_next,
                color: provider.mode == ThemeMode.light
                    ? AppTheme.primaryColor
                    : AppTheme.yellowColor,
                size: 45,
              ),
            ],
          )
        ],
      ),
    );
  }
}
