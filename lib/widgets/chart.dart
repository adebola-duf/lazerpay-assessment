import 'package:flutter/material.dart';
import 'package:lazerpay_assessment/api_services.dart';
import 'package:lazerpay_assessment/models/candle_stick.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late TrackballBehavior candleStickChartTrackballBehaviour;

  late Future<PriceHistory> itemChart;
  late CrosshairBehavior crosshairBehaviour;

  @override
  void initState() {
    itemChart = ApiServices().getData(interval: '1h', limit: 30);
    candleStickChartTrackballBehaviour = TrackballBehavior(
      enable: true,
      shouldAlwaysShow: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        format: 'point.x : point.y',
      ),
    );

    crosshairBehaviour = CrosshairBehavior(
      shouldAlwaysShow: true,
      enable: true,
      lineType: CrosshairLineType.both,
      lineDashArray: [5, 5],
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemChart,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return Column(
          children: [
            SfCartesianChart(
              // onChartTouchInteractionUp: (args) => print(args.position.dx),
              crosshairBehavior: crosshairBehaviour,
              trackballBehavior: candleStickChartTrackballBehaviour,
              zoomPanBehavior: ZoomPanBehavior(
                enableDoubleTapZooming: true,
                zoomMode: ZoomMode.x,
              ),
              title: const ChartTitle(text: 'BTC/USDT Price History'),
              primaryXAxis: const DateTimeAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                opposedPosition: true,
                majorGridLines: MajorGridLines(width: 0),
                title: AxisTitle(text: 'Price'),
              ),
              series: <CartesianSeries>[
                CandleSeries<CandleStick, dynamic>(
                  dataSource: snapshot.data!.candleStickHistory,
                  enableSolidCandles: true,
                  enableTooltip: true,
                  bullColor: Colors.green,
                  bearColor: Colors.red,
                  xValueMapper: (CandleStick sales, _) =>
                      DateTime.fromMillisecondsSinceEpoch(sales.openTime),
                  lowValueMapper: (CandleStick sales, _) => sales.low,
                  highValueMapper: (CandleStick sales, _) => sales.high,
                  openValueMapper: (CandleStick sales, _) => sales.open,
                  closeValueMapper: (CandleStick sales, _) => sales.close,
                  animationDuration: 55,
                  onPointTap: (pointInteractionDetails) => print(pointInteractionDetails),
                ),
              ],
            ),
            SfCartesianChart(
              trackballBehavior: candleStickChartTrackballBehaviour,
              zoomPanBehavior: ZoomPanBehavior(
                enableDoubleTapZooming: true,
                zoomMode: ZoomMode.x,
              ),
              primaryXAxis: const DateTimeAxis(
                // labelPosition: ChartDataLabelPosition.inside,
                majorGridLines: MajorGridLines(width: 0),
                title: AxisTitle(text: 'Date'),
                // intervalType: ,
              ),
              primaryYAxis: const NumericAxis(
                opposedPosition: true,
                majorGridLines: MajorGridLines(width: 0),
                title: AxisTitle(text: 'Price'),
              ),
              series: <CartesianSeries>[
                ColumnSeries<CandleStick, DateTime>(
                  dataSource: snapshot.data!.candleStickHistory,
                  xValueMapper: (CandleStick sales, _) =>
                      DateTime.fromMillisecondsSinceEpoch(sales.openTime),
                  yValueMapper: (CandleStick sales, _) => sales.volume,
                  color: Colors.green.withOpacity(0.5),
                  pointColorMapper: (datum, index) =>
                      datum.close > datum.open ? Colors.green : Colors.red,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
