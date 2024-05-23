import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ravenpay_assessment/api_services.dart';
import 'package:ravenpay_assessment/models/candle_stick.dart';
import 'package:ravenpay_assessment/notifiers/current_timeframe_notifier.dart';
import 'package:ravenpay_assessment/notifiers/pice_history_notifier.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Chart extends ConsumerStatefulWidget {
  const Chart({super.key});

  @override
  ConsumerState<Chart> createState() => _ChartState();
}

class _ChartState extends ConsumerState<Chart> {
  WebSocketChannel? _channel;
  String? currentOpenPrice;
  String? currentClosePrice;
  String? currentHighPrice;
  String? currentLowPrice;

  @override
  void initState() {
    _initWebSocket(ref.read(currentTimeframeNotifier));
    super.initState();
  }

  void _initWebSocket(String currentTimeFrame) {
    _channel?.sink.close();
    _channel = WebSocketChannel.connect(
      Uri.parse(
          'wss://stream.binance.com:9443/ws/btcusdt@kline_${currentTimeFrameToIntervalMap[currentTimeFrame]}'),
    );

    RealTimeKlineHandler(
      channel: _channel!,
      onKlineClose: (CandleStick newKline) {
        ref.read(priceHistoryNotifier.notifier).addNewCandleStick(newKline);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _initWebSocket(ref.watch(currentTimeframeNotifier));
    final priceHistoryData = ref.watch(priceHistoryNotifier).candleStickHistory;

    return Column(
      children: [
        const TimeFrameSelector(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color.fromARGB(255, 53, 57, 69),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16,
                    ),
                    child: Text(
                      'Trading view',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              const Text(
                'Depth',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromARGB(255, 167, 177, 188),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.67),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.transparent,
                  ),
                  child: SvgPicture.asset('assets/icons/drop-down-icon.svg'),
                ),
                const Gap(17.67),
                const Text(
                  'BTC/USD',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                const Gap(16),
                const Text(
                  '0',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                const Gap(4),
                const Text(
                  '36,641.54',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color.fromARGB(255, 0, 192, 118),
                  ),
                ),
                const Gap(16),
                const Text(
                  'H',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                const Gap(4),
                const Text(
                  '36,641.54',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color.fromARGB(255, 0, 192, 118),
                  ),
                ),
                const Gap(16),
                const Text(
                  'L',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                const Gap(4),
                const Text(
                  '36,641.54',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color.fromARGB(255, 0, 192, 118),
                  ),
                ),
                const Gap(16),
                const Text(
                  'C',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                const Gap(4),
                const Text(
                  '36,641.54',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color.fromARGB(255, 0, 192, 118),
                  ),
                ),
              ],
            ),
          ),
        ),
        MainChart(
          dataSource: priceHistoryData,
          key: ValueKey(priceHistoryData[0].openTime),
        ),
      ],
    );
  }
}

class MainChart extends StatefulWidget {
  const MainChart({
    super.key,
    required this.dataSource,
  });

  final List<CandleStick> dataSource;

  @override
  State<MainChart> createState() => _MainChartState();
}

class _MainChartState extends State<MainChart> {
  late TrackballBehavior candleStickChartTrackballBehaviour;
  late CrosshairBehavior _crosshairBehaviour;

  @override
  void initState() {
    candleStickChartTrackballBehaviour = TrackballBehavior(
      enable: true,
      // shouldAlwaysShow: true,
      activationMode: ActivationMode.singleTap,
      // tooltipSettings: const InteractiveTooltip(
      //   format: 'point.x : point.y',
      // ),
    );

    _crosshairBehaviour = CrosshairBehavior(
      // shouldAlwaysShow: true,
      enable: true,

      lineType: CrosshairLineType.both,
      lineDashArray: [5, 5],
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final minPrice = widget.dataSource
        .map((candle) => candle.low)
        .reduce((a, b) => a < b ? a : b);
    final maxPrice = widget.dataSource
        .map((candle) => candle.high)
        .reduce((a, b) => a > b ? a : b);
    return Column(
      children: [
        SfCartesianChart(
          crosshairBehavior: _crosshairBehaviour,
          trackballBehavior: candleStickChartTrackballBehaviour,
          zoomPanBehavior: ZoomPanBehavior(
            enableDoubleTapZooming: true,
            zoomMode: ZoomMode.x,
          ),
          primaryXAxis: const DateTimeAxis(
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            opposedPosition: true,
            majorGridLines: const MajorGridLines(width: 0),
            minimum: minPrice,
            maximum: maxPrice,
          ),
          series: <CartesianSeries>[
            CandleSeries<CandleStick, dynamic>(
              dataSource: widget.dataSource,
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
              onPointTap: (pointInteractionDetails) =>
                  print(pointInteractionDetails),
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
            title: AxisTitle(text: 'Volume'),
          ),
          series: <CartesianSeries>[
            ColumnSeries<CandleStick, DateTime>(
              dataSource: widget.dataSource,
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
  }
}

class TimeFrameSelector extends ConsumerStatefulWidget {
  const TimeFrameSelector({
    super.key,
  });

  @override
  ConsumerState<TimeFrameSelector> createState() => _TimeFrameSelectorState();
}

class _TimeFrameSelectorState extends ConsumerState<TimeFrameSelector> {
  List<String> timeFrames = ['1H', '2H', '4H', '1D', '1W', '1M'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Time',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromARGB(255, 167, 177, 188),
            ),
          ),
          for (final timeFrame in timeFrames)
            GestureDetector(
              onTap: () {
                ref
                    .read(currentTimeframeNotifier.notifier)
                    .updateCurrentTimeFrame(timeFrame);
                ref.read(priceHistoryNotifier.notifier).updateState(timeFrame);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                decoration: ShapeDecoration(
                  color: ref.watch(currentTimeframeNotifier) == timeFrame
                      ? const Color.fromARGB(255, 85, 92, 99)
                      : Colors.transparent,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  timeFrame,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color.fromARGB(255, 167, 177, 188),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
