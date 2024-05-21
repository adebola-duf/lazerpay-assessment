import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazerpay_assessment/api_services.dart';
import 'package:lazerpay_assessment/widgets/buy_sell_modal_sheet.dart';
import 'package:lazerpay_assessment/widgets/chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showBuySellBottomModalSheet() {
    showModalBottomSheet(
      
      context: context,
      builder: (ctx) => const BuySellModalSheet(),
    );
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
            const TimeFrameSelector(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color.fromARGB(255, 53, 57, 69),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        child: Text(
                          'Trading view',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    'Depth',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromARGB(255, 167, 177, 188),
                    ),
                  ),
                ],
              ),
            ),
            const Chart(),
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
                            final fafa = await ApiServices().getData(
                                symbol: 'BTCUSDT', interval: '1h', limit: 5);
                            print(fafa.candleStickHistory);
                            print(fafa.candleStickHistory.length);
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

class TimeFrameChips extends StatelessWidget {
  const TimeFrameChips({
    super.key,
    required this.text,
    required this.onTap,
    required this.selectedTimeframe,
  });
  final String text;
  final void Function(String text) onTap;
  final String selectedTimeframe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        decoration: ShapeDecoration(
          color: selectedTimeframe == text
              ? const Color.fromARGB(255, 85, 92, 99)
              : Colors.transparent,
          shape: const StadiumBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromARGB(255, 167, 177, 188),
          ),
        ),
      ),
    );
  }
}

class TimeFrameSelector extends StatefulWidget {
  const TimeFrameSelector({
    super.key,
  });

  @override
  State<TimeFrameSelector> createState() => _TimeFrameSelectorState();
}

class _TimeFrameSelectorState extends State<TimeFrameSelector> {
  String selectedTimeframe = '1H';
  List<String> timeFrames = ['1H', '2H', '4H', '1D', '1W', '1M'];

  void _setTimeframe(String timeframe) {
    setState(() {
      selectedTimeframe = timeframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Time',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromARGB(255, 167, 177, 188),
            ),
          ),
          for (final timeFrame in timeFrames)
            TimeFrameChips(
              text: timeFrame,
              onTap: _setTimeframe,
              selectedTimeframe: selectedTimeframe,
            ),
        ],
      ),
    );
  }
}

class WebsocketDemo extends StatefulWidget {
  const WebsocketDemo({super.key});

  @override
  State<WebsocketDemo> createState() => _WebsocketDemoState();
}

class _WebsocketDemoState extends State<WebsocketDemo> {
  String btcUsdtPrice = "0";
  // final channel = IOWebSocketChannel.connect(
  //     'wss://stream.binance.com:9443/ws/btcusdt@trade');
  @override
  void initState() {
    super.initState();
    // streamListener();
  }

  // streamListener() {
  //   channel.stream.listen((message) {
  //     print(message);
  //     // channel.sink.add('received!');
  //     // channel.sink.close(status.goingAway);
  //     Map getData = jsonDecode(message);
  //     print(getData);
  //     setState(() {
  //       btcUsdtPrice = getData['p'];
  //     });
  //     // print(getData['p']);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "BTC/USDT Pricnne",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              btcUsdtPrice,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 194, 25),
                  fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
