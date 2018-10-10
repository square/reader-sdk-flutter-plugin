import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';
import 'package:square_reader_sdk_flutter_plugin/models.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/permission_button.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isAuthorized = false;
  Location _authorizedLocation;
  Map<PermissionGroup, PermissionStatus> _permissionStates = {
    PermissionGroup.microphone: PermissionStatus.unknown,
    PermissionGroup.location: PermissionStatus.unknown,
  };
  final _authCodeInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPermissionState();
    initAuthorizeState();
  }

  Future initAuthorizeState() async {
    bool isAuthorized;
    try {
      isAuthorized = await SquareReaderSdkPlugin.isAuthorized;
    } on ReaderSdkException catch(e) {
      print(e.toString());
      isAuthorized = false;
    }

    if (!mounted) return;

    if (isAuthorized) {
      try {
        Location authLocation = await SquareReaderSdkPlugin.authorizedLocation;
          setState(() {
            _authorizedLocation = authLocation;
          });
      } on ReaderSdkException catch(e) {
        print(e.toString());
      }
    }

    setState(() {
      _isAuthorized = isAuthorized;
    });

  }

  initPermissionState() {
    for(PermissionGroup permissionGroup in this._permissionStates.keys) {
      this.updatePermissionState(permissionGroup);
    }
  }

  Future updatePermissionState(PermissionGroup permissionGroup) async {
    PermissionStatus status = await PermissionHandler().checkPermissionStatus(permissionGroup);
    if (mounted && status != this._permissionStates[permissionGroup]) {
      this.setState(() {
        this._permissionStates[permissionGroup] = status;
      });
    }
  }

  Future onRequestPermission(PermissionGroup permissionGroup) async {
    if (this._permissionStates[permissionGroup] == PermissionStatus.unknown) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([permissionGroup]);
      this.setState(() {
        this._permissionStates[permissionGroup] = permissions[permissionGroup];
      });
    } else if (this._permissionStates[permissionGroup] == PermissionStatus.denied) {
      PermissionHandler().openAppSettings();
    } else {
      print('Unknown status to request permission.');
    }
  }

  onAuthorize() async {
    try {
      String authCode = _authCodeInputController.text;
      Location authLocation = await SquareReaderSdkPlugin.authorize(authCode);
      _authCodeInputController.clear();
      setState(() {
        _isAuthorized = true;
        _authorizedLocation = authLocation;
      });
    } on ReaderSdkException catch (e) {
      print(e.toString());
    }
  }
  
  onDeauthorize() async {
    try {
      await SquareReaderSdkPlugin.deauthorize();
      setState(() {
        _isAuthorized = false;
      });
    } on ReaderSdkException catch (e) {
      print(e.toString());
    }
  }

  onCheckout() async {
    var builder = CheckoutParametersBuilder();
    builder.amountMoney = MoneyBuilder()
      ..amount=100
      ..currencyCode = 'USD'; // currencyCode is optional
    // Optional for all following configuration
    builder.skipReceipt = false;
    builder.alwaysRequireSignature = true;
    builder.allowSplitTender = false;
    builder.note = 'Hello 💳 💰 World!';
    builder.additionalPaymentTypes = ListBuilder(['cash', 'manual_card_entry', 'other']);
    builder.tipSettings = TipSettingsBuilder()
      ..showCustomTipField = true
      ..showSeparateTipScreen = false
      ..tipPercentages = ListBuilder([15, 20, 30]);

    CheckoutParameters checkoutParameters = builder.build();

    try {
      CheckoutResult checkoutResult = await SquareReaderSdkPlugin.startCheckout(checkoutParameters);
      print('${checkoutResult.totalMoney.amount} Transaction finished successfully: ${checkoutResult.transactionClientId}');
    } on ReaderSdkException catch (e) {
      print(e.toString());
    }
  }

  onReaderSettings() async {
    try {
      await SquareReaderSdkPlugin.startReaderSettings();
    } on ReaderSdkException catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _authCodeInputController.dispose();
    super.dispose();
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
            PermissionButton(
              permissionName: 'microphone',
              onPressed: this._permissionStates[PermissionGroup.microphone] == PermissionStatus.granted ? null : () { onRequestPermission(PermissionGroup.microphone ); },
              permissionStatus: this._permissionStates[PermissionGroup.microphone],
            ),
            PermissionButton(
              permissionName: 'location',
              onPressed: this._permissionStates[PermissionGroup.location] == PermissionStatus.granted ? null : () { onRequestPermission(PermissionGroup.location ); },
              permissionStatus: this._permissionStates[PermissionGroup.location],
            ),
            TextField(
              enabled: !_isAuthorized,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: !_isAuthorized ? 'Please enter your auth code' : 'Location: ${_authorizedLocation.name}',
              ),
              controller: _authCodeInputController,
            ),
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
