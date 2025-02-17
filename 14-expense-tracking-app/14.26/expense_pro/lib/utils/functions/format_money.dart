
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import 'format_double_string.dart';

String formatMoney(double money, BuildContext context) {
  String result = '';

  SettingsProvider settingsProvider = context.read<SettingsProvider>();
  String currencySign = settingsProvider.getCurrencySign();
  bool showCurrencySignBeforeAmount =
      settingsProvider.showCurrencySignBeforeAmount();

  if (showCurrencySignBeforeAmount) {
    result = '$currencySign${formatDoubleString(money)}';
  } else {
    result = '${formatDoubleString(money)} $currencySign';

  }

  return result;
}
