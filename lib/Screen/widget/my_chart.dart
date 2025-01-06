import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/Screen/controller/home_controller.dart';
import 'package:weather/Screen/model/five_hours_data.dart';


class MyChart extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveHoursData, String>>[
            SplineSeries<FiveHoursData, String>(
              dataSource: controller.fiveHoursData,
              xValueMapper: (FiveHoursData f, _) => f.dateTime,
              yValueMapper: (FiveHoursData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
