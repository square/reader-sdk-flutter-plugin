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
import 'package:square_reader_sdk/reader_sdk.dart';
import 'package:square_reader_sdk/models.dart';

import 'widgets/buttons.dart';
import 'widgets/dialog_modal.dart';
import 'widgets/loading.dart';

const _debug = !bool.fromEnvironment("dart.vm.product");

/// A screen that requires an authorization code in a text field
class ManualAuthorizeScreen extends StatefulWidget {
  @override
  _ManualAuthorizeScreenState createState() => _ManualAuthorizeScreenState();
}

class _ManualAuthorizeScreenState extends State<ManualAuthorizeScreen> {
  bool _isLoading = false;
  final TextEditingController textEditingController = TextEditingController();

  void onCancel() async {
    Navigator.pop(context);
  }

  void onAuthorize() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await ReaderSdk.authorize(textEditingController.text);
      Navigator.popAndPushNamed(context, '/checkout');
    } on ReaderSdkException catch (e) {
      switch (e.code) {
        case ErrorCode.authorizeErrorNoNetwork:
          displayErrorModal(context, 'Please connect your device to network.');
          break;
        case ErrorCode.usageError:
          var errorMessage = e.message;
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

  Widget _buildManualAuthorizeScreen(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.fromLTRB(32.0, 84.0, 32.0, 32.0),
          child: Text(
            'Enter an authorization code.',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          // Container for text field
          margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 18.0,
            ),
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: 'Authorization Code',
              hintStyle: TextStyle(
                color: Colors.white70,
              ),
              fillColor: Color.fromRGBO(83, 166, 255, 1.0),
              filled: true,
            ),
          ),
        ),
        Container(
          // Container for buttons
          child: SQButtonContainer(buttons: [
            SQRaisedButton(
              text: 'Authorize',
              onPressed: onAuthorize,
            ),
            SQOutlineButton(text: 'Cancel', onPressed: onCancel),
          ]),
        ),
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
      body:
          _isLoading ? LoadingWidget() : _buildManualAuthorizeScreen(context));
}
