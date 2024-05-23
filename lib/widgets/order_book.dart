import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ravenpay_assessment/api_services.dart';
import 'package:ravenpay_assessment/models/order.dart';

class OrderBookWidget extends StatefulWidget {
  const OrderBookWidget({super.key});

  @override
  State<OrderBookWidget> createState() => _OrderBookWidgetState();
}

class _OrderBookWidgetState extends State<OrderBookWidget> {
  late Future<OrderBook> orderBookData;
  @override
  void initState() {
    orderBookData = ApiServices().getOrderBookData();
    super.initState();
  }

  void _refreshOrderBookData() {
    setState(() {
      orderBookData = ApiServices().getOrderBookData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FutureBuilder(
        future: orderBookData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error${snapshot.error}',
              ),
            );
          }
          return Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: _refreshOrderBookData,
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              const Gap(10),
              Table(children: const [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 17.0),
                        child: Center(
                          child: Text(
                            'Price\n(USDT)',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromARGB(255, 167, 177, 188),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 17.0),
                        child: Center(
                          child: Text(
                            'Amount\n(BTC)',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromARGB(255, 167, 177, 188),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 17.0),
                        child: Center(
                          child: Text(
                            'Total',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromARGB(255, 167, 177, 188),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              OrderTable(orders: snapshot.data!),
            ],
          );
        },
      ),
    );
  }
}

class OrderTableCell extends StatelessWidget {
  const OrderTableCell({super.key, required this.value, this.color});

  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 17.0),
        child: Center(
          child: Text(
            value,
            style: TextStyle(color: color ?? Colors.white),
          ),
        ),
      ),
    );
  }
}

class OrderTable extends StatelessWidget {
  const OrderTable({
    super.key,
    required this.orders,
  });
  final OrderBook orders;

  TableRow _buildTableRow(Order order, Color color) {
    return TableRow(
      children: [
        OrderTableCell(
          value: order.price.toStringAsFixed(2),
          color: color,
        ),
        OrderTableCell(value: order.quantity.toStringAsFixed(6)),
        OrderTableCell(
            value: (order.price * order.quantity).toStringAsFixed(2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Asks',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const Gap(10),
                Table(
                  children: [
                    for (var order in orders.asks)
                      _buildTableRow(
                          order, const Color.fromARGB(255, 255, 104, 56)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Gap(20),
        const Divider(),
        const Gap(20),
        SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bids',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 37, 194, 110),
                  ),
                ),
                const Gap(10),
                Table(
                  children: [
                    for (var order in orders.bids)
                      _buildTableRow(
                        order,
                        const Color.fromARGB(255, 37, 194, 110),
                      ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
