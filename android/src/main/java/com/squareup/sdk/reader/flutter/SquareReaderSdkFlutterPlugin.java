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

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;

public class SquareReaderSdkFlutterPlugin implements MethodCallHandler, FlutterPlugin, ActivityAware {

  private static MethodChannel methodChannel;
  private AuthorizeModule authorizeModule;
  private CheckoutModule checkoutModule;
  private ReaderSettingsModule readerSettingsModule;
  private StoreCustomerCardModule storeCustomerCardModule;

  public static void registerWith(Registrar registrar) {
    SquareReaderSdkFlutterPlugin instance = new SquareReaderSdkFlutterPlugin(registrar.activity());
    instance.onAttachedToEngine(registrar.activity(), registrar.messenger());
    methodChannel.setMethodCallHandler(instance);

  }

  private SquareReaderSdkFlutterPlugin(Context context) {
    init(context);
  }

  /**
   * Needed by GeneratedPluginRegistrant to be able to construct the plugin and call onAttachedToEngine.
   */
  public SquareReaderSdkFlutterPlugin() {
  }

  private void init(Context context) {
    authorizeModule = new AuthorizeModule();
    checkoutModule = new CheckoutModule(context);
    readerSettingsModule = new ReaderSettingsModule(context);
    storeCustomerCardModule = new StoreCustomerCardModule(context);
  }

  private void setContextForModules(final Context context) {
    checkoutModule.setContext(context);
    readerSettingsModule.setContext(context);
    storeCustomerCardModule.setContext(context);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    String methodName = call.method;
    if (methodName.equals("isAuthorized")) {
      authorizeModule.isAuthorized(result);
    } else if (methodName.equals("isAuthorizationInProgress")) {
      authorizeModule.isAuthorizationInProgress(result);
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
    } else if (methodName.equals("startStoreCard")) {
      String customerId = call.argument("customerId");
      storeCustomerCardModule.startStoreCard(customerId, result);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    onAttachedToEngine(flutterPluginBinding.getApplicationContext(), flutterPluginBinding.getBinaryMessenger());
    methodChannel.setMethodCallHandler(this);
  }

  private void onAttachedToEngine(Context context, BinaryMessenger messenger) {
    methodChannel = new MethodChannel(messenger, "square_reader_sdk");
    init(context);
  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    methodChannel = null;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {
    setContextForModules(activityPluginBinding.getActivity());
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding activityPluginBinding) {
    setContextForModules(activityPluginBinding.getActivity());
  }

  @Override
  public void onDetachedFromActivity() {

  }
}
