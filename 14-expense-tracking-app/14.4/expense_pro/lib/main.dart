import 'package:flutter/material.dart';

import 'screens/.pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      routes: {
        // account
        '/accounts-list': (_) => const AccountsListScreen(),
        '/account-detail': (_) => const AccountDetailScreen(),
        '/create-account': (_) => const CreateAccountScreen(),
        '/edit-account': (_) => const EditAccountScreen(),

        // budget
        '/budget-detail': (_) => const BudgetDetailScreen(),
        '/create-budget': (_) => const CreateBudgetScreen(),
        '/edit-budget': (_) => const EditBudgetScreen(),

        // expense
        '/expense-detail': (_) => const ExpenseDetailScreen(),
        '/create-expense': (_) => const CreateExpenseScreen(),

        // financial report
        '/financial-report-detail': (_) => const FinancialReportDetailScreen(),
        '/financial-report-overview': (_) =>
            const FinancialReportOverviewScreen(),

        // income
        '/income-detail': (_) => const IncomeDetailScreen(),
        '/create-income': (_) => const CreateIncomeScreen(),

        // initial
        '/all-done': (_) => const AllDoneScreen(),
        '/create-pin': (_) => const CreatePinScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/set-up-accounts': (_) => const SetUpAccountsScreen(),
        '/sign-up': (_) => const SignUpScreen(),

        // settings
        '/settings': (_) => const SettingsScreen(),
        '/currency-settings': (_) => const CurrencySettingsScreen(),
        '/language-settings': (_) => const LanguageSettingsScreen(),

        // transfer
        '/transfer-detail': (_) => const TransferDetailScreen(),
        '/create-transfer': (_) => const CreateTransferScreen(),

        // main
        '/main': (_) => const HomeScreen(),
        '/security-pin': (_) => const SecurityPinScreen(),
        // '/': (context) => const SplashScreen(),
        '/': (context) => const AllDoneScreen(),
      },
    );
  }
}
