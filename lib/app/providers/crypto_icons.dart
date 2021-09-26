import 'package:flutter/material.dart';

class CryptoIcon {
  static Future<Widget> getIcon({required String name}) async {
    return Image.network(
        'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/${name.toLowerCase()}.png');
  }
}
