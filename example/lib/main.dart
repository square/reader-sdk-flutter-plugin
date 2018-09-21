import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:reader_sdk_flutter_plugin/reader_sdk_flutter_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/permission_button.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isAuthorized = true;
  Map<PermissionGroup, PermissionStatus> permissionStates = {
    PermissionGroup.microphone: PermissionStatus.unknown,
    PermissionGroup.location: PermissionStatus.unknown,
  };

  @override
  void initState() {
    super.initState();
    initPermissionState();
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

  initPermissionState() {
    for(PermissionGroup permissionGroup in this.permissionStates.keys) {
      this.updatePermissionState(permissionGroup);
    }
  }

  Future updatePermissionState(PermissionGroup permissionGroup) async {
    PermissionStatus status = await PermissionHandler().checkPermissionStatus(permissionGroup);
    if (mounted && status != this.permissionStates[permissionGroup]) {
      this.setState(() {
        this.permissionStates[permissionGroup] = status;
      });
    }
  }

  Future onRequestPermission(PermissionGroup permissionGroup) async {
    if (this.permissionStates[permissionGroup] == PermissionStatus.unknown) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([permissionGroup]);
      this.setState(() {
        this.permissionStates[permissionGroup] = permissions[permissionGroup];
      });
    } else if (this.permissionStates[permissionGroup] == PermissionStatus.denied) {
      PermissionHandler().openAppSettings();
    } else {
      print('Unknown status to request permission.');
    }
  }

  onAuthorize() async {
    try {
      await ReaderSdkFlutterPlugin.authorize('sq0acp-N7OvCGy4s_IIu8eGsfZqH8mJGaCNqfCfd-eG6X-4Q70');
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
            PermissionButton(
              permissionName: 'microphone',
              onPressed: this.permissionStates[PermissionGroup.microphone] == PermissionStatus.granted ? null : () { onRequestPermission(PermissionGroup.microphone ); },
              permissionStatus: this.permissionStates[PermissionGroup.microphone],
            ),
            PermissionButton(
              permissionName: 'location',
              onPressed: this.permissionStates[PermissionGroup.location] == PermissionStatus.granted ? null : () { onRequestPermission(PermissionGroup.location ); },
              permissionStatus: this.permissionStates[PermissionGroup.location],
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
