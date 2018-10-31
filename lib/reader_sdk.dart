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

import 'package:flutter/services.dart';
import 'models.dart';
import 'serializers.dart';
import 'package:built_value/standard_json_plugin.dart';

class ReaderSdk {
  // error codes are defined below, both iOS and Android *MUST* return same error for these errors:
  // Usage error
  static const UsageError = 'USAGE_ERROR';
  // Expected errors:
  // Search KEEP_IN_SYNC_AUTHORIZE_ERROR to update all places
  static const AuthorizeErrorNoNetwork = 'AUTHORIZE_NO_NETWORK';
  // Search KEEP_IN_SYNC_CHECKOUT_ERROR to update all places
  static const CheckoutErrorCanceled = 'CHECKOUT_CANCELED';
  static const CheckoutErrorSdkNotAuthorized = 'CHECKOUT_SDK_NOT_AUTHORIZED';
  // Search KEEP_IN_SYNC_READER_SETTINGS_ERROR to update all places
  static const ReaderSettingsErrorSdkNotAuthorized = 'READER_SETTINGS_SDK_NOT_AUTHORIZED';

  static final _standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

  static const MethodChannel _channel =
      const MethodChannel('square_reader_sdk');

  static Future<bool> get isAuthorized async {
    try {
      bool isAuthorized = await _channel.invokeMethod('isAuthorized');
      return isAuthorized;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<Location> get authorizedLocation async {
    try {
      Map locationNativeObject = await _channel.invokeMethod('authorizedLocation');
      return _standardSerializers.deserializeWith(Location.serializer, locationNativeObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<Location> authorize(String authCode) async {
    try {
      Map<String, dynamic> params = <String, dynamic> {
        'authCode': authCode,
      };
      Map locationNativeObject = await _channel.invokeMethod('authorize', params);
      return _standardSerializers.deserializeWith(Location.serializer, locationNativeObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<bool> get canDeauthorize async {
    try {
      bool canDeauthorize = await _channel.invokeMethod('canDeauthorize');
      return canDeauthorize;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future deauthorize() async {
    try {
      await _channel.invokeMethod('deauthorize');
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<CheckoutResult> startCheckout(CheckoutParameters checkoutParams) async {
    try {
      Map<String, dynamic> params = <String, dynamic> {
        'checkoutParams': _standardSerializers.serializeWith(CheckoutParameters.serializer, checkoutParams),
      };
      Map checkoutResultNativeObject = await _channel.invokeMethod('startCheckout', params);
      return _standardSerializers.deserializeWith(CheckoutResult.serializer, checkoutResultNativeObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future startReaderSettings() async {
    try {
      await _channel.invokeMethod('startReaderSettings');
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }
}

class ReaderSdkException implements Exception {

  final String code;

  final String message;

  final String debugCode;

  final String debugMessage;

  ReaderSdkException(
    this.code,
    this.message,
    this.debugCode,
    this.debugMessage,
  ) : assert(code != null), assert(debugCode != null);

  @override
  String toString() => 'PlatformException($code, $message, $debugCode, $debugMessage)';
}
