import 'package:flutter/material.dart';

class BuySellModalSheet extends StatelessWidget {
  const BuySellModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 28,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('sell')
              ],
            ),
            Row(
              children: [
                Text('Limit'),
                Text('Market'),
                Text('Stop-limit'),
              ],
            ),
            TextField(
              
            )
          ],
        ),
      ),
    );
  }
}
