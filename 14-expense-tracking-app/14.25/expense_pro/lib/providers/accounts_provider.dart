import '/data/models/account_model.dart';
import '/data/models/transaction_model.dart';
import '/utils/contants/transaction_categories.dart';
import '/utils/contants/transaction_types.dart';

import 'package:flutter/material.dart';

import '/data/drift/drift_db.dart';

import '/utils/functions/show_error_alert.dart';
import '/widgets/dialogs/show_deleted_dialog.dart';
import '/utils/functions/format_double_string.dart';

class AccountsProvider with ChangeNotifier {
  final DriftDb driftDb = DriftDb();

  TextEditingController _accountBalanceController =
      TextEditingController(text: '0');
  TextEditingController _accountNameController = TextEditingController();

  TextEditingController get accountBalanceController =>
      _accountBalanceController;
  TextEditingController get accountNameController => _accountNameController;

  double _accountsBalance = 0;
  List<Account> _accounts = [];
  Account? _detailAccount;

  double get accountsBalance => _accountsBalance;
  List<Account> get accounts => _accounts;
  Account? get detailAccount => _detailAccount;

  /// create screen
  void createAccount(
    BuildContext context, {
    bool isInitialScreen = false,
  }) async {
    if (_accountNameController.text.isEmpty) {
      showErrorAlert(context, 'Please enter account name !');
    } else {
      await driftDb.createAccount(
        name: _accountNameController.text,
        initialBalance: double.tryParse(_accountBalanceController.text),
      );
      if (isInitialScreen) {
        Navigator.pop(context);
        Navigator.popAndPushNamed(context, '/all-done');
      } else {
        getDataForAccountsListScreen();
        Navigator.pop(context);
      }
      resetCreateAccountScreen();
    }
  }

  void resetCreateAccountScreen() {
    _accountBalanceController = TextEditingController(text: '0');
    _accountNameController = TextEditingController();
  }

  /// accounts list
  Future<void> getAllAccounts() async {
    _accounts = await driftDb.getAllAccounts();
    notifyListeners();
  }

  void getDataForAccountsListScreen() async {
    await getAllAccounts();
    _accountsBalance = _accounts.fold(
      0,
      (sum, account) => sum + account.balance,
    );
    notifyListeners();

    driftDb.createTransaction(
      TransactionModel(
        type: TransactionTypes.expense,
        category: TransactionCategories.shopping,
        account: AccountModel(id: 1, name: '', balance: 0),
        description: 'Buy some grpcery',
        amount: 40,
        createdDateTime: DateTime(2025, 3, 7),
      ),
    );
    driftDb.createTransaction(
      TransactionModel(
        type: TransactionTypes.expense,
        category: TransactionCategories.shopping,
        account: AccountModel(id: 1, name: '', balance: 0),
        description: 'Buy some grpcery',
        amount: 60,
        createdDateTime: DateTime(2025, 5, 7),
      ),
    );
    driftDb.createTransaction(
      TransactionModel(
        type: TransactionTypes.expense,
        category: TransactionCategories.shopping,
        account: AccountModel(id: 1, name: '', balance: 0),
        description: 'Buy some grpcery',
        amount: 120,
        createdDateTime: DateTime(2025, 7, 15),
      ),
    );
    driftDb.createTransaction(
      TransactionModel(
        type: TransactionTypes.expense,
        category: TransactionCategories.shopping,
        account: AccountModel(id: 1, name: '', balance: 0),
        description: 'Buy some grpcery',
        amount: 10,
        createdDateTime: DateTime(2025, 9, 20),
      ),
    );
  }

  /// account detail
  void initializeAccountDetailScreen(Account account) {
    _detailAccount = account;
  }

  /// edit account
  void initializeEditAccountScreen() {
    _accountBalanceController = TextEditingController(
      text: formatDoubleString((_detailAccount?.balance ?? 0)),
    );
    _accountNameController = TextEditingController(
      text: _detailAccount?.name ?? '',
    );
  }

  void editAccount(BuildContext context) async {
    if (_accountNameController.text.isEmpty) {
      showErrorAlert(context, 'Please enter account name !');
    } else {
      await driftDb.editAccount(
        id: _detailAccount!.id,
        name: _accountNameController.text,
        balance: double.tryParse(_accountBalanceController.text) ?? 0,
      );
      _detailAccount = Account(
        id: _detailAccount!.id,
        name: _accountNameController.text,
        balance: double.tryParse(_accountBalanceController.text) ?? 0,
      );
      notifyListeners();
      getDataForAccountsListScreen();
      Navigator.pop(context);
      resetCreateAccountScreen();
    }
  }

  void removeAccount(BuildContext context) async {
    if (_accounts.length == 1) {
      Navigator.pop(context);
      showErrorAlert(
        context,
        'You can not remove this account ! Create new account, then remove this one !',
      );
      notifyListeners();
    } else {
      await driftDb.deleteAccount(_detailAccount!.id);
      getDataForAccountsListScreen();
      Navigator.popUntil(context, ModalRoute.withName('/accounts-list'));
      showDeletedDialog(context: context, text: 'Account');
    }
  }
}
