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

final class AuthorizeModule {
  // Define all the authorization error debug codes and messages below
  // These error codes and messages **MUST** align with iOS error codes and dart error codes
  // Search KEEP_IN_SYNC_AUTHORIZE_ERROR to update all places

  // flutter plugin debug error codes
  private static final String FL_AUTH_LOCATION_NOT_AUTHORIZED = "fl_auth_location_not_authorized";

  // flutter plugin debug messages
  private static final String FL_MESSAGE_AUTH_LOCATION_NOT_AUTHORIZED = "This device must be authorized with a Square location in order to get that location. Obtain an authorization code for a Square location from the mobile/authorization-code endpoint and then call authorizeAsync.";

  // Android only flutter plugin errors and messages
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

  public void isAuthorizationInProgress(Result flutterResult) {
    flutterResult.success(ReaderSdk.authorizationManager().getAuthorizationState().isAuthorizationInProgress());
  }

  public void authorizedLocation(Result flutterResult) {
    if (ReaderSdk.authorizationManager().getAuthorizationState().isAuthorized()) {
      flutterResult.success(locationConverter.toMapObject(ReaderSdk.authorizationManager().getAuthorizationState().getAuthorizedLocation()));
    } else {
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_AUTH_LOCATION_NOT_AUTHORIZED),
          ErrorHandlerUtils.getDebugErrorObject(FL_AUTH_LOCATION_NOT_AUTHORIZED, FL_MESSAGE_AUTH_LOCATION_NOT_AUTHORIZED));
    }
  }

  public void authorize(final String authCode, final Result flutterResult) {
    if (authorizeCallbackRef != null) {
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_AUTHORIZE_ALREADY_IN_PROGRESS),
          ErrorHandlerUtils.getDebugErrorObject(FL_AUTHORIZE_ALREADY_IN_PROGRESS, FL_MESSAGE_AUTHORIZE_ALREADY_IN_PROGRESS));
      return;
    }
    AuthorizeCallback authCallback = new AuthorizeCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Location, ResultError<AuthorizeErrorCode>> result) {
        authorizeCallbackRef.clear();
        authorizeCallbackRef = null;
        if (result.isError()) {
          ResultError<AuthorizeErrorCode> error = result.getError();
          flutterResult.error(
              ErrorHandlerUtils.getErrorCode(error.getCode()),
              error.getMessage(),
              ErrorHandlerUtils.getDebugErrorObject(error.getDebugCode(), error.getDebugMessage()));
          return;
        }
        Location location = result.getSuccessValue();
        flutterResult.success(locationConverter.toMapObject(location));
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
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_DEAUTHORIZE_ALREADY_IN_PROGRESS),
          ErrorHandlerUtils.getDebugErrorObject(FL_DEAUTHORIZE_ALREADY_IN_PROGRESS, FL_MESSAGE_DEAUTHORIZE_ALREADY_IN_PROGRESS));
      return;
    }
    DeauthorizeCallback deauthorizeCallback = new DeauthorizeCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Void, ResultError<DeauthorizeErrorCode>> result) {
        deauthorizeCallbackRef.clear();
        deauthorizeCallbackRef = null;
        if (result.isError()) {
          ResultError<DeauthorizeErrorCode> error = result.getError();
          flutterResult.error(
              ErrorHandlerUtils.getErrorCode(error.getCode()),
              error.getMessage(),
              ErrorHandlerUtils.getDebugErrorObject(error.getDebugCode(), error.getDebugMessage()));
        }
      }
    };
    deauthorizeCallbackRef = ReaderSdk.authorizationManager().addDeauthorizeCallback(deauthorizeCallback);
    ReaderSdk.authorizationManager().deauthorize();
    flutterResult.success(null);
  }
}
