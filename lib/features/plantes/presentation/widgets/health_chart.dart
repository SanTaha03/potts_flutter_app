import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HealthChart extends StatelessWidget {
  const HealthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 3),
              FlSpot(1, 5),
              FlSpot(2, 4),
              FlSpot(3, 6.5),
              FlSpot(4, 5.5),
              FlSpot(5, 7),
              FlSpot(6, 8),
            ],
            isCurved: true,
            color: const Color(0xFF6DA5D9), // Blue line color
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
