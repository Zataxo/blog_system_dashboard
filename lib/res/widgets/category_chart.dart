import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoriesChart extends StatelessWidget {
  const CategoriesChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    TooltipBehavior tooltip = TooltipBehavior(enable: true);
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: 'Category',
            gradient: const LinearGradient(
                colors: [Color(0xffFFB199), Color(0xffFF6A64)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            // color: const Color.fromRGBO(8, 142, 255, 1),
          )
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
