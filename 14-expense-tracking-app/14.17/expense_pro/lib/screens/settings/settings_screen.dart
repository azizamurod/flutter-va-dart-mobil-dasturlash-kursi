import 'package:flutter/material.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/settings/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
        textColor: Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16),
              color: const Color.fromRGBO(245, 245, 245, 1),
            ),
            ...[
              {
                'text': 'Currency',
                'value': 'USD',
                'screen': '/currency-settings',
              },
              {
                'text': 'Language',
                'value': 'English',
                'screen': '/language-settings',
              },
            ].map(
              (el) {
                return SettingsCard(
                  text: el['text'] as String,
                  value: el['value'] as String,
                  onTap: () => Navigator.pushNamed(
                    context,
                    el['screen'] as String,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
