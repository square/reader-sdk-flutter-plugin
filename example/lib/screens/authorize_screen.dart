/*
Copyright 2022 Square Inc.

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

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

import 'widgets/buttons.dart';
import 'widgets/dialog_modal.dart';
import 'widgets/loading.dart';
import 'widgets/square_logo.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");

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
      switch (e.code) {
        case ErrorCode.authorizeErrorNoNetwork:
          displayErrorModal(context, 'Please connect your device to network.');
          break;
        case ErrorCode.usageError:
          var errorMessage = e.message!;
          if (_debug) {
            errorMessage += '\n\nDebug Message: ${e.debugMessage}';
            print('${e.code}:${e.debugCode}:${e.debugMessage}');
          }
          displayErrorModal(context, errorMessage);
          break;
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> scan() async {
    try {
      var result = await BarcodeScanner.scan();
      authorizeQRCode(result.rawContent);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        displayErrorModal(context, 'Camera Access was not granted');
      } else {
        displayErrorModal(context, e.toString());
      }
    } on Exception catch (e) {
      displayErrorModal(context, e.toString());
    }
  }

  void scanQRCode() {
    scan();
  }

  void manuallyEnterCode() {
    Navigator.pushNamed(context, '/authorize/manual');
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
                      scanQRCode: scanQRCode,
                      manuallyEnterCode: manuallyEnterCode,
                    ),
                  ]),
      );
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 64.0),
        child: Column(children: [
          Text(
            'Authorize Reader SDK.',
            textAlign: TextAlign.center,
          ),
          Text(
            'Generate an authorization code in the Reader SDK tab of the Developer Portal',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ]),
      );
}

class _Buttons extends StatelessWidget {
  final VoidCallback manuallyEnterCode;
  final VoidCallback scanQRCode;

  _Buttons({
    required this.scanQRCode,
    required this.manuallyEnterCode,
  });

  @override
  Widget build(BuildContext context) => Container(
          child: SQButtonContainer(buttons: [
        SQRaisedButton(
          text: 'Scan QR Code',
          onPressed: scanQRCode,
        ),
        SQOutlineButton(
            text: 'Manually Enter Code', onPressed: manuallyEnterCode),
      ]));
}
