import 'package:flutter/material.dart';
import 'dart:async';

import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/permission_button.dart';
import 'package:path/path.dart' as path;

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isAuthorized = true;
  Map<PermissionGroup, PermissionStatus> _permissionStates = {
    PermissionGroup.microphone: PermissionStatus.unknown,
    PermissionGroup.location: PermissionStatus.unknown,
  };
  final _authCodeInputController = TextEditingController();

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
    // Platform messages may fail, so we use a try/catch ReaderSdkException.
    try {
      platformVersion = await SquareReaderSdkPlugin.platformVersion;
    } on ReaderSdkException {
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
      isAuthorized = await SquareReaderSdkPlugin.isAuthorized;
    } on ReaderSdkException catch(e) {
      print(e.toString());
      isAuthorized = false;
    }

    if (!mounted) return;

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
      await SquareReaderSdkPlugin.authorize(authCode);
      _authCodeInputController.clear();
      setState(() {
        _isAuthorized = true;
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
      await SquareReaderSdkPlugin.startCheckout(checkoutParams);
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
            Text(path.join('directory', 'testpath')),
            Text('Running on: $_platformVersion'),
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
                hintText: !_isAuthorized ? 'Please enter your auth code' : 'You have authorized',
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
