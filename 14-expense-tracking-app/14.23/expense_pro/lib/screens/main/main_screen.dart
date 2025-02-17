import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/providers/.providers.dart';

import '/widgets/screens/main/bottom_nav_bar.dart';
import '/widgets/screens/main/home/add_transactions_section.dart';

import 'home_screen.dart';
import 'budget_screen.dart';
import 'profile_screen.dart';
import 'transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController scrollController = ScrollController();
  Color appBarColor = const Color.fromRGBO(255, 246, 229, 1);

  @override
  void initState() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels > 293 &&
            appBarColor != Colors.white) {
          setState(() {
            appBarColor = Colors.white;
          });
        } else if (scrollController.position.pixels < 293 &&
            appBarColor != const Color.fromRGBO(255, 246, 229, 1)) {
          setState(() {
            appBarColor = const Color.fromRGBO(255, 246, 229, 1);
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAndNavigationManagementProvider>(
      builder: (
        context,
        userAndNavigationManagementProvider,
        child,
      ) {
        return Scaffold(
          appBar: userAndNavigationManagementProvider.activeScreen == 0
              ? AppBar(
                  backgroundColor: appBarColor,
                  toolbarHeight: 0,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.white,
                )
              : null,
          body: Stack(
            children: [
              // screens
              userAndNavigationManagementProvider.activeScreen == 0
                  ? HomeScreen(scrollController: scrollController)
                  : const SizedBox(),
              userAndNavigationManagementProvider.activeScreen == 1
                  ? const TransactionsScreen()
                  : const SizedBox(),
              userAndNavigationManagementProvider.activeScreen == 2
                  ? const BudgetScreen()
                  : const SizedBox(),
              userAndNavigationManagementProvider.activeScreen == 3
                  ? const ProfileScreen()
                  : const SizedBox(),
              userAndNavigationManagementProvider.isPlusTapped
                  ? AddTransactionsSection(
                      close: () {
                        if (userAndNavigationManagementProvider.isPlusTapped) {
                          userAndNavigationManagementProvider.onTapPlusButton();
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            width: 56,
            height: 56,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  userAndNavigationManagementProvider.onTapPlusButton();
                },
                backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
                shape: const CircleBorder(),
                elevation: 0,
                child: Transform.rotate(
                  angle:
                      userAndNavigationManagementProvider.isPlusTapped ? 90 : 0,
                  child: SvgPicture.asset('assets/icons/close.svg'),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            activeScreen: userAndNavigationManagementProvider.activeScreen,
            changeActiveScreen:
                userAndNavigationManagementProvider.changeActiveScreen,
          ),
        );
      },
    );
  }
}
