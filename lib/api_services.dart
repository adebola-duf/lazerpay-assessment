import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ravenpay_assessment/models/candle_stick.dart';
import 'package:ravenpay_assessment/models/order.dart';
import 'package:ravenpay_assessment/models/price_history.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ApiServices {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://api.binance.com/api/v3/klines';

  Future<OrderBook> getOrderBookData() async {
    final uri = Uri.parse('https://api.binance.com/api/v3/depth').replace(
      queryParameters: {
        'symbol': 'BTCUSDT',
        'limit': '10',
      },
    );
    final response = await http.get(uri);
    final body = response.body;
    final mkk = OrderBook.fromJson(jsonDecode(body));
    // for (var ask in mkk.asks) {
    //   print(ask);
    // }
    // for (var bid in mkk.bids) {
    //   print(bid);
    // }
    return mkk;
  }

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

class RealTimeKlineHandler {
  final WebSocketChannel channel;
  final Function(CandleStick) onKlineClose;

  RealTimeKlineHandler({required this.channel, required this.onKlineClose}) {
    channel.stream.listen(
      (message) {
        final Map<String, dynamic> data = jsonDecode(message);
        final kline = data['k'];
        // print(kline);

        if (kline['x'] == true) {
          onKlineClose(
            CandleStick.fromJson(kline),
          );
        }
      },
    );
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
