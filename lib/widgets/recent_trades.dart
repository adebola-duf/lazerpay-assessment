import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RecentTrades extends StatefulWidget {
  const RecentTrades({super.key});

  @override
  State<RecentTrades> createState() => _RecentTradesState();
}

class _RecentTradesState extends State<RecentTrades> {
  String btcUsdtPrice = "0";

  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@kline_1m'),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "BTC/USDT Price",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    '0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 250, 194, 25),
                        fontSize: 30),
                  );
                }
                final message = jsonDecode(snapshot.data!);
                print(message['k']['x']);
                if (message['k']['x'] == true) {
                  print(message);
                }

                return Text(
                  btcUsdtPrice,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 194, 25),
                      fontSize: 30),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
