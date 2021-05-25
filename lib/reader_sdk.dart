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
import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter/services.dart';
import 'models.dart';
import 'src/serializers.dart';

// ignore: avoid_classes_with_only_static_members
class ReaderSdk {
  static final _standardSerializers =
      (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

  static const MethodChannel _channel = MethodChannel('square_reader_sdk');

  static Future<bool> get isAuthorized async {
    try {
      bool isAuthorized = await _channel.invokeMethod('isAuthorized');
      return isAuthorized;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future<bool> get isAuthorizationInProgress async {
    try {
      bool isAuthorizationInProgress =
          await _channel.invokeMethod('isAuthorizationInProgress');
      return isAuthorizationInProgress;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future<Location> get authorizedLocation async {
    try {
      var locationNativeObject =
          await _channel.invokeMethod('authorizedLocation');
      return _standardSerializers.deserializeWith(
          Location.serializer, locationNativeObject)!;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future<Location> authorize(String authCode) async {
    try {
      var params = <String, dynamic>{
        'authCode': authCode,
      };
      var locationNativeObject =
          await _channel.invokeMethod('authorize', params);
      return _standardSerializers.deserializeWith(
          Location.serializer, locationNativeObject)!;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future<bool> get canDeauthorize async {
    try {
      bool canDeauthorize = await _channel.invokeMethod('canDeauthorize');
      return canDeauthorize;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future deauthorize() async {
    try {
      await _channel.invokeMethod('deauthorize');
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future<CheckoutResult> startCheckout(
      CheckoutParameters checkoutParams) async {
    try {
      var params = <String, dynamic>{
        'checkoutParams': _standardSerializers.serializeWith(
            CheckoutParameters.serializer, checkoutParams),
      };
      var checkoutResultNativeObject =
          await _channel.invokeMethod('startCheckout', params);
      return _standardSerializers.deserializeWith(
          CheckoutResult.serializer, checkoutResultNativeObject)!;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future startReaderSettings() async {
    try {
      await _channel.invokeMethod('startReaderSettings');
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }

  static Future startStoreCard(String customerId) async {
    var params = <String, dynamic>{
      'customerId': customerId,
    };
    try {
      var cardObject = await _channel.invokeMethod('startStoreCard', params);
      return _standardSerializers.deserializeWith(Card.serializer, cardObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'],
          ex.details['debugMessage']);
    }
  }
}

class ReaderSdkException implements Exception {
  static final _standardSerializers =
      (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

  final String _code;

  final String? message;

  final String debugCode;

  final String? debugMessage;

  ErrorCode? get code =>
      _standardSerializers.deserializeWith(ErrorCode.serializer, _code);

  ReaderSdkException(
    this._code,
    this.message,
    this.debugCode,
    this.debugMessage,
  );

  @override
  String toString() =>
      'PlatformException($code, $message, $debugCode, $debugMessage)';
}
