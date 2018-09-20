package com.squareup.readersdkflutterplugin;

import com.squareup.sdk.reader.flutter.AuthorizeModule;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ReaderSdkFlutterPlugin */
public class ReaderSdkFlutterPlugin implements MethodCallHandler {

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "reader_sdk_flutter_plugin");
    channel.setMethodCallHandler(new ReaderSdkFlutterPlugin());
  }

  private final AuthorizeModule authorizeModule;

  public ReaderSdkFlutterPlugin() {
    authorizeModule = new AuthorizeModule();
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
    } else {
      result.notImplemented();
    }
  }
}
