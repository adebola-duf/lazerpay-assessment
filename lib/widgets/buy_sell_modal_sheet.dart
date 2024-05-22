import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuySellModalSheet extends StatelessWidget {
  const BuySellModalSheet({super.key});


@override
  Widget build(BuildContext context) {
   
        return Container(
            padding: EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
              // color: Color(0xff20252B),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.lightGreenAccent),
                                  borderRadius: const BorderRadius.all(
                                      (Radius.circular(4.0)))),
                              child: const Text(
                                'Buy',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all((Radius.circular(4.0)))),
                              child: const Text(
                                'Sell',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: const Text(
                        'Limit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: const Text(
                        'Market',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: const Text(
                        'Stop-Limit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Limit Price'),
                          Icon(Icons.info_outline)
                        ],
                      ),
                      Text('0.00 USD')
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text('Amount'), Icon(Icons.info_outline)],
                      ),
                      Text('0.00 USD')
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Text('Type'), Icon(Icons.info_outline)],
                      ),
                      Row(
                        children: [
                          Text('Good till cancelled'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Text('Post Only'),
                    Icon(Icons.info),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Text('0.00'),
                  ],
                ),
                Stack(
                  children: [
                    Expanded(
                        child: Image.asset(
                      'buttons.png',
                      height: 25.0,
                    )),
                    const Center(
                      child: Text('Buy BTC'),
                    )
                  ],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total account value',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [Text('NGN'), Icon(Icons.arrow_drop_down)],
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Open Orders',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Available',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(CupertinoColors.activeBlue),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Deposit',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
      
    );
  }


  
}