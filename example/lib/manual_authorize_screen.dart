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
import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';
import 'components/dialog_modal.dart';
import 'components/loading.dart';

class ManualAuthorizeScreen extends StatefulWidget {
  @override
  _ManualAuthorizeScreenState createState() => new _ManualAuthorizeScreenState();
}

class _ManualAuthorizeScreenState extends State<ManualAuthorizeScreen> {
  bool _isLoading = false;
  final textEditingController = TextEditingController();

  onCancel() async {
    Navigator.pop(context);
  }

  onAuthorize() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await SquareReaderSdkPlugin.authorize(this.textEditingController.text);
      Navigator.popAndPushNamed(context, '/checkout');
    } on ReaderSdkException catch(e) {
      return displayErrorModal(context, e.message);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildManualAuthorizeScreen(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(32.0, 84.0, 32.0, 32.0),
          child: Text(
            'Enter an authorization code.',
            textAlign: TextAlign.center,
          ),
        ),
        Container( // Container for text field
          margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 18.0,
            ),
            controller: textEditingController,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: 'Authorization Code',
              hintStyle: TextStyle(
                color: Colors.white70,
              ),
              fillColor: Color.fromRGBO(83,166,255, 1.0),
              filled: true,
            ),
          ),
        ),
        Container( // Container for buttons
          child: SQButtonContainer(
            buttons: [
              SQRaisedButton(
                text: 'Authorize',
                onPressed: onAuthorize,
              ),
              SQOutlineButton(
                text: 'Cancel',
                onPressed: onCancel
              ),
            ]
          ),
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _isLoading? new LoadingWidget() : _buildManualAuthorizeScreen(context)
    );
  }
}