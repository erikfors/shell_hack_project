import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:shellhack_project/app/models/coin_info.dart';

class CoinDetail extends StatelessWidget {
  CoinInfo coinInfo;

  CoinDetail(this.coinInfo);

  @override
  Widget build(BuildContext context) {
    print(coinInfo.history);

    var diff = coinInfo.costCalculator!.lastPrice -
        coinInfo.costCalculator!.firstPrice;

    var diffPer = (diff * 100) / coinInfo.costCalculator!.firstPrice;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_alert_outlined,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              coinInfo.currencyPair!.slug,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Row(
              children: [
                Text(
                  coinInfo.costCalculator!.lastPrice.toStringAsFixed(5),
                  style: TextStyle(
                    color: diff >= 0
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).errorColor,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                diff >= 0
                    ? Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).errorColor,
                      ),
                diff >= 0
                    ? Text(
                        "+" + diff.toStringAsFixed(5),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Text(
                        "-" + diff.toStringAsFixed(5),
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                SizedBox(
                  width: 4,
                ),
                diff >= 0
                    ? Text(
                        "+" + diffPer.toStringAsFixed(5) + "%",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Text(
                        "-" + diffPer.toStringAsFixed(5) + "%",
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      ),
              ],
            ),
            Container(
              height: 500,
              child: OHLCVGraph(
                data: coinInfo.history as List<dynamic>,
                enableGridLines: false,
                volumeProp: 0.2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(130, 40),
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Buy",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(130, 40),
                    primary: Theme.of(context).errorColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sell",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
