import 'package:flutter/material.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';

class TradesCard extends StatelessWidget {
  final int index;
  final double currentPrice, openPrice, profit;
  final String symbol;

  const TradesCard(
      {super.key,
      required this.index,
      required this.currentPrice,
      required this.openPrice,
      required this.profit,
      required this.symbol});

  @override
  Widget build(BuildContext context) {
    bool isProfit = (profit < 0.0) ? false : true;
    return Card(
      color: isProfit ? green : red,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Symbol: $symbol',
                    style: TxtStyle(15, white, FontWeight.w700)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(border: Border.all(color: white, width: 2)),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Price: $currentPrice',
                        style: TxtStyle(15, white, FontWeight.w500)),
                    const VerticalDivider(
                      color: white,
                      thickness: 2,
                      width: 0,
                    ),
                    Text('Open Price: $openPrice',
                        style: TxtStyle(15, white, FontWeight.w500)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Profit: $profit',
                    style: TxtStyle(15, white, FontWeight.w500)),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  isProfit
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  color: white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
