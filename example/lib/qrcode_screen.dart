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
import 'package:square_reader_sdk_flutter_plugin/square_reader_sdk_flutter_plugin.dart';
import 'components/dialog_modal.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'components/loading.dart';

class QRCodeAuthorizeScreen extends StatefulWidget {
  @override
  _QRCodeAuthorizeScreenState createState() => new _QRCodeAuthorizeScreenState();
}

class _QRCodeAuthorizeScreenState extends State<QRCodeAuthorizeScreen> {
  QRReaderController controller;
  bool _isLoading = false;

  authorize(String authCode) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await SquareReaderSdkPlugin.authorize(authCode);
      Navigator.pushNamed(context, '/checkout');
    } on ReaderSdkException catch(e) {
      return displayErrorModal(context, e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      controller = new QRReaderController(cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value){
        authorize(value);

        // try again after 3 seconds
        new Future.delayed(const Duration(seconds: 3), controller.startScanning);
      });

      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
        controller.startScanning();
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized || _isLoading) {
      return new LoadingWidget();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new QRReaderPreview(controller));
  }
}