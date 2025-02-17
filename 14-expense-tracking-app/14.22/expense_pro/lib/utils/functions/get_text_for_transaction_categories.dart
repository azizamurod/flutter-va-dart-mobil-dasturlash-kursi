import '/utils/contants/transaction_categories.dart';

String getTextForTransactionCategories(TransactionCategories? type) {
  String result = '';

  switch (type) {
    /// income
    case TransactionCategories.salary:
      result = 'Salary';
      break;
    case TransactionCategories.passiveIncome:
      result = 'Passive income';
      break;
    case TransactionCategories.businessProfits:
      result = 'Business profits';
      break;
    case TransactionCategories.gifts:
      result = 'Gifts';
      break;
    case TransactionCategories.governmentPayments:
      result = 'Government payments';
      break;
    case TransactionCategories.other:
      result = 'Other';
      break;

    /// expense
    case TransactionCategories.food:
      result = 'Food';
      break;
    case TransactionCategories.shopping:
      result = 'Shopping';
      break;
    case TransactionCategories.transportation:
      result = 'Transportation';
      break;
    case TransactionCategories.subscriptions:
      result = 'Subscriptions';
      break;
    case TransactionCategories.housing:
      result = 'Housing';
      break;
    case TransactionCategories.insurance:
      result = 'Insurance';
      break;
    case TransactionCategories.entertainment:
      result = 'Entertainment';
      break;
    case TransactionCategories.healthcare:
      result = 'Healthcare';
      break;
    case TransactionCategories.travel:
      result = 'Travel';
      break;
    case TransactionCategories.education:
      result = 'Education';
      break;
    case TransactionCategories.financialExpenses:
      result = 'Financial expenses';
      break;
    case TransactionCategories.familyAndKids:
      result = 'Family and kids';
      break;
    case TransactionCategories.pets:
      result = 'Pets';
      break;
    case TransactionCategories.personalCare:
      result = 'Personal care';
      break;
    case TransactionCategories.donations:
      result = 'Donations';
      break;
    case TransactionCategories.miscellaneous:
      result = 'Miscellaneous';
      break;

    /// transfer
    case TransactionCategories.transfer:
      result = 'Transfer';
      break;

    case null:
      result = '';
      break;
  }

  return result;
}
