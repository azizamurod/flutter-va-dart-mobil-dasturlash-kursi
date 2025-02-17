import '/utils/contants/transaction_categories.dart';

String getIconForTransactionCategories(TransactionCategories category) {
  String result = '';

  switch (category) {
    /// income
    case TransactionCategories.salary:
      result = 'assets/icons/categories/salary.png';
      break;
    case TransactionCategories.passiveIncome:
      result = 'assets/icons/categories/passive_income.png';
      break;
    case TransactionCategories.businessProfits:
      result = 'assets/icons/categories/business_profits.png';
      break;
    case TransactionCategories.gifts:
      result = 'assets/icons/categories/gifts.png';
      break;
    case TransactionCategories.governmentPayments:
      result = 'assets/icons/categories/government_payments.png';
      break;
    case TransactionCategories.other:
      result = 'assets/icons/categories/other_income.png';
      break;

    /// expense
    case TransactionCategories.food:
      result = 'assets/icons/categories/food.png';
      break;
    case TransactionCategories.shopping:
      result = 'assets/icons/categories/shopping.png';
      break;
    case TransactionCategories.transportation:
      result = 'assets/icons/categories/transportation.png';
      break;
    case TransactionCategories.subscriptions:
      result = 'assets/icons/categories/subscriptions.png';
      break;
    case TransactionCategories.housing:
      result = 'assets/icons/categories/housing.png';
      break;
    case TransactionCategories.insurance:
      result = 'assets/icons/categories/insurance.png';
      break;
    case TransactionCategories.entertainment:
      result = 'assets/icons/categories/entertainment.png';
      break;
    case TransactionCategories.healthcare:
      result = 'assets/icons/categories/healthcare.png';
      break;
    case TransactionCategories.travel:
      result = 'assets/icons/categories/travel.png';
      break;
    case TransactionCategories.education:
      result = 'assets/icons/categories/education.png';
      break;
    case TransactionCategories.financialExpenses:
      result = 'assets/icons/categories/financial_expenses.png';
      break;
    case TransactionCategories.familyAndKids:
      result = 'assets/icons/categories/family_and_kids.png';
      break;
    case TransactionCategories.pets:
      result = 'assets/icons/categories/pets.png';
      break;
    case TransactionCategories.personalCare:
      result = 'assets/icons/categories/personal_care.png';
      break;
    case TransactionCategories.donations:
      result = 'assets/icons/categories/donations.png';
      break;
    case TransactionCategories.miscellaneous:
      result = 'assets/icons/categories/miscellaneous.png';
      break;

    /// transfer
    case TransactionCategories.transfer:
      result = 'assets/icons/categories/transfer.png';
      break;
  }

  return result;
}
