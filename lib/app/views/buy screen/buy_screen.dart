import 'package:flutter/material.dart';
import 'package:shellhack_project/app/models/coin_info.dart';

// ignore: must_be_immutable
class BuyMenu extends StatefulWidget {
  CoinInfo coinInfo;

  BuyMenu(this.coinInfo);

  @override
  _BuyMenuState createState() => _BuyMenuState();
}

class _BuyMenuState extends State<BuyMenu> {
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    var coinInfo = widget.coinInfo;

    var diff = coinInfo.costCalculator!.lastPrice -
        coinInfo.costCalculator!.firstPrice;

    var diffPer = (diff * 100) / coinInfo.costCalculator!.firstPrice;

    return Container(
      height: 250,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: coinInfo.icon),
              SizedBox(
                width: 16,
              ),
              Text(
                "Buy " + coinInfo.currencyPair!.slug,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (quantity <= 0) {
                    return;
                  }

                  setState(() {
                    quantity -= 1;
                  });
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Theme.of(context).errorColor,
                ),
              ),
              Text(quantity.toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity += 1;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quantity ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(": " + quantity.toString()),
              Text(
                " Total ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$" +
                    (quantity * coinInfo.costCalculator!.lastPrice)
                        .toStringAsFixed(2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(130, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(130, 40),
                  primary: Theme.of(context).primaryColor,
                ),
                child: Text(
                  "Buy",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
