import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ravenpay_assessment/api_services.dart';
import 'package:ravenpay_assessment/models/candle_stick.dart';
import 'package:ravenpay_assessment/models/price_history.dart';

class PriceHistoryNotifier extends StateNotifier<PriceHistory> {
  PriceHistoryNotifier() : super(PriceHistory(candleStickHistory: []));

  Future<void> updateState(String currentTimeFrame) async {
    state = await ApiServices().getData(
      limit: 60,
      interval: currentTimeFrameToIntervalMap[currentTimeFrame]!,
    );
  }

  void addNewCandleStick(CandleStick newCandleStick) {
    final newCandleStickHistory = [
      ...state.candleStickHistory.sublist(1),
      newCandleStick
    ];


    state = PriceHistory(candleStickHistory: newCandleStickHistory);
  }
}

final priceHistoryNotifier =
    StateNotifierProvider<PriceHistoryNotifier, PriceHistory>(
  (ref) => PriceHistoryNotifier(),
);

final currentTimeFrameToIntervalMap = {
  '1H': '1m',
  '2H': '3m',
  '4H': '5m',
  '1D': '30m',
  '1W': '2h',
  '1M': '12h',
};
