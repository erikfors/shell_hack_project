import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shellhack_project/app/models/cost_calculator.dart';
import 'package:shellhack_project/app/models/currency_pairs.dart';
import 'package:shellhack_project/app/models/real_price.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CoinRoutesProvider {
  final String _baseUrl = 'https://staging.coinroutes.com/api';
  final Map<String, dynamic> _headers = {
    'Authorization': 'Token 6c634e1eacecc4801b000249287fbf923d5c8824',
  };

  final _channel = WebSocketChannel.connect(
    Uri.parse(
        'wss://staging.coinroutes.com/api/streaming/real_price/?token=6c634e1eacecc4801b000249287fbf923d5c8824'),
  );

  Future<List<CurrencyPair>> getCurrencyPairs() async {
    Dio dio = new Dio();
    Response response = await dio.get(
      _baseUrl + '/currency_pairs/',
      options: Options(
        headers: _headers,
      ),
    );

    return currencyPairFromJson(jsonEncode(response.data));
  }

  Future<CostCalculator> getCostCalculator(
      {required String pair, int quantity = 1, required List exchanges}) async {
    Dio dio = new Dio();
    Response response = await dio.post(
      _baseUrl + '/cost_calculator/',
      options: Options(
        headers: _headers,
      ),
      data: {
        "currency_pair": pair,
        "exchanges": exchanges,
        "side": "asks",
        "quantity": quantity,
        "use_fees": true,
        "use_funding_currency": false
      },
    );

    return costCalculatorFromJson(jsonEncode(response.data));
  }

  Future<List<Map<String, num>>> coinChart({required String pair, required double volume}) async {
    Dio dio = Dio();

    Response response = await dio.get(
        'https://sor-qa-eu.coinroutes.io/api/streaming/ohlc/?interval=m&product=$pair&size=0&exchanges=gdax,gemini,kraken,bitstamp&format=csv');

    List chart = response.data.toString().split('\n');
    chart.removeAt(0);

    List<Map<String, num>> list = [];

    list.addAll(
      chart.map(
        (e) {
          if (e.isEmpty) {
            return {};
          }
          List<String> xsplit = e.split(',');

          return {
            "open": double.parse(xsplit[4]),
            "high": double.parse(xsplit[6]),
            "low": double.parse(xsplit[8]),
            "close": double.parse(xsplit[10]),
            "volumeto": 50000.0
          };
        },
      ),
    );
    list.removeLast();
    return list;
  }

  Stream getRealPrice({required String pair}) {
    _channel.sink.add(
      jsonEncode(
        {"currency_pair": pair, "size_filter": "5.00"},
      ),
    );
    return _channel.stream;
  }
}
