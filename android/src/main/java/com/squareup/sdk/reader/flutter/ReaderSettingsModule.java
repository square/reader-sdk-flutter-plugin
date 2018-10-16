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
import com.squareup.sdk.reader.ReaderSdk;
import com.squareup.sdk.reader.core.CallbackReference;
import com.squareup.sdk.reader.core.ResultError;
import com.squareup.sdk.reader.flutter.internal.ErrorHandlerUtils;
import com.squareup.sdk.reader.hardware.ReaderSettingsActivityCallback;
import com.squareup.sdk.reader.hardware.ReaderSettingsErrorCode;
import io.flutter.plugin.common.MethodChannel.Result;

final class ReaderSettingsModule {
  // Define all the reader settings debug codes and messages below
  // These error codes and messages **MUST** align with iOS error codes and javascript error codes
  // Search KEEP_IN_SYNC_READER_SETTINGS_ERROR to update all places

  // react native module debug error codes
  private static final String FL_READER_SETTINGS_ALREADY_IN_PROGRESS = "fl_reader_settings_already_in_progress";

  // react native module debug messages
  private static final String FL_MESSAGE_READER_SETTINGS_ALREADY_IN_PROGRESS = "A reader settings operation is already in progress. Ensure that the in-progress reader settings is completed before calling startReaderSettingsAsync again.";

  private volatile CallbackReference readerSettingCallbackRef;
  private final Activity currentActivity;

  public ReaderSettingsModule(Activity activity) {
    currentActivity = activity;
  }

  public void startReaderSettings(final Result flutterResult) {
    if (readerSettingCallbackRef != null) {
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_READER_SETTINGS_ALREADY_IN_PROGRESS),
          ErrorHandlerUtils.getDebugErrorObject(FL_READER_SETTINGS_ALREADY_IN_PROGRESS, FL_MESSAGE_READER_SETTINGS_ALREADY_IN_PROGRESS));
      return;
    }
    ReaderSettingsActivityCallback readerSettingsCallback = new ReaderSettingsActivityCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Void, ResultError<ReaderSettingsErrorCode>> result) {
        readerSettingCallbackRef.clear();
        readerSettingCallbackRef = null;
        if (result.isError()) {
          ResultError<ReaderSettingsErrorCode> error = result.getError();
          flutterResult.error(
              ErrorHandlerUtils.getErrorCode(error.getCode()),
              error.getMessage(),
              ErrorHandlerUtils.getDebugErrorObject(error.getDebugCode(), error.getDebugMessage()));
          return;
        }
        flutterResult.success(null);
      }
    };
    readerSettingCallbackRef = ReaderSdk.readerManager()
        .addReaderSettingsActivityCallback(readerSettingsCallback);

    ReaderSdk.readerManager().startReaderSettingsActivity(currentActivity);
  }
}
