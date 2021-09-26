import 'package:flutter/material.dart';
import 'package:shellhack_project/app/models/cost_calculator.dart';
import 'package:shellhack_project/app/models/currency_pairs.dart';
import 'package:shellhack_project/app/providers/coinroutes.dart';
import 'package:shellhack_project/app/providers/crypto_icons.dart';

class PortafolioView extends StatelessWidget {
  CoinRoutesProvider coinRoutesProvider = new CoinRoutesProvider();

  @override
  Widget build(BuildContext context) {
    var response = coinRoutesProvider.getCurrencyPairs();

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
          FutureBuilder(
            future: response,
            builder: (BuildContext context,
                AsyncSnapshot<List<CurrencyPair>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var dataList = snapshot.data;

              if (dataList == null) {
                return Center(
                  child: Text("Not found"),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF131619),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FutureBuilder(
                          future: CryptoIcon.getIcon(
                              iconUrl: dataList[index]
                                  .slug
                                  .split("-")[0]
                                  .toUpperCase()),
                          builder: (BuildContext context,
                              AsyncSnapshot<Image> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            var data = snapshot.data;

                            if (data == null) {
                              return Text("G");
                            }

                            return Image(
                              image: data.image,
                            );
                          },
                        ),
                      ),
                      title: Text(dataList[index].slug),
                      subtitle: Text(
                        dataList[index].productType,
                      ),
                      trailing: FutureBuilder(
                        future: coinRoutesProvider.getCostCalculator(
                            pair: dataList[index].slug, quantity: 1),
                        builder: (BuildContext context,
                            AsyncSnapshot<CostCalculator> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading...");
                          }

                          var data = snapshot.data;

                          if (data == null) {
                            return Text("Not Found");
                          }

                          return Text(data.lastPrice.toStringAsFixed(2));
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
