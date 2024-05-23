import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ravenpay_assessment/api_services.dart';
import 'package:ravenpay_assessment/notifiers/current_timeframe_notifier.dart';
import 'package:ravenpay_assessment/notifiers/pice_history_notifier.dart';
import 'package:ravenpay_assessment/widgets/buy_sell_modal_sheet.dart';
import 'package:ravenpay_assessment/widgets/chart.dart';
import 'package:ravenpay_assessment/widgets/order_book.dart';
import 'package:ravenpay_assessment/widgets/recent_trades.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _currentView = 'Charts';
  late Future<void> _loadInitialPriceHistory;

  void _showBuySellBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const BuySellModalSheet(),
    );
  }

  @override
  void initState() {
    _loadInitialPriceHistory =
        ref.read(priceHistoryNotifier.notifier).updateState(
              ref.read(currentTimeframeNotifier),
            );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 24, 27),
      appBar: AppBar(
        leading: SvgPicture.asset(
          'assets/icons/logo.svg',
        ),
        title: const Text(
          'Sisyphus',
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/icons/bitmoji.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/icons/globe.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/icons/menu.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/bitcoin-usd-logo.svg',
                        ),
                        const Gap(8),
                        const Text(
                          'BTC/USDT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Gap(16),
                        SvgPicture.asset('assets/icons/drop-down-icon.svg'),
                        const Gap(23),
                        const Text(
                          '\$20,634',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 192, 118),
                          ),
                        ),
                      ],
                    ),
                    const Gap(14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/clock.svg'),
                                const Gap(4),
                                const Text(
                                  '24h change',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 167, 177, 188),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  '520.80',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  '+1.25%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            width: 10,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/up-arrow.svg'),
                                const Gap(4),
                                const Text(
                                  '24h high',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 167, 177, 188),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  '520.80',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  '+1.25%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            width: 10,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/down-arrow.svg'),
                                const Gap(4),
                                const Text(
                                  '24h low',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 167, 177, 188),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text(
                                  '520.80',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  '+1.25%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 192, 118),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              width: double.infinity,
              color: const Color.fromARGB(255, 28, 33, 39),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 33, 39),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentView = 'Charts';
                          });
                        },
                        child: Container(
                          width: 110,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: _currentView == 'Charts'
                                ? const Color.fromARGB(255, 38, 41, 50)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Charts',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentView = 'Orderbook';
                          });
                        },
                        child: Container(
                          width: 110,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: _currentView == 'Orderbook'
                                ? const Color.fromARGB(255, 38, 41, 50)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Orderbook',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentView = 'Recent trades';
                          });
                        },
                        child: Container(
                          width: 110,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: _currentView == 'Recent trades'
                                ? const Color.fromARGB(255, 38, 41, 50)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Recent trades',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            if (_currentView == 'Charts')
              FutureBuilder(
                  future: _loadInitialPriceHistory,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('An error Occurred'),
                      );
                    }
                    return const Chart();
                  }),
            if (_currentView == 'Orderbook') const OrderBookWidget(),
            if (_currentView == 'Recent trades') const RecentTrades(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 33, 39),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 38, 41, 50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Open Orders',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          onTap: () async {
                            await ApiServices().getOrderBookData();
                            // print(fafa);
                          },
                          child: Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Positions',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Order Hisroty',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 110,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Trade History',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(48, 184, 48, 54),
              child: Column(
                children: [
                  Text(
                    'No Open Orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromARGB(255, 167, 177, 188),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              color: const Color.fromARGB(255, 38, 41, 50),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 171,
                    child: ElevatedButton(
                      onPressed: _showBuySellBottomModalSheet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 37, 194, 110),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: ElevatedButton(
                      onPressed: _showBuySellBottomModalSheet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 85, 74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Sell',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
