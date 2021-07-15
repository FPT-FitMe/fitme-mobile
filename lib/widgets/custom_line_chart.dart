import 'package:fitme/constants/colors.dart';
import 'package:fitme/models/target_weight.dart';
import 'package:fitme/models/weight_log.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<WeightLog> listWeightLogs;
  final TargetWeight target;
  const CustomLineChart({
    Key? key,
    required this.listWeightLogs,
    required this.target,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double targetWeight = target.targetWeight;
    int min = listWeightLogs
        .reduce((curr, next) => curr.value < next.value ? curr : next)
        .value
        .floor();
    int max = listWeightLogs
        .reduce((curr, next) => curr.value > next.value ? curr : next)
        .value
        .ceil();
    if (max == min) {
      max = min + 1;
    }
    if (min > targetWeight) {
      min = (targetWeight - 1).toInt();
    }
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
            tooltipBgColor: Colors.white,
            showOnTopOfTheChartBoxArea: true,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, targetWeight),
              FlSpot(1, targetWeight),
              FlSpot(2, targetWeight),
              FlSpot(3, targetWeight),
              FlSpot(4, targetWeight),
              FlSpot(5, targetWeight),
            ],
            colors: [AppColors.primary],
            dotData: FlDotData(
              show: true,
            ),
          ),
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
          if (value > minDate &&
              value < maxDate &&
              value < listWeightLogs.length) {
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
      // horizontalInterval: 1,
      // verticalInterval: 1,
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
