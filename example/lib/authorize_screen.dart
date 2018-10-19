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

import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'components/static_logo.dart';
import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';

class AuthorizeScreen extends StatefulWidget {
  @override
  _AuthorizeScreenState createState() => new _AuthorizeScreenState();
}

class _AuthorizeScreenState extends State<AuthorizeScreen> {
  initState() {
    super.initState();
    initAuthorizeStatus();
  }

  initAuthorizeStatus() async {
    bool isAuthorized = await SquareReaderSdkPlugin.isAuthorized;
    if (isAuthorized) {
      Navigator.pushNamed(context, '/checkout');
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
            margin: EdgeInsets.symmetric(horizontal: 64.0),
            child: Column(
              children: [
                Text(
                  'Authorize Reader SDK.',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Generate an authorization code in the Reader SDK tab of the Developer Portal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ]
            ),
          ),
          Container(
            child: ButtonContainer()
          )
        ]
      ),
    );
  }
}

class ButtonContainer extends StatefulWidget {
  @override
  _ButtonContainerState createState() => new _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  initState() {
    super.initState();
    checkAuthAndNavigate();
  }

  checkAuthAndNavigate() async {
    bool isAuthorized = await SquareReaderSdkPlugin.isAuthorized;
    if (isAuthorized) {
      Navigator.pushNamed(context, '/checkout');
    }
  }

  scanQRCode() async {
    Navigator.pushNamed(context, '/authorize/camera');
  }

  manuallyEnterCode() async {
    Navigator.pushNamed(context, '/authorize/manual');
  }

  @override
  Widget build(BuildContext context) {
    return new SQButtonContainer(
      buttons: [
        SQRaisedButton(
          text: 'Scan QR Code',
          onPressed: scanQRCode,
        ),
        SQOutlineButton(
          text: 'Manually Enter Code',
          onPressed: manuallyEnterCode
        ),
      ]
    );
  }
}