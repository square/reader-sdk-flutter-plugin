package com.squareup.readersdkflutterplugin;

import android.app.Activity;
import com.squareup.sdk.reader.flutter.AuthorizeModule;
import com.squareup.sdk.reader.flutter.CheckoutModule;
import com.squareup.sdk.reader.flutter.ReaderSettingsModule;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;

/** ReaderSdkFlutterPlugin */
public class ReaderSdkFlutterPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "square_reader_sdk_flutter_plugin");
    channel.setMethodCallHandler(new ReaderSdkFlutterPlugin(registrar.activity()));
  }

  private final AuthorizeModule authorizeModule;
  private final CheckoutModule checkoutModule;
  private final ReaderSettingsModule readerSettingsModule;

  private ReaderSdkFlutterPlugin(Activity activity) {
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
