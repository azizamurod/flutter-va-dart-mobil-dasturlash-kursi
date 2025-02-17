import 'package:flutter/material.dart';

import '/utils/contants/transaction_categories.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getTextForTransactionCategories(
  TransactionCategories? type,
  BuildContext context,
) {
  String result = '';
  final AppLocalizations localizations= AppLocalizations.of(context)!;
  switch (type) {
    /// income
    case TransactionCategories.salary:
      result =localizations.salary;
      break;
    case TransactionCategories.passiveIncome:
      result = localizations.passive_income;
      break;
    case TransactionCategories.businessProfits:
      result = localizations.business_profits;
      break;
    case TransactionCategories.gifts:
      result = localizations.gifts;
      break;
    case TransactionCategories.governmentPayments:
      result = localizations.government_payments;
      break;
    case TransactionCategories.other:
      result = localizations.other;
      break;

    /// expense
    case TransactionCategories.food:
      result = localizations.food;
      break;
    case TransactionCategories.shopping:
      result = localizations.shopping;
      break;
    case TransactionCategories.transportation:
      result = localizations.transportation;
      break;
    case TransactionCategories.subscriptions:
      result = localizations.subscriptions;
      break;
    case TransactionCategories.housing:
      result = localizations.housing;
      break;
    case TransactionCategories.insurance:
      result = localizations.insurance;
      break;
    case TransactionCategories.entertainment:
      result = localizations.entertainment;
      break;
    case TransactionCategories.healthcare:
      result = localizations.healthcare;
      break;
    case TransactionCategories.travel:
      result = localizations.travel;
      break;
    case TransactionCategories.education:
      result = localizations.education;
      break;
    case TransactionCategories.financialExpenses:
      result = localizations.financial_expenses;
      break;
    case TransactionCategories.familyAndKids:
      result = localizations.family_and_kids;
      break;
    case TransactionCategories.pets:
      result = localizations.pets;
      break;
    case TransactionCategories.personalCare:
      result = localizations.personal_care;
      break;
    case TransactionCategories.donations:
      result = localizations.donations;
      break;
    case TransactionCategories.miscellaneous:
      result = localizations.miscellaneous;
      break;

    /// transfer
    case TransactionCategories.transfer:
      result = localizations.transfer;
      break;

    case null:
      result = '';
      break;
  }

  return result;
}
