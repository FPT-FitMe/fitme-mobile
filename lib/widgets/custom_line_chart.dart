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
        minY: 0,
        maxY: 7,
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
              FlSpot(0, 6),
              FlSpot(1, 6),
              FlSpot(2, 6),
              FlSpot(3, 6),
              FlSpot(4, 6),
              FlSpot(5, 6),
              FlSpot(6, 6),
            ],
            colors: [AppColors.primary],
            dotData: FlDotData(
              show: true,
            ),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 1),
              FlSpot(2, 2),
              FlSpot(3, 4),
              FlSpot(4, 3),
              FlSpot(5, 5),
              FlSpot(6, 5.5),
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
                .subtract(Duration(days: 42))
                .add(Duration(days: (value * 7).toInt()));
            return "${date.day}/${date.month}";
          } else if (value == 7) {
            return "Ngày";
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
                fontSize: 10,
              ),
          getTitles: (value) {
            if (value == 7) {
              return "kg";
            }
            return value.toInt().toString();
          }),
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
