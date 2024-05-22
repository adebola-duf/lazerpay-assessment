class OrderBook {
  final int lastUpdateId;
  final List<Order> bids;
  final List<Order> asks;

  OrderBook({
    required this.lastUpdateId,
    required this.bids,
    required this.asks,
  });

  factory OrderBook.fromJson(Map<String, dynamic> json) {
    return OrderBook(
      lastUpdateId: json['lastUpdateId'],
      bids: (json['bids'] as List<dynamic>)
          .map(
            (e) => Order.fromJson(e, 'bid'),
          )
          .toList(),
      asks: (json['asks'] as List<dynamic>)
          .map(
            (e) => Order.fromJson(e, 'ask'),
          )
          .toList(),
    );
  }
}

class Order {
  final String type;
  final double price;
  final double quantity;

  Order({
    required this.type,
    required this.price,
    required this.quantity,
  });

  factory Order.fromJson(List<dynamic> json, String type) {
    return Order(
      type: type,
      price: double.parse(json[0]),
      quantity: double.parse(json[1]),
    );
  }

  @override
  String toString() {
    return 'Order(type=$type, price=$price, qty=$quantity)';
  }
}
