// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class BuySellModalSheet extends StatelessWidget {
//   const BuySellModalSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12.0),
//           topRight: Radius.circular(12.0),
//         ),
//         // color: Color(0xff20252B),
//       ),
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.black12,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(12.0),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.lightGreenAccent),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(4.0),
//                       ),
//                     ),
//                     child: const Text(
//                       'Buy',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(4.0),
//                       ),
//                     ),
//                     child: const Text(
//                       'Sell',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Limit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Market',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Stop-Limit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.blueGrey, width: 0.5),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(12.0),
//               ),
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [Text('Limit Price'), Icon(Icons.info_outline)],
//                 ),
//                 Text('0.00 USD')
//               ],
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(f
//               border: Border.all(color: Colors.blueGrey, width: 0.5),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(12.0),
//               ),
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text('Amount'),
//                     Icon(Icons.info_outline),
//                   ],
//                 ),
//                 Text('0.00 USD')
//               ],
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.blueGrey, width: 0.5),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(12.0),
//               ),
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text('Type'),
//                     Icon(Icons.info_outline),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text('Good till cancelled'),
//                     Icon(Icons.arrow_drop_down)
//                   ],
//                 )
//               ],
//             ),
//           ),
//           const Row(
//             children: [
//               Checkbox(value: false, onChanged: null),
//               Text('Post Only'),
//               Icon(Icons.info),
//             ],
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Total'),
//               Text('0.00'),
//             ],
//           ),
//           Stack(
//             children: [
//               Expanded(
//                 child: Image.asset(
//                   'buttons.png',
//                   height: 25.0,
//                 ),
//               ),
//               const Center(
//                 child: Text('Buy BTC'),
//               )
//             ],
//           ),
//           const Divider(),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     'Total account value',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                   Text(
//                     '0.00',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('NGN'),
//                   Icon(Icons.arrow_drop_down),
//                 ],
//               )
//             ],
//           ),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     'Open Orders',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                   Text(
//                     '0.00',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Text(
//                     'Available',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                   Text(
//                     '0.00',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           TextButton(
//             onPressed: null,
//             style: ButtonStyle(
//               backgroundColor:
//                   WidgetStateProperty.all(CupertinoColors.activeBlue),
//               shape: WidgetStateProperty.all(
//                 const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(4.0),
//                   ),
//                 ),
//               ),
//             ),
//             child: const Text(
//               'Deposit',
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuySellModalSheet extends StatefulWidget {
  const BuySellModalSheet({super.key});

  @override
  State<BuySellModalSheet> createState() => _BuySellModalSheetState();
}

class _BuySellModalSheetState extends State<BuySellModalSheet> {
  bool _buyIsCurrentView = true;

  final TextEditingController _amountTextContoller = TextEditingController();

  @override
  void dispose() {
    _amountTextContoller.dispose();
    super.dispose();
  }

  void _showFlushBar() {
    FocusManager.instance.primaryFocus?.unfocus();
    Flushbar(
      animationDuration: const Duration(milliseconds: 800),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      backgroundColor: const Color.fromARGB(255, 32, 37, 43),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      messageText: Text(
        _buyIsCurrentView
            ? 'You have bought ${_amountTextContoller.text} BTC'
            : 'You have sold ${_amountTextContoller.text} BTC',
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      duration: const Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(Icons.notifications),
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(34, 8, 34, 8),
      height: MediaQuery.sizeOf(context).height * .55 +
          MediaQuery.viewInsetsOf(context).bottom,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 37, 43),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _buyIsCurrentView = true;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: _buyIsCurrentView
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 37, 194, 110),
                              ),
                            )
                          : const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                      child: const Center(
                        child: Text('Buy'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _buyIsCurrentView = false;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: !_buyIsCurrentView
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 255, 85, 74),
                              ),
                            )
                          : const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color.fromARGB(255, 30, 30, 30),
                            ),
                      child: const Center(
                        child: Text('Sell'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Limit'),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 53, 57, 69),
                  ),
                  child: const Text('Market'),
                ),
                const Text('Stop-Limit'),
              ],
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 55, 59, 63),
                  width: 0.5,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text('Amount'),
                      Gap(4),
                      Icon(
                        Icons.info_outline,
                        size: 12,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: TextField(
                        controller: _amountTextContoller,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  const Text('0.00 USD')
                ],
              ),
            ),
            const Gap(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('500'),
              ],
            ),
            const Gap(12),
            GestureDetector(
              onTap: _showFlushBar,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 72, 59, 235),
                      Color.fromARGB(255, 120, 71, 225),
                      Color.fromARGB(225, 221, 86, 141),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(_buyIsCurrentView ? 'Buy BTC' : 'Sell BTC'),
                ),
              ),
            ),
            const Gap(11),
            const Divider(),
            const Gap(15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total account value',
                  style: TextStyle(fontSize: 12),
                ),
                Text('NGN'),
              ],
            ),
            const Gap(8),
            const Text(
              '0.00',
              style: TextStyle(color: Colors.white),
            ),
            const Gap(16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Open Orders',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Available',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Gap(8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0.00',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '0.00',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Gap(28),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 100, 255),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Deposit'),
            ),
          ],
        ),
      ),
    );
  }
}
