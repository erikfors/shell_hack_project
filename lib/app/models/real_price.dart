// To parse this JSON data, do
//
//     final realPrice = realPriceFromJson(jsonString);

import 'dart:convert';

RealPrice realPriceFromJson(String str) => RealPrice.fromJson(json.decode(str));

String realPriceToJson(RealPrice data) => json.encode(data.toJson());

class RealPrice {
  RealPrice({
    required this.generatedTimestamp,
    required this.product,
    required this.quantity,
    required this.exchangeGroup,
    required this.bidPrice,
    required this.askPrice,
    required this.price,
  });

  final DateTime generatedTimestamp;
  final String product;
  final int quantity;
  final String exchangeGroup;
  final double bidPrice;
  final double askPrice;
  final double price;

  factory RealPrice.fromJson(Map<String, dynamic> json) => RealPrice(
        generatedTimestamp: DateTime.parse(json["generated_timestamp"]),
        product: json["product"],
        quantity: json["quantity"],
        exchangeGroup: json["exchange_group"],
        bidPrice: json["bid_price"].toDouble(),
        askPrice: json["ask_price"].toDouble(),
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "generated_timestamp": generatedTimestamp.toIso8601String(),
        "product": product,
        "quantity": quantity,
        "exchange_group": exchangeGroup,
        "bid_price": bidPrice,
        "ask_price": askPrice,
        "price": price,
      };
}
