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

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

import 'components/buttons.dart';
import 'components/dialog_modal.dart';
import 'components/loading.dart';
import 'components/static_logo.dart';

/// AuthorizeScreen authorizes the reader sdk using a mobile auth
class AuthorizeScreen extends StatefulWidget {
  @override
  _AuthorizeScreenState createState() => _AuthorizeScreenState();
}

class _AuthorizeScreenState extends State<AuthorizeScreen> {
  bool _isLoading = false;

  void initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  void checkAuthAndNavigate() async {
    var isAuthorized = await ReaderSdk.isAuthorized;
    if (isAuthorized) {
      Navigator.popAndPushNamed(context, '/checkout');
    }
  }

  void authorizeQRCode(String authCode) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await ReaderSdk.authorize(authCode);
      Navigator.pushNamed(context, '/checkout');
    } on ReaderSdkException catch (e) {
      // custom dialog to continue scanning after failure
      showDialog(
          context: context,
          builder: (var context) => AlertDialog(
                title: Text(
                  'Error processing qr code',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        e.message,
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
                      scan();
                    },
                  ),
                ],
              ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      authorizeQRCode(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        displayErrorModal(context, 'Camera Access was not granted');
      } else {
        displayErrorModal(context, e.toString());
      }
    } on Exception catch (e) {
      displayErrorModal(context, e.toString());
    }
  }

  void scanQRCode() async {
    scan();
  }

  void manuallyEnterCode() async {
    Navigator.pushNamed(context, '/authorize/manual');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: _isLoading ? LoadingWidget() : Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 100.0),
          child: SquareLogo(),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(children: [
            Text(
              'Authorize Reader SDK.',
              textAlign: TextAlign.center,
            ),
            Text(
              'Generate an authorization code in the Reader SDK tab of the Developer Portal',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.w300),
            ),
          ]),
        ),
        Container(
            child: SQButtonContainer(buttons: [
          SQRaisedButton(
            text: 'Scan QR Code',
            onPressed: scanQRCode,
          ),
          SQOutlineButton(
              text: 'Manually Enter Code',
              onPressed: manuallyEnterCode),
        ]))
      ]),
  );
}
