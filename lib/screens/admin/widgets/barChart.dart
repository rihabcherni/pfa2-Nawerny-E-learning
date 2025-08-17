import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class BarChartComponent extends StatelessWidget {
  final int year;
  final List<int> countsByMonth;

  const BarChartComponent({
    Key? key,
    required this.year,
    required this.countsByMonth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int maxCount = countsByMonth.reduce((a, b) => a > b ? a : b);
    int interval =
        (maxCount / 4).ceil();

    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
        gridData: FlGridData(
            drawHorizontalLine: true,
            horizontalInterval: interval.toDouble()),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) =>  TextStyle(
              color: Colors.grey,
              fontSize:
                  context.watch<SettingsProvider>().settings.smallTextSize,
            ),
            getTitles: (value) {
              return value.toInt().toString();
            },
            reservedSize: 30,
            margin: 10, 
            interval: interval.toDouble(), 
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) =>  TextStyle(
              color: Colors.grey,
              fontSize:
                  context.watch<SettingsProvider>().settings.smallTextSize,
            ),
            getTitles: (value) {
              final List<String> months = [
                'JAN',
                'FEB',
                'MAR',
                'APR',
                'MAY',
                'JUN',
                'JUL',
                'AUG',
                'SEP',
                'OCT',
                'NOV',
                'DEC'
              ];
              if (value.toInt() >= 0 && value.toInt() < months.length) {
                return months[value.toInt()];
              } else {
                return '';
              }
            },
          ),
        ),
        barGroups: _buildBarGroups(),
      ),
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < countsByMonth.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i.toInt(),
          barRods: [
            BarChartRodData(
                y: countsByMonth[i].toDouble(),
                colors: [Color.fromARGB(255, 2, 44, 141)],
                borderRadius: BorderRadius.circular(0),
                width: 10,
                backDrawRodData: BackgroundBarChartRodData(
                    show: true, colors: [AppColors.barBg])),
          ],
        ),
      );
    }

    return barGroups;
  }
}
