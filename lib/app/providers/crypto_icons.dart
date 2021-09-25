import 'package:flutter/material.dart';

class CryptoIcon {
  static Future<Image> getIcon({required String iconUrl}) async {
    return Image.network(
        'https://cryptoicons.org/api/icon/${iconUrl.toLowerCase()}/200');
  }
}