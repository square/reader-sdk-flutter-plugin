/*
Copyright 2022 Square Inc.

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

import com.squareup.sdk.reader.ReaderSdk;

public class SquareReaderSdkFlutterPlugin implements MethodCallHandler, FlutterPlugin, ActivityAware {

  private static MethodChannel methodChannel;
  private AuthorizeModule authorizeModule;
  private CheckoutModule checkoutModule;
  private ReaderSettingsModule readerSettingsModule;
  private StoreCustomerCardModule storeCustomerCardModule;
  private Activity currentActivity;
  private static boolean sdkInitialized = false;

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

  private void setContextForModules(final Activity activity) {
    currentActivity = activity;
    checkoutModule.setContext(activity);
    readerSettingsModule.setContext(activity);
    storeCustomerCardModule.setContext(activity);
  }

  @Override
  public void onMethodCall(MethodCall call, @NonNull Result result) {
    initializeReaderSdk();

    String methodName = call.method;
    switch (methodName) {
      case "isAuthorized":
        authorizeModule.isAuthorized(result);
        break;
      case "isAuthorizationInProgress":
        authorizeModule.isAuthorizationInProgress(result);
        break;
      case "authorizedLocation":
        authorizeModule.authorizedLocation(result);
        break;
      case "authorize":
        String authCode = call.argument("authCode");
        authorizeModule.authorize(authCode, result);
        break;
      case "canDeauthorize":
        authorizeModule.canDeauthorize(result);
        break;
      case "deauthorize":
        authorizeModule.deauthorize(result);
        break;
      case "startCheckout":
        HashMap<String, Object> checkoutParams = call.argument("checkoutParams");
        checkoutModule.startCheckout(checkoutParams, result);
        break;
      case "startReaderSettings":
        readerSettingsModule.startReaderSettings(result);
        break;
      case "startStoreCard":
        String customerId = call.argument("customerId");
        storeCustomerCardModule.startStoreCard(customerId, result);
        break;
      default:
        result.notImplemented();
        break;
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

  private void initializeReaderSdk() {
    if (sdkInitialized) {
      return;
    }

    try {
      ReaderSdk.initialize(currentActivity.getApplication());
      sdkInitialized = true;
    } catch (IllegalStateException e) {
      // allow double-initialization; devs _should_ init in Application.onCreate,
      // but to be non-breaking we try here also in case they didn't.
    }
  }
}