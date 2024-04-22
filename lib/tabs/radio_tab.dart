import 'package:flutter/material.dart';
import 'package:iqraa_app/app_theme.dart';
import 'package:iqraa_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 115, bottom: 50) ,
          child: Image.asset('assets/images/ic_radio_tab.png'),
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.bodyLarge,
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
            Icon(
              Icons.play_arrow,
              color: provider.mode == ThemeMode.light
                  ? AppTheme.primaryColor
                  : AppTheme.yellowColor,
              size: 50,
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
    );
  }
}
