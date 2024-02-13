import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 115, bottom: 50),
          child: Image.asset('assets/images/ic_radio_tab.png'),
        ),
        Text(
          'إذاعة القرآن الكريم',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous,
              color: AppTheme.primaryColor,
              size: 45,
            ),
            Icon(
              Icons.play_arrow,
              color: AppTheme.primaryColor,
              size: 50,
            ),
            Icon(
              Icons.skip_next,
              color: AppTheme.primaryColor,
              size: 45,
            ),
          ],
        )
      ],
    );
  }
}
