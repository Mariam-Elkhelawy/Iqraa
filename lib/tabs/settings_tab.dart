import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppTheme.primaryColor,
                ),
                color: Colors.transparent),
            child: Text(
              'Arabic',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.04,),

          Text(
            'Theme',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppTheme.primaryColor,
                ),
                color: Colors.transparent),
            child: Text(
              'Light',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
