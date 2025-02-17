import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';

import '/widgets/screens/financial_report/overview/quote_card.dart';
import '/widgets/screens/financial_report/overview/income_overview_card.dart';
import '/widgets/screens/financial_report/overview/budget_overview_card.dart';
import '/widgets/screens/financial_report/overview/expense_overview_card.dart';

class FinancialReportOverviewScreen extends StatefulWidget {
  const FinancialReportOverviewScreen({super.key});

  @override
  State<FinancialReportOverviewScreen> createState() =>
      _FinancialReportOverviewScreenState();
}

class _FinancialReportOverviewScreenState
    extends State<FinancialReportOverviewScreen> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  Color backgroundColor = const Color.fromRGBO(253, 60, 74, 1);
  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  void changeBackgroundColor(int storyIndex) {
    setState(() {
      backgroundColor = storyIndex == 0
          ? const Color.fromRGBO(253, 60, 74, 1)
          : (storyIndex == 1
              ? const Color.fromRGBO(0, 168, 107, 1)
              : const Color.fromRGBO(127, 61, 255, 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            Future.delayed(const Duration(seconds: 0), () {
              changeBackgroundColor(storyIndex);
            });
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: backgroundColor,
                    child: storyIndex == 0
                        ? const ExpenseOverviewCard()
                        : (storyIndex == 1
                            ? const IncomeOverviewCard()
                            : (storyIndex == 2
                                ? const BudgetOverviewCard()
                                : const QuoteCard())),
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ]);
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            return 0;
          },
          pageLength: 1,
          storyLength: (int pageIndex) {
            return 4;
          },
          indicatorHeight: 4,
          indicatorVisitedColor: Colors.white,
          indicatorUnvisitedColor: Colors.white.withOpacity(0.24),
          indicatorPadding: const EdgeInsets.symmetric(
            vertical: 19,
            horizontal: 14,
          ),
        ),
      ),
    );
  }
}
