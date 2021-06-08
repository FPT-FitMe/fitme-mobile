import 'package:fitme/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 24,
        minY: 0,
        maxY: 60,
        titlesData: _getTilesData(),
        gridData: _getGridData(),
        borderData: _getBorderData(),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.transparent,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(6, 24),
              FlSpot(12, 40),
              FlSpot(14.5, 60),
              FlSpot(18, 24),
              FlSpot(24, 24),
            ],
            isCurved: true,
            colors: [AppColors.primary],
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }

  _getTilesData() {
    return FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        interval: 6,
        getTextStyles: (value) => TextStyle(
            fontFamily: 'SF-Pro-Display',
            color: AppColors.grayText,
            fontSize: 10),
        getTitles: (value) {
          String hour = value.toInt().toString();
          if (value == 0) {
            return "";
          } else if (value > 0 && value < 10) {
            return "0$hour:00";
          }
          return "$hour:00";
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 20,
        getTextStyles: (value) => TextStyle(
            fontFamily: 'SF-Pro-Display',
            color: AppColors.grayText,
            fontSize: 10),
        getTitles: (value) {
          if (value == 0) {
            return "";
          }
          return value.toInt().toString();
        },
      ),
    );
  }

  _getGridData() {
    return FlGridData(
      show: false,
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
