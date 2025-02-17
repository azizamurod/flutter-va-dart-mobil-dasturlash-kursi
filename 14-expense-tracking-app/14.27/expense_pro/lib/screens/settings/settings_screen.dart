import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/providers/.providers.dart';

import '/widgets/app_bars/custom_app_bar.dart';
import '/widgets/screens/settings/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: AppLocalizations.of(context)!.settings,
        textColor: const Color.fromRGBO(33, 35, 37, 1),
      ),
      body: SafeArea(
        child: Consumer<SettingsProvider>(
          builder: (context, settingsProvider, _) {
            return Column(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  color: const Color.fromRGBO(245, 245, 245, 1),
                ),
                ...[
                  {
                    'text': AppLocalizations.of(context)!.currency,
                    'value': settingsProvider.currency,
                    'screen': '/currency-settings',
                  },
                  {
                    'text': AppLocalizations.of(context)!.language,
                    'value': settingsProvider.language,
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
            );
          },
        ),
      ),
    );
  }
}
