import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:google_fonts/google_fonts.dart';

import '/providers/.providers.dart';

import '/utils/functions/format_date_time.dart';
import '/utils/functions/format_double_string.dart';

import '/widgets/screens/main/home/spend_frequency_line_graph.dart';

class FinancialReportChartsSection extends StatelessWidget {
  const FinancialReportChartsSection({
    super.key,
    required this.reportsProvider,
  });

  final ReportsProvider reportsProvider;
  @override
  Widget build(BuildContext context) {
    if (reportsProvider.lineGraphData.isEmpty) return const SizedBox();

    return reportsProvider.isLineGraph
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ ${formatDoubleString(reportsProvider.allExpenseAmount)}',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 170,
                  child: Chart(
                    layers: lineGraphLayers(
                      biggestExpenseAmount:
                          reportsProvider.biggestExpenseAmount,
                      graphData: reportsProvider.lineGraphData,
                      xValueMax:
                          reportsProvider.selectedMonth != null ? 31 : 372,
                      xFrequency:
                          reportsProvider.selectedMonth != null ? 5 : 31,
                      labelX: reportsProvider.selectedMonth != null
                          ? null
                          : genMonthForXAxis,
                    ),
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Chart(
                  layers: pieCharLayers(reportsProvider.pieChartData),
                ),
                Text(
                  '\$ ${formatDoubleString(reportsProvider.allExpenseAmount)}',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }
}
