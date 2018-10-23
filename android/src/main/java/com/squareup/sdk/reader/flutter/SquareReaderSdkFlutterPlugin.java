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
package com.squareup.sdk.reader.flutter;

import android.app.Activity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;

public class SquareReaderSdkFlutterPlugin implements MethodCallHandler {
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "square_reader_sdk");
    channel.setMethodCallHandler(new SquareReaderSdkFlutterPlugin(registrar.activity()));
  }

  private final AuthorizeModule authorizeModule;
  private final CheckoutModule checkoutModule;
  private final ReaderSettingsModule readerSettingsModule;

  private SquareReaderSdkFlutterPlugin(Activity activity) {
    authorizeModule = new AuthorizeModule();
    checkoutModule = new CheckoutModule(activity);
    readerSettingsModule = new ReaderSettingsModule(activity);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    String methodName = call.method;
    if (methodName.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (methodName.equals("isAuthorized")) {
      authorizeModule.isAuthorized(result);
    } else if (methodName.equals("authorizedLocation")) {
      authorizeModule.authorizedLocation(result);
    } else if (methodName.equals("authorize")) {
      String authCode = call.argument("authCode");
      authorizeModule.authorize(authCode, result);
    } else if (methodName.equals("canDeauthorize")) {
      authorizeModule.canDeauthorize(result);
    } else if (methodName.equals("deauthorize")) {
      authorizeModule.deauthorize(result);
    } else if (methodName.equals("startCheckout")) {
      HashMap<String, Object> checkoutParams = call.argument("checkoutParams");
      checkoutModule.startCheckout(checkoutParams, result);
    } else if (methodName.equals("startReaderSettings")) {
      readerSettingsModule.startReaderSettings(result);
    } else {
      result.notImplemented();
    }
  }
}
