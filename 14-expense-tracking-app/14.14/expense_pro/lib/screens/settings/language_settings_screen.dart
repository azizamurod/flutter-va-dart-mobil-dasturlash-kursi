import 'package:flutter/material.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/settings/settings_select_card.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Language',
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
                'text': 'English (EN)',
                'is_selected': true,
              },
              {
                'text': 'Uzbek (UZ)',
                'is_selected': false,
              },
              {
                'text': 'Russian (RU)',
                'is_selected': false,
              },
            ].map(
              (el) {
                return SettingsSelectCard(
                  text: el['text'] as String,
                  isSelected: el['is_selected'] as bool,
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
