import 'package:flutter/material.dart';
import 'package:price_tracker/model/happy_theme.dart';
import '../model/usd_data.dart';

class DisplayExchangerateInUSD extends StatefulWidget {
  const DisplayExchangerateInUSD({Key? key}) : super(key: key);

  @override
  _DisplayExchangerateInUSDState createState() =>
      _DisplayExchangerateInUSDState();
}

class _DisplayExchangerateInUSDState extends State<DisplayExchangerateInUSD> {
  String selectedCurrency = 'INR';

  DropdownButton<String> selectDropDownList() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currencyList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getConvertedValueInSelectedCurrency();
        });
      },
    );
  }

  String? value = '?';
  String key = 'USD';

  void getConvertedValueInSelectedCurrency() async {
    try {
      Map<String, String>? data =
          await USDData().getUSDDataMap(selectedCurrency, key);
      setState(() {
        value = data![key];
      });
    } catch (e) {
      throw '$e';
    }
  }

  @override
  void initState() {
    super.initState();
    getConvertedValueInSelectedCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HappyTheme.inactiveCoor,
        title: Text(
          'Exchange Rate',
          style: HappyTheme.appbarStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: HappyTheme.shrineBrown600,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 USD = $value $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: HappyTheme.answerStyle,
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: HappyTheme.shrinePink300,
            child: selectDropDownList(),
          ),
        ],
      ),
    );
  }
}
