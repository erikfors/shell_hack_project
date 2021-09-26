import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:get/get.dart';
import 'package:shellhack_project/app/models/coin_info.dart';
import 'package:shellhack_project/app/models/cost_calculator.dart';
import 'package:shellhack_project/app/models/currency_pairs.dart';

class CoinDetail extends StatelessWidget {
  CoinInfo coinInfo;

  CoinDetail(this.coinInfo);

  @override
  Widget build(BuildContext context) {
    print(coinInfo.history);

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
          children: [
            Text(coinInfo.currencyPair!.slug),
            Text(coinInfo.costCalculator!.lastPrice.toString()),
            Expanded(
              child: Container(
                height: 800,
                width: Get.width,
                child: OHLCVGraph(
                  data: coinInfo.history!.reversed.toList(),
                  enableGridLines: true,
                  volumeProp: 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
