import 'dart:async';

import 'package:flutter/services.dart';
import 'location.dart';
import 'checkout_result.dart';
import 'checkout_parameters.dart';

class SquareReaderSdkPlugin {
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

  static const MethodChannel _channel =
      const MethodChannel('square_reader_sdk_flutter_plugin');

  static Future<String> get platformVersion async {
    try {
      final String version = await _channel.invokeMethod('getPlatformVersion');
      return version;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<bool> get isAuthorized async {
    try {
      final bool isAuthorized = await _channel.invokeMethod('isAuthorized');
      return isAuthorized;
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<Location> get authorizedLocation async {
    try {
      final Map<dynamic, dynamic> locationNativeObject = await _channel.invokeMethod('authorizedLocation');
      return Location.castToLocation(locationNativeObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<Location> authorize(String authCode) async {
    try {
      final Map<String, dynamic> params = <String, dynamic> {
        'authCode': authCode,
      };
      final Map<dynamic, dynamic> locationNativeObject = await _channel.invokeMethod('authorize', params);
      return Location.castToLocation(locationNativeObject);
    } on PlatformException catch (ex) {
      throw ReaderSdkException(ex.code, ex.message, ex.details['debugCode'], ex.details['debugMessage']);
    }
  }

  static Future<bool> get canDeauthorize async {
    try {
      final bool canDeauthorize = await _channel.invokeMethod('canDeauthorize');
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
      final Map<String, dynamic> params = <String, dynamic> {
        'checkoutParams': checkoutParams.toMap(),
      };
      final Map<dynamic, dynamic> checkoutResultNativeObject = await _channel.invokeMethod('startCheckout', params);
      return CheckoutResult.castToCheckoutResult(checkoutResultNativeObject);
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
