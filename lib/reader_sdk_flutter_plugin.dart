import 'dart:async';

import 'package:flutter/services.dart';

class ReaderSdkFlutterPlugin {
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
      const MethodChannel('reader_sdk_flutter_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> get isAuthorized async {
    final bool isAuthorized = await _channel.invokeMethod('isAuthorized');
    return isAuthorized;
  }

  static Future<Map<String, dynamic>> get authorizedLocation async {
    final Map<dynamic, dynamic> location = await _channel.invokeMethod('authorizedLocation');
    return location.cast<String, dynamic>();
  }

  static Future<Map<String, dynamic>> authorize(String authCode) async {
    final Map<String, dynamic> params = <String, dynamic> {
      'authCode': authCode,
    };
    final Map<dynamic, dynamic> location = await _channel.invokeMethod('authorize', params);
    return location.cast<String, dynamic>();
  }

  static Future<bool> get canDeauthorize async {
    final bool canDeauthorize = await _channel.invokeMethod('canDeauthorize');
    return canDeauthorize;
  }

  static Future deauthorize() async {
    await _channel.invokeMethod('deauthorize');
  }

  static Future<Map<String, dynamic>> startCheckout(Map<String, dynamic> checkoutParams) async {
    final Map<String, dynamic> params = <String, dynamic> {
      'checkoutParams': checkoutParams,
    };
    final Map<dynamic, dynamic> checkoutResult = await _channel.invokeMethod('startCheckout', params);
    return checkoutResult.cast<String, dynamic>();
  }

  static Future startReaderSettings() async {
    await _channel.invokeMethod('startReaderSettings');
  }
}
