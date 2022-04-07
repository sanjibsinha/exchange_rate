import 'package:flutter/material.dart';

import 'display_exchange_rate_in_usd.dart';

class ExchangeRateApp extends StatelessWidget {
  const ExchangeRateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DisplayExchangerateInUSD(),
    );
  }
}
