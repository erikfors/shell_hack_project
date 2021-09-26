import 'package:get/get.dart';
import 'package:shellhack_project/app/models/cost_calculator.dart';
import 'package:shellhack_project/app/models/currency_pairs.dart';
import 'package:shellhack_project/app/providers/coinroutes.dart';

class PortafolioController extends GetxController {
  CoinRoutesProvider coinRoutesProvider = new CoinRoutesProvider();
  final pairs = <CurrencyPair>[].obs;
  @override
  void onReady() async {
    pairs.addAll(await coinRoutesProvider.getCurrencyPairs());
    super.onReady();
  }

  Future<CostCalculator?> getCost(
      {required String pair, int quantity = 1, required List exchanges}) async {
    return await coinRoutesProvider.getCostCalculator(
        pair: pair, quantity: quantity, exchanges: exchanges);
  }
}
