import 'package:flutter/cupertino.dart';

import 'cost_calculator.dart';
import 'currency_pairs.dart';

class CoinInfo{
    CurrencyPair?  currencyPair ;
    CostCalculator? costCalculator;
    List<Map<String, num>>? history;
    Widget? icon;

}