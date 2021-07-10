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
        maxX: 7,
        minY: 60,
        maxY: 65,
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
              FlSpot(0, 65),
              FlSpot(1, 65),
              FlSpot(2, 65),
              FlSpot(3, 65),
              FlSpot(4, 65),
              FlSpot(5, 65),
              FlSpot(6, 65),
            ],
            colors: [AppColors.primary],
            dotData: FlDotData(
              show: true,
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 60),
              FlSpot(1, 61),
              FlSpot(2, 61.5),
              FlSpot(3, 61),
              FlSpot(4, 62),
              FlSpot(5, 63),
              FlSpot(6, 64.5),
            ],
            colors: [Colors.blue[700] as Color],
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }

  _getTilesData() {
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
          if (value > 0 && value < 7) {
            var today = DateTime.now();
            var date = today
                .subtract(Duration(days: 49))
                .add(Duration(days: (value * 7).toInt()));
            return "${date.day}/${date.month}";
          } else if (value == 7) {
            return "Tuần";
          }
          return "";
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (value) => TextStyle(
            fontFamily: 'SF-Pro-Display',
            color: AppColors.grayText,
            fontSize: 10),
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
