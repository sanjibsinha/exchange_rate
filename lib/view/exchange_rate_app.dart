import 'package:flutter/material.dart';

import '../model/happy_theme.dart';
import 'display_exchange_rate_in_usd.dart';

HappyTheme happyTheme = HappyTheme();

class ExchangeRateApp extends StatelessWidget {
  const ExchangeRateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: happyTheme.buildTheme(),
      home: const DisplayExchangerateInUSD(),
    );
  }
}
