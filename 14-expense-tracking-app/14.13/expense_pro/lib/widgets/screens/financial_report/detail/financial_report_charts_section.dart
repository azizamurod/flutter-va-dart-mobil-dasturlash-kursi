import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '/widgets/screens/main/home/spend_frequency_line_graph.dart';

class FinancialReportChartsSection extends StatelessWidget {
  const FinancialReportChartsSection({
    super.key,
    required this.isLineGraph,
  });

  final bool isLineGraph;
  @override
  Widget build(BuildContext context) {
    return isLineGraph
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$ 332',
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
                    layers: lineGraphLayers(),
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
                  layers: pieCharLayers(),
                ),
                Text(
                  '\$ 332',
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
