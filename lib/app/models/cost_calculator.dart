// To parse this JSON data, do
//
//     final costCalculator = costCalculatorFromJson(jsonString);

import 'dart:convert';

CostCalculator costCalculatorFromJson(String str) =>
    CostCalculator.fromJson(json.decode(str));

String costCalculatorToJson(CostCalculator data) => json.encode(data.toJson());

class CostCalculator {
  CostCalculator({
    required this.firstPrice,
    required this.lastPrice,
    required this.bestTotalPrice,
    required this.bestQty,
    required this.bestTotalFees,
    required this.bestBook,
    required this.grossConsideration,
    required this.bestPrice,
    required this.bestAveragePrice,
    required this.bestExchangeSummary,
    required this.sorOrders,
  });

  final double firstPrice;
  final double lastPrice;
  final double bestTotalPrice;
  final double bestQty;
  final double bestTotalFees;
  final List<List<dynamic>> bestBook;
  final double grossConsideration;
  final double bestPrice;
  final double bestAveragePrice;
  final List<dynamic> bestExchangeSummary;
  final List<SorOrder> sorOrders;

  factory CostCalculator.fromJson(Map<String, dynamic> json) => CostCalculator(
        firstPrice: json["first_price"].toDouble(),
        lastPrice: json["last_price"].toDouble(),
        bestTotalPrice: json["best_total_price"].toDouble(),
        bestQty: json["best_qty"],
        bestTotalFees: json["best_total_fees"].toDouble(),
        bestBook: List<List<dynamic>>.from(
            json["best_book"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        grossConsideration: json["gross_consideration"].toDouble(),
        bestPrice: json["best_price"].toDouble(),
        bestAveragePrice: json["best_average_price"].toDouble(),
        bestExchangeSummary:
            List<dynamic>.from(json["best_exchange_summary"].map((x) => x)),
        sorOrders: List<SorOrder>.from(
            json["sor_orders"].map((x) => SorOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "first_price": firstPrice,
        "last_price": lastPrice,
        "best_total_price": bestTotalPrice,
        "best_qty": bestQty,
        "best_total_fees": bestTotalFees,
        "best_book": List<dynamic>.from(
            bestBook.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "gross_consideration": grossConsideration,
        "best_price": bestPrice,
        "best_average_price": bestAveragePrice,
        "best_exchange_summary":
            List<dynamic>.from(bestExchangeSummary.map((x) => x)),
        "sor_orders": List<dynamic>.from(sorOrders.map((x) => x.toJson())),
      };
}

class SorOrder {
  SorOrder({
    required this.exchange,
    required this.qty,
    required this.sorLimitPrice,
    required this.totalFees,
    required this.totalPrice,
    required this.tickSize,
    required this.grossPrice,
    required this.avgPrice,
  });

  final String exchange;
  final double qty;
  final double sorLimitPrice;
  final double totalFees;
  final double totalPrice;
  final double tickSize;
  final double grossPrice;
  final double avgPrice;

  factory SorOrder.fromJson(Map<String, dynamic> json) => SorOrder(
        exchange: json["exchange"],
        qty: json["qty"],
        sorLimitPrice: json["sor_limit_price"].toDouble(),
        totalFees: json["total_fees"].toDouble(),
        totalPrice: json["total_price"].toDouble(),
        tickSize: json["tick_size"].toDouble(),
        grossPrice: json["gross_price"].toDouble(),
        avgPrice: json["avg_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "exchange": exchange,
        "qty": qty,
        "sor_limit_price": sorLimitPrice,
        "total_fees": totalFees,
        "total_price": totalPrice,
        "tick_size": tickSize,
        "gross_price": grossPrice,
        "avg_price": avgPrice,
      };
}
