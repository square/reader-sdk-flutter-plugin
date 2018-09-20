import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:reader_sdk_flutter_plugin/reader_sdk_flutter_plugin.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isAuthorized = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initAuthorizeState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ReaderSdkFlutterPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future initAuthorizeState() async {
    bool isAuthorized;
    try {
      isAuthorized = await ReaderSdkFlutterPlugin.isAuthorized;
    } on PlatformException{
      isAuthorized = true;
    }

    if (!mounted) return;

    setState(() {
      _isAuthorized = isAuthorized;
    });
  }

  onAuthorize() async {
    try {
      await ReaderSdkFlutterPlugin.authorize('sq0acp--X0w72McG0jwL6ws5SQB8pDLgBpS788iejtzZ4kxkqY');
      setState(() {
        _isAuthorized = true;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
  
  onDeauthorize() async {
    try {
      await ReaderSdkFlutterPlugin.deauthorize();
      setState(() {
        _isAuthorized = false;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  onCheckout() async {
    var checkoutParams = {
      'amountMoney': {
        'amount': 100,
        'currencyCode': 'USD', // optional, use authorized location's currency code by default
      },
      // Optional for all following configuration
      'skipReceipt': false,
      'alwaysRequireSignature': true,
      'allowSplitTender': false,
      'note': 'Hello 💳 💰 World!',
      'tipSettings': {
        'showCustomTipField': true,
        'showSeparateTipScreen': false,
        'tipPercentages': [15, 20, 30],
      },
      'additionalPaymentTypes': ['cash', 'manual_card_entry', 'other'],
    };
    try {
      await ReaderSdkFlutterPlugin.startCheckout(checkoutParams);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  onReaderSettings() async {
    try {
      await ReaderSdkFlutterPlugin.startReaderSettings();
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion'),
            RaisedButton(
              onPressed: _isAuthorized ? null : onAuthorize,
              child: Text('Authorize'),
            ),
            RaisedButton(
              onPressed: _isAuthorized ? onDeauthorize : null,
              child: Text('Deauthorize'),
            ),
            RaisedButton(
              onPressed: _isAuthorized ? onCheckout : null,
              child: Text('Checkout'),
            ),
            RaisedButton(
              onPressed: _isAuthorized ? onReaderSettings : null,
              child: Text('Reader Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
