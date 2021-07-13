import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/weight_log.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<WeightLog> listWeightLogs;
  const CustomLineChart({Key? key, required this.listWeightLogs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int min = listWeightLogs
        .reduce((curr, next) => curr.value < next.value ? curr : next)
        .value
        .floor();
    int max = listWeightLogs
        .reduce((curr, next) => curr.value > next.value ? curr : next)
        .value
        .ceil();
    double minDate = 0;
    double maxDate = 6;
    return LineChart(
      LineChartData(
        minX: minDate,
        maxX: maxDate,
        minY: min.toDouble(),
        maxY: max.toDouble(),
        titlesData: _getTilesData(min, max, minDate, maxDate),
        gridData: _getGridData(),
        borderData: _getBorderData(),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.transparent,
          ),
        ),
        lineBarsData: [
          // LineChartBarData(
          //   spots: [
          //     FlSpot(0, 65),
          //     FlSpot(1, 65),
          //     FlSpot(2, 65),
          //     FlSpot(3, 65),
          //     FlSpot(4, 65),
          //     FlSpot(5, 65),
          //     FlSpot(6, 65),
          //   ],
          //   colors: [AppColors.primary],
          //   dotData: FlDotData(
          //     show: true,
          //   ),
          // ),
          LineChartBarData(
            spots: listWeightLogs
                .asMap()
                .map((key, value) =>
                    MapEntry(key, FlSpot(key.toDouble(), value.value)))
                .values
                .toList(),
            colors: [Colors.blue[700] as Color],
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  _getTilesData(int min, int max, double minDate, double maxDate) {
    return FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (value) => TextStyle(
          fontFamily: 'SF-Pro-Display',
          color: AppColors.grayText,
          fontSize: 10,
        ),
        getTitles: (value) {
          if (value > minDate && value < maxDate) {
            DateTime date = listWeightLogs[value.toInt()].createdAt;
            return "${date.day}/${date.month}";
          } else if (value == maxDate) {
            return "Ngày";
          }
          return "";
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: (max - min) / listWeightLogs.length,
        getTextStyles: (value) => TextStyle(
          fontFamily: 'SF-Pro-Display',
          color: AppColors.grayText,
          fontSize: 10,
        ),
      ),
    );
  }

  _getGridData() {
    return FlGridData(
      drawHorizontalLine: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
    );
  }

  _getBorderData() {
    return FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
          color: Colors.black26,
        ),
        left: BorderSide(color: Colors.black26),
      ),
    );
  }
}
