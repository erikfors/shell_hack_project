import 'dart:convert';

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
        'wss://staging.coinroutes.com/api/streaming/cbbo/?token=6c634e1eacecc4801b000249287fbf923d5c8824'),
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
      {required String pair, int quantity = 1}) async {
    Dio dio = new Dio();
    Response response = await dio.post(
      _baseUrl + '/cost_calculator/',
      options: Options(
        headers: _headers,
      ),
      data: {
        "currency_pair": pair,
        "exchanges": ["gdax", "gemini", "bitstamp"],
        "side": "bids",
        "quantity": quantity,
        "use_fees": true,
        "use_funding_currency": false
      },
    );

    return costCalculatorFromJson(jsonEncode(response.data));
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
