enum TransactionCategories {
  /// income
  salary,
  passiveIncome,
  businessProfits,
  gifts,
  governmentPayments,
  other,

  /// expense
  food,
  shopping,
  transportation,
  subscriptions,
  housing,
  insurance,
  entertainment,
  healthcare,
  travel,
  education,
  financialExpenses,
  familyAndKids,
  pets,
  personalCare,
  donations,
  miscellaneous,

  /// transfer
  transfer,
}

final List<TransactionCategories> expenseCategoriesList = [
  TransactionCategories.food,
  TransactionCategories.shopping,
  TransactionCategories.transportation,
  TransactionCategories.subscriptions,
  TransactionCategories.housing,
  TransactionCategories.insurance,
  TransactionCategories.entertainment,
  TransactionCategories.healthcare,
  TransactionCategories.travel,
  TransactionCategories.education,
  TransactionCategories.financialExpenses,
  TransactionCategories.familyAndKids,
  TransactionCategories.pets,
  TransactionCategories.personalCare,
  TransactionCategories.donations,
  TransactionCategories.miscellaneous,
];

final List<TransactionCategories> incomeCategoriesList = [
  TransactionCategories.salary,
  TransactionCategories.passiveIncome,
  TransactionCategories.businessProfits,
  TransactionCategories.gifts,
  TransactionCategories.governmentPayments,
  TransactionCategories.other,
];
