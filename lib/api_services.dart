import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lazerpay_assessment/models/candle_stick.dart';

class ApiServices {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://api.binance.com/api/v3/klines';

  Future<PriceHistory> getData({
    String? symbol,
    required String interval,
    int? limit,
    DateTime? startTime,
    DateTime? endTime,
  }) async {

    final params = {
      'symbol': symbol ?? 'BTCUSDT',
      'interval': interval,
    };

    if (limit != null) {
      params['limit'] = limit.toString();
    }
    if (startTime != null) {
      params['startTime'] = startTime.millisecondsSinceEpoch.toString();
    }
    if (endTime != null) {
      params['endTime'] = endTime.millisecondsSinceEpoch.toString();
    }

    final uri = Uri.parse(BASE_URL).replace(queryParameters: params);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return PriceHistory.fromResponseList(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }
}


  // Future List<Map<String, dynamic>> binanceResponseMap(List<dynamic> binanceData) {
  //   final List<Map<String, dynamic>> returnData = [];
  //   for (final candleStickFeatureslist in binanceData) {
  //     returnData.add(
  //       {
  //         "klineOpenTime": candleStickFeatureslist[0],
  //         "openPrice": candleStickFeatureslist[1],
  //         "highPrice": candleStickFeatureslist[2],
  //         "lowPrice": candleStickFeatureslist[3],
  //         "closePrice": candleStickFeatureslist[4],
  //         "volume": candleStickFeatureslist[5],
  //         "klineCloseTime": candleStickFeatureslist[6],
  //         "quoteAssetVolume": candleStickFeatureslist[7],
  //         "numberOfTrades": candleStickFeatureslist[8],
  //         "takerBuyBaseAssetVolume": candleStickFeatureslist[9],
  //         "takerBuyQuoteAssetVolume": candleStickFeatureslist[10],
  //       },
  //     );
  //   }
  //   return returnData;
  // }
