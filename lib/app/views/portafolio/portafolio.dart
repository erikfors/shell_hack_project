import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shellhack_project/app/models/coin_info.dart';
import 'package:shellhack_project/app/models/cost_calculator.dart';
import 'package:shellhack_project/app/models/currency_pairs.dart';
import 'package:shellhack_project/app/providers/coinroutes.dart';
import 'package:shellhack_project/app/providers/crypto_icons.dart';
import 'package:shellhack_project/app/views/coin%20detail/coin_detail.dart';
import 'package:shellhack_project/app/views/portafolio/controller/portafolio.controller.dart';

class PortafolioView extends StatelessWidget {
  final controller = Get.put(PortafolioController());
  List<CoinInfo> coinInfoList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFF1A1F24),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Portafolio",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Obx(
            () => controller.pairs.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (ctx, index) {
                        var coinInfo = CoinInfo();
                        coinInfo.currencyPair = controller.pairs[index];
                        coinInfoList.add(coinInfo);
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF131619),
                          ),
                          child: ListTile(
                            onTap: () async {
                              Get.showOverlay(
                                  asyncFunction: () async {
                                    var history = await controller
                                        .coinRoutesProvider
                                        .coinChart(
                                            pair: controller.pairs[index].slug,
                                            volume: coinInfo.costCalculator!
                                                .grossConsideration);

                                    coinInfoList[index].history = history;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => CoinDetail(
                                          coinInfoList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  loadingWidget: Center(
                                      child: CircularProgressIndicator()));
                            },
                            leading: CircleAvatar(
                              child: FutureBuilder(
                                future: CryptoIcon.getIcon(
                                    name: controller.pairs[index].slug
                                        .split("-")[0]),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Widget> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  var data = snapshot.data;

                                  coinInfoList[index].icon = data;

                                  return data!;
                                },
                              ),
                            ),
                            title: Text(controller.pairs[index].slug),
                            subtitle: Text(
                              controller.pairs[index].productType,
                            ),
                            trailing: FutureBuilder(
                              future: controller.getCost(
                                  pair: controller.pairs[index].slug,
                                  exchanges: controller.pairs[index].exchanges
                                      .map((e) => e.name)
                                      .toList(),
                                  quantity: 1),
                              builder: (BuildContext context,
                                  AsyncSnapshot<CostCalculator?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading...");
                                }

                                var data = snapshot.data;

                                if (data == null) {
                                  return Text("Not Found");
                                }

                                coinInfoList[index].costCalculator = data;

                                return Text(data.lastPrice.toStringAsFixed(2));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
