package com.squareup.sdk.reader.flutter;

import com.squareup.sdk.reader.flutter.internal.ErrorHandlerUtils;
import com.squareup.sdk.reader.flutter.internal.converter.LocationConverter;
import com.squareup.sdk.reader.ReaderSdk;
import com.squareup.sdk.reader.authorization.AuthorizeCallback;
import com.squareup.sdk.reader.authorization.AuthorizeErrorCode;
import com.squareup.sdk.reader.authorization.DeauthorizeCallback;
import com.squareup.sdk.reader.authorization.DeauthorizeErrorCode;
import com.squareup.sdk.reader.authorization.Location;
import com.squareup.sdk.reader.core.CallbackReference;
import com.squareup.sdk.reader.core.ResultError;
import io.flutter.plugin.common.MethodChannel.Result;

public final class AuthorizeModule implements IReaderSdkModule {
  // Define all the authorization error debug codes and messages below
  // These error codes and messages **MUST** align with iOS error codes and javascript error codes
  // Search KEEP_IN_SYNC_AUTHORIZE_ERROR to update all places

  // react native module debug error codes
  private static final String FL_AUTH_LOCATION_NOT_AUTHORIZED = "fl_auth_location_not_authorized";

  // react native module debug messages
  private static final String FL_MESSAGE_AUTH_LOCATION_NOT_AUTHORIZED = "This device must be authorized with a Square location in order to get that location. Obtain an authorization code for a Square location from the mobile/authorization-code endpoint and then call authorizeAsync.";

  // Android only react native errors and messages
  private static final String FL_AUTHORIZE_ALREADY_IN_PROGRESS = "fl_authorize_already_in_progress";
  private static final String FL_DEAUTHORIZE_ALREADY_IN_PROGRESS = "fl_deauthorize_already_in_progress";
  private static final String FL_MESSAGE_AUTHORIZE_ALREADY_IN_PROGRESS = "Authorization is already in progress. Please wait for authorizeAsync to complete.";
  private static final String FL_MESSAGE_DEAUTHORIZE_ALREADY_IN_PROGRESS = "Deauthorization is already in progress. Please wait for deauthorizeAsync to complete.";

  private CallbackReference authorizeCallbackRef;
  private CallbackReference deauthorizeCallbackRef;
  private final LocationConverter locationConverter;

  public AuthorizeModule() {
    locationConverter = new LocationConverter();
  }

  public void isAuthorized(Result flutterResult) {
    flutterResult.success(ReaderSdk.authorizationManager().getAuthorizationState().isAuthorized());
  }

  public void authorizedLocation(Result flutterResult) {
    if (ReaderSdk.authorizationManager().getAuthorizationState().isAuthorized()) {
      flutterResult.success(locationConverter.toJSObject(ReaderSdk.authorizationManager().getAuthorizationState().getAuthorizedLocation()));
    } else {
      String errorJsonMessage = ErrorHandlerUtils.createNativeModuleError(FL_AUTH_LOCATION_NOT_AUTHORIZED, FL_MESSAGE_AUTH_LOCATION_NOT_AUTHORIZED);
      flutterResult.error(ErrorHandlerUtils.USAGE_ERROR, errorJsonMessage, null);
    }
  }

  public void authorize(final String authCode, final Result flutterResult) {
    if (authorizeCallbackRef != null) {
      String errorJsonMessage = ErrorHandlerUtils.createNativeModuleError(FL_AUTHORIZE_ALREADY_IN_PROGRESS, FL_MESSAGE_AUTHORIZE_ALREADY_IN_PROGRESS);
      flutterResult.error(ErrorHandlerUtils.USAGE_ERROR, errorJsonMessage, null);
      return;
    }
    AuthorizeCallback authCallback = new AuthorizeCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Location, ResultError<AuthorizeErrorCode>> result) {
        authorizeCallbackRef.clear();
        authorizeCallbackRef = null;
        if (result.isError()) {
          ResultError<AuthorizeErrorCode> error = result.getError();
          String errorJsonMessage = ErrorHandlerUtils.serializeErrorToJson(error.getDebugCode(), error.getMessage(), error.getDebugMessage());
          flutterResult.error(ErrorHandlerUtils.getErrorCode(error.getCode()), errorJsonMessage, null);
          return;
        }
        Location location = result.getSuccessValue();
        LocationConverter locationConverter = new LocationConverter();
        flutterResult.success(locationConverter.toJSObject(location));
      }
    };
    authorizeCallbackRef = ReaderSdk.authorizationManager().addAuthorizeCallback(authCallback);
    ReaderSdk.authorizationManager().authorize(authCode);
  }

  public void canDeauthorize(Result flutterResult) {
    flutterResult.success(ReaderSdk.authorizationManager().getAuthorizationState().canDeauthorize());
  }

  public void deauthorize(final Result flutterResult) {
    if (deauthorizeCallbackRef != null) {
      String errorJsonMessage = ErrorHandlerUtils.createNativeModuleError(FL_DEAUTHORIZE_ALREADY_IN_PROGRESS, FL_MESSAGE_DEAUTHORIZE_ALREADY_IN_PROGRESS);
      flutterResult.error(ErrorHandlerUtils.USAGE_ERROR, errorJsonMessage, null);
      return;
    }
    DeauthorizeCallback deauthCallback = new DeauthorizeCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Void, ResultError<DeauthorizeErrorCode>> result) {
        deauthorizeCallbackRef.clear();
        deauthorizeCallbackRef = null;
        if (result.isError()) {
          ResultError<DeauthorizeErrorCode> error = result.getError();
          String errorJsonMessage = ErrorHandlerUtils.serializeErrorToJson(error.getDebugCode(), error.getMessage(), error.getDebugMessage());
          flutterResult.error(ErrorHandlerUtils.getErrorCode(error.getCode()), errorJsonMessage, null);
          return;
        }
      }
    };
    deauthorizeCallbackRef = ReaderSdk.authorizationManager().addDeauthorizeCallback(deauthCallback);
    ReaderSdk.authorizationManager().deauthorize();
  }

  public void onDestroy() {
    // clear the callback to avoid memory leaks when react native module is destroyed
    if (authorizeCallbackRef != null) {
      authorizeCallbackRef.clear();
    }
    if (deauthorizeCallbackRef != null) {
      deauthorizeCallbackRef.clear();
    }
  }
}
