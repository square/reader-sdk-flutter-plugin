/*
Copyright 2018 Square Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

import 'widgets/buttons.dart';
import 'widgets/dialog_modal.dart';
import 'widgets/loading.dart';
import 'widgets/square_logo.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");

/// CheckoutScreen shows the checkout button and reader settings
class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController textEditingController = TextEditingController();
  bool _isLoading = false;

  _showTransactionDialog(CheckoutResult checkoutResult) {
    // amount is in cents
    var formattedAmount = NumberFormat.simpleCurrency(
            name: checkoutResult.totalMoney.currencyCode)
        .format(checkoutResult.totalMoney.amount / 100);

    showDialog(
        context: context,
        builder: (var context) => AlertDialog(
              title: Text(
                '$formattedAmount Successfully Charged',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'See the debugger console for transaction details. You can refund transactions from your Square Dashboard.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  void onCharge() async {
    var builder = CheckoutParametersBuilder();
    builder.amountMoney = MoneyBuilder()
      ..amount = 100
      ..currencyCode = 'USD'; // currencyCode is optional
    // Optional for all following configuration
    builder.skipReceipt = false;
    builder.alwaysRequireSignature = true;
    builder.allowSplitTender = false;
    builder.note = 'Hello 💳 💰 World!';
    builder.additionalPaymentTypes =
        ListBuilder(['cash', 'manual_card_entry', 'other']);
    builder.tipSettings = TipSettingsBuilder()
      ..showCustomTipField = true
      ..showSeparateTipScreen = false
      ..tipPercentages = ListBuilder([15, 20, 30]);

    CheckoutParameters checkoutParameters = builder.build();

    try {
      var checkoutResult = await ReaderSdk.startCheckout(checkoutParameters);
      print(checkoutResult);
      _showTransactionDialog(checkoutResult);
    } on ReaderSdkException catch (e) {
      switch (e.code) {
        case ErrorCode.checkoutErrorCanceled:
          // Handle canceled transaction here
          print('transaction canceled.');
          break;
        case ErrorCode.checkoutErrorSdkNotAuthorized:
          // Handle sdk not authorized
          Navigator.pushReplacementNamed(context, '/');
          break;
        default:
          var errorMessage = e.message;
          if (_debug) {
            errorMessage += '\n\nDebug Message: ${e.debugMessage}';
            print('${e.code}:${e.debugCode}:${e.debugMessage}');
          }
          displayErrorModal(context, errorMessage);
      }
    }
  }

  void onReaderSDKSettings() async {
    try {
      await ReaderSdk.startReaderSettings();
    } on ReaderSdkException catch (e) {
      switch(e.code) {
        case ErrorCode.readerSettingsErrorSdkNotAuthorized:
          // Handle sdk not authorized
          Navigator.pushReplacementNamed(context, '/');
          break;
        default:
          var errorMessage = e.message;
          if (_debug) {
            errorMessage += '\n\nDebug Message: ${e.debugMessage}';
            print('${e.code}:${e.debugCode}:${e.debugMessage}');
          }
          displayErrorModal(context, errorMessage);
      }
    }
  }

  void onDeauthorize() async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (await ReaderSdk.canDeauthorize) {
        await ReaderSdk.deauthorize();
        Navigator.pushNamed(context, '/authorize');
      }
    } on ReaderSdkException catch (e) {
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void onSettings() async {
    var location = await ReaderSdk.authorizedLocation;
    showCupertinoModalPopup(
      context: context,
      builder: (var context) => _SettingsModalPopup(
            locationName: location.name,
            onReaderSDKSettings: onReaderSDKSettings,
            onDeauthorize: onDeauthorize,
          ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _isLoading
            ? LoadingWidget()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    SquareLogo(),
                    _Description(),
                    _Buttons(
                      onCharge: onCharge,
                      onSettings: onSettings,
                    ),
                  ]),
      );
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
        child: Text(
          'Take a payment.',
          textAlign: TextAlign.center,
        ),
      );
}

class _Buttons extends StatelessWidget {
  final Function onCharge;
  final Function onSettings;

  _Buttons({
    this.onCharge,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) => Container(
        child: SQButtonContainer(buttons: [
          SQRaisedButton(
            text: 'Charge \$1.00',
            onPressed: onCharge,
          ),
          SQOutlineButton(text: 'Settings', onPressed: onSettings),
        ]),
      );
}

class _SettingsModalPopup extends StatelessWidget {
  final String locationName;
  final Function onReaderSDKSettings;
  final Function onDeauthorize;

  _SettingsModalPopup({
    @required this.locationName,
    this.onReaderSDKSettings,
    this.onDeauthorize,
  });

  @override
  Widget build(BuildContext context) => CupertinoActionSheet(
        title: Text('Location: $locationName'),
        actions: [
          FlatButton(
            child: Text(
              'Reader Settings',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: onReaderSDKSettings,
          ),
          FlatButton(
            child: Text(
              'Deauthorize',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: onDeauthorize,
          ),
        ],
        cancelButton: FlatButton(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      );
}
