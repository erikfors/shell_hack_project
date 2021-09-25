// To parse this JSON data, do
//
//     final currencyPair = currencyPairFromJson(jsonString);

import 'dart:convert';

List<CurrencyPair> currencyPairFromJson(String str) => List<CurrencyPair>.from(
    json.decode(str).map((x) => CurrencyPair.fromJson(x)));

String currencyPairToJson(List<CurrencyPair> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyPair {
  CurrencyPair({
    required this.slug,
    required this.targetCurrency,
    required this.fundingCurrency,
    required this.exchanges,
    required this.tickSize,
    required this.productType,
  });

  final String slug;
  final Currency targetCurrency;
  final Currency fundingCurrency;
  final List<Exchange> exchanges;
  final String tickSize;
  final String productType;

  factory CurrencyPair.fromJson(Map<String, dynamic> json) => CurrencyPair(
        slug: json["slug"],
        targetCurrency: Currency.fromJson(json["target_currency"]),
        fundingCurrency: Currency.fromJson(json["funding_currency"]),
        exchanges: List<Exchange>.from(
            json["exchanges"].map((x) => Exchange.fromJson(x))),
        tickSize: json["tick_size"],
        productType: json["product_type"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "target_currency": targetCurrency.toJson(),
        "funding_currency": fundingCurrency.toJson(),
        "exchanges": List<dynamic>.from(exchanges.map((x) => x.toJson())),
        "tick_size": tickSize,
        "product_type": productType,
      };
}

class Exchange {
  Exchange({
    required this.slug,
    required this.name,
    required this.apiName,
    this.apiSymbol,
  });

  final String slug;
  final String name;
  final String apiName;
  final dynamic apiSymbol;

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        slug: json["slug"],
        name: json["name"],
        apiName: json["api_name"],
        apiSymbol: json["api_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "api_name": apiName,
        "api_symbol": apiSymbol,
      };
}

class Currency {
  Currency({
    required this.slug,
    required this.cbboSizes,
    required this.defaultMinSize,
  });

  final String slug;
  final List<CbboSize> cbboSizes;
  final String defaultMinSize;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        slug: json["slug"],
        cbboSizes: List<CbboSize>.from(
            json["cbbo_sizes"].map((x) => CbboSize.fromJson(x))),
        defaultMinSize: json["default_min_size"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "cbbo_sizes": List<dynamic>.from(cbboSizes.map((x) => x.toJson())),
        "default_min_size": defaultMinSize,
      };
}

class CbboSize {
  CbboSize({
    required this.id,
    required this.size,
    this.usdValue,
    required this.currency,
  });

  final int id;
  final String size;
  final dynamic usdValue;
  final int currency;

  factory CbboSize.fromJson(Map<String, dynamic> json) => CbboSize(
        id: json["id"],
        size: json["size"],
        usdValue: json["usd_value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "usd_value": usdValue,
        "currency": currency,
      };
}
