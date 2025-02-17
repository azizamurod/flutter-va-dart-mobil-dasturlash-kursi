import 'package:flutter/material.dart';

import '/utils/contants/transaction_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTextForTransactionTypes(
  TransactionTypes type,
  BuildContext context,
) {
  String result = '';
  final AppLocalizations localizations = AppLocalizations.of(context)!;

  switch (type) {
    case TransactionTypes.income:
      result = localizations.income;
      break;
    case TransactionTypes.transfer:
      result = localizations.transfer;
      break;
    case TransactionTypes.expense:
      result = localizations.expense;
      break;
  }

  return result;
}
