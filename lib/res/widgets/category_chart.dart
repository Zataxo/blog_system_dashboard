import 'package:blog_system_dashboard/model/category_model.dart';
import 'package:blog_system_dashboard/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoriesChart extends StatelessWidget {
  const CategoriesChart({
    super.key,
    required this.categoryList,
  });
  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    TooltipBehavior tooltip = TooltipBehavior(enable: true);
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: tooltip,
        series: <ChartSeries<CategoryModel, String>>[
          ColumnSeries<CategoryModel, String>(
            dataSource: categoryList,
            xValueMapper: (CategoryModel data, _) => data.name,
            yValueMapper: (CategoryModel data, _) =>
                context.read<PostsViewModel>().getMostCategoryPost(data.id),
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
