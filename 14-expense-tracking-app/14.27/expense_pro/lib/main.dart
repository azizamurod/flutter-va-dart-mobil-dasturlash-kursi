import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/.pages.dart';
import '/data/hive/hive_db.dart';
import '/providers/.providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDb.initHive();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountsProvider()),
        ChangeNotifierProvider(create: (_) => BudgetsProvider()),
        ChangeNotifierProvider(create: (_) => ReportsProvider()),
        ChangeNotifierProvider(create: (_) => TransactionsProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(
            create: (_) => UserAndNavigationManagementProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return MaterialApp(
          title: 'Expense Pro',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
          ),
          locale: settingsProvider.locale,
          supportedLocales: const [Locale('uz'), Locale('en'), Locale('ru')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
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
            '/financial-report-detail': (_) =>
                const FinancialReportDetailScreen(),
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
            '/main': (_) => const MainScreen(),
            '/security-pin': (_) => const SecurityPinScreen(),
            '/': (context) => const SplashScreen(),
          },
        );
      },
    );
  }
}

/// flutter pub run build_runner build --delete-conflicting-outputs