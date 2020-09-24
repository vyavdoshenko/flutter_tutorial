import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Converter _converter = Converter();
  String _selectedCurrency = 'USD';
  String _btcRate = '';
  String _ethRate = '';
  String _ltcRate = '';

  @override
  void initState() {
    super.initState();
    updateUI(_selectedCurrency);
  }

  void updateUI(value) async {
    var btcRate = await _converter.getRate('BTC', value);
    var ethRate = await _converter.getRate('ETH', value);
    var ltcRate = await _converter.getRate('LTC', value);

    setState(() {
      _selectedCurrency = value;
      _btcRate = btcRate;
      _ethRate = ethRate;
      _ltcRate = ltcRate;
    });
  }

  Widget androidDropdown() {
    List<Widget> items = List<DropdownMenuItem<String>>();
    for (String currency in currenciesList) {
      items.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: _selectedCurrency,
      items: items,
      onChanged: (value) {
        updateUI(value);
      },
    );
  }

  Widget iOSPicker() {
    List<Widget> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
      },
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ConvertWidget(
                  coinName: 'BTC',
                  coinRate: _btcRate,
                  selectedCurrency: _selectedCurrency),
              ConvertWidget(
                  coinName: 'ETH',
                  coinRate: _ethRate,
                  selectedCurrency: _selectedCurrency),
              ConvertWidget(
                  coinName: 'LTC',
                  coinRate: _ltcRate,
                  selectedCurrency: _selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class ConvertWidget extends StatelessWidget {
  const ConvertWidget({
    @required this.coinName,
    @required this.coinRate,
    @required this.selectedCurrency,
  });

  final String coinName;
  final String coinRate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coinName = $coinRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
