import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/utils/functions/format_money.dart';

import '/providers/.providers.dart';

class SpendFrequencyLineGraph extends StatelessWidget {
  const SpendFrequencyLineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transactionsProvider, _) {
        return transactionsProvider.spendingGraphData.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.spend_frequency,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(13, 14, 15, 1),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 185,
                      child: Chart(
                        layers: lineGraphLayers(
                          biggestExpenseAmount:
                              transactionsProvider.biggestExpenseAmount,
                          graphData: transactionsProvider.spendingGraphData,
                          context: context,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}

List<ChartLayer> lineGraphLayers({
  required double biggestExpenseAmount,
  required List<ChartLineDataItem> graphData,
  String Function(double, BuildContext)? labelX,
  double? xValueMax,
  double? xFrequency,
  required BuildContext context,
}) {
  return [
    ChartHighlightLayer(
      shape: () => ChartHighlightLineShape<ChartLineDataItem>(
        backgroundColor: const Color(0xFF331B6D),
        currentPos: (item) => item.currentValuePos,
        radius: const BorderRadius.all(Radius.circular(8.0)),
        width: 60.0,
      ),
    ),
    ChartAxisLayer(
      settings: ChartAxisSettings(
        x: ChartAxisSettingsAxis(
          frequency: xFrequency ?? 5,
          max: xValueMax ?? 31,
          min: 0,
          textStyle: GoogleFonts.inter(
            fontSize: 10,
            color: const Color.fromRGBO(127, 61, 255, 1),
          ),
        ),
        y: ChartAxisSettingsAxis(
          frequency: biggestExpenseAmount == 0 ? 1 : (biggestExpenseAmount / 5),
          max: biggestExpenseAmount,
          min: 0.0,
          textStyle: GoogleFonts.inter(
            fontSize: 10,
            color: const Color.fromRGBO(127, 61, 255, 1),
          ),
        ),
      ),
      labelX: (value) {
        if (labelX != null) {
          return labelX(value, context);
        } else {
          return value.toInt().toString();
        }
      },
      labelY: (value) => value.toInt().toString(),
    ),
    ChartLineLayer(
      items: graphData,
      settings: const ChartLineSettings(
        color: Color(0xFF8043F9),
        thickness: 4.0,
      ),
    ),
    ChartTooltipLayer(
      shape: () => ChartTooltipLineShape<ChartLineDataItem>(
        backgroundColor: Colors.white,
        circleBackgroundColor: Colors.white,
        circleBorderColor: const Color(0xFF331B6D),
        circleSize: 4.0,
        circleBorderThickness: 2.0,
        currentPos: (item) => item.currentValuePos,
        onTextValue: (item) => formatMoney(item.value, context),
        marginBottom: 6.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        radius: 6.0,
        textStyle: const TextStyle(
          color: Color(0xFF8043F9),
          letterSpacing: 0.2,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  ];
}

List<ChartLayer> pieCharLayers(
  {required List<ChartGroupPieDataItem> graphData, 
  required BuildContext context,
  
  }
) {
  return [
    ChartGroupPieLayer(
      items: List.generate(1, (_) => graphData),
      settings: const ChartGroupPieSettings(
        gapSweepAngle: 0,
        thickness: 20,
      ),
    ),
    ChartTooltipLayer(
      shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
        onTextName: (item) => item.label,
        onTextValue: (item) => formatMoney(item.amount,context),
        radius: 10.0,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12.0),
        nameTextStyle: const TextStyle(
          color: Color(0xFF8043F9),
          fontWeight: FontWeight.w700,
          height: 1.47,
          fontSize: 12.0,
        ),
        valueTextStyle: const TextStyle(
          color: Color(0xFF1B0E41),
          fontWeight: FontWeight.w700,
          fontSize: 12.0,
        ),
      ),
    )
  ];
}
