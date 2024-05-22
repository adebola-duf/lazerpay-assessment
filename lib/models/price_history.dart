import 'package:ravenpay_assessment/models/candle_stick.dart';

class PriceHistory {
  final List<CandleStick> candleStickHistory;

  PriceHistory({
    required this.candleStickHistory,
  });

  factory PriceHistory.fromResponseList(List<dynamic> binanceResponse) {
    final List<CandleStick> candleStickHistory = binanceResponse
        .map((candleStickFeaturesList) =>
            CandleStick.fromCandleStickFeaturesList(candleStickFeaturesList))
        .toList();
    return PriceHistory(
      candleStickHistory: candleStickHistory,
    );
  }
}
