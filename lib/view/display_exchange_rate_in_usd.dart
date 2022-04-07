import 'package:flutter/material.dart';
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
          //getConvertedValue();
        });
      },
    );
  }

  String? value = '?';
  String key = 'USD';

  void getConvertedValue() async {
    try {
      Map<String, String>? data =
          await USDData().getUSDDataMap(selectedCurrency, key);
      setState(() {
        value = data![key];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //getConvertedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.redAccent,
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
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.red,
            child: selectDropDownList(),
          ),
        ],
      ),
    );
  }
}
