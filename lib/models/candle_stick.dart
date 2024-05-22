class CandleStick {
  CandleStick({
    required this.openTime,
    required this.volume,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });

  final int openTime;
  final double volume;
  final double open;
  final double close;
  final double high;
  final double low;

  factory CandleStick.fromCandleStickFeaturesList(List<dynamic> featuresList) {
    return CandleStick(
      // openTime: DateTime.fromMillisecondsSinceEpoch(
      //   featuresList[0],
      // ),
      openTime: featuresList[0],
      volume: double.parse(featuresList[5]),
      open: double.parse(featuresList[1]),
      close: double.parse(featuresList[4]),
      high: double.parse(featuresList[2]),
      low: double.parse(
        featuresList[3],
      ),
    );
  }

  factory CandleStick.fromJson(Map<String, dynamic> json){
    return CandleStick(
      openTime: json['t'],
      volume: double.parse(json['v']),
      open: double.parse(json['o']),
      close: double.parse(json['c']),
      high: double.parse(json['h']),
      low: double.parse(json['l']),
    );
  }

  @override
  String toString() {
    return "CandleStick('openTime': $openTime, 'volume': $volume, 'open': $open, 'close': $close, 'high': $high, 'low': $low)";
  }
}
