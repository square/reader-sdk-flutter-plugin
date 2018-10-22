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
import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';
import 'package:square_reader_sdk_flutter_plugin/models.dart';
import 'components/static_logo.dart';
import 'components/dialog_modal.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => new _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final textEditingController = TextEditingController();


  _showTransactionDialog(CheckoutResult checkoutResult) {
    // amount is in cents
    String formattedAmount = NumberFormat.simpleCurrency(name: checkoutResult.totalMoney.currencyCode).format(checkoutResult.totalMoney.amount / 100);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${formattedAmount} Successfully Charged',
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
        );
      }
    );
  }

  onCharge() async {
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
      _showTransactionDialog(checkoutResult);
    } on ReaderSdkException catch (e) {
      switch (e.code) {
        case SquareReaderSdkPlugin.CheckoutErrorCanceled:
          // Handle canceled transaction here
          print('transaction canceled.');
          break;
        case SquareReaderSdkPlugin.CheckoutErrorSdkNotAuthorized:
          // Handle sdk not authorized
          Navigator.pushNamed(context, '/');
          break;
        default:
          displayErrorModal(context, e);
      }
    }
  }

  onSettings() async {
    try {
      await SquareReaderSdkPlugin.startReaderSettings();
    } on ReaderSdkException catch (e) {
      displayErrorModal(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100.0),
            child: new SquareLogo(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
            child: Text(
              'Take a payment.',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: SQButtonContainer(
              buttons: [
                SQRaisedButton(
                  text: 'Charge \$1.00',
                  onPressed: onCharge,
                ),
                SQOutlineButton(
                  text: 'Settings',
                  onPressed: onSettings
                ),
              ]
            ),
          ),
        ]
      ),
    );
  }
}