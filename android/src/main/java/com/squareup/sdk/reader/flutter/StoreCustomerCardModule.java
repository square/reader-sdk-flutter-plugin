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

import com.squareup.sdk.reader.ReaderSdk;
import com.squareup.sdk.reader.checkout.Card;
import com.squareup.sdk.reader.core.CallbackReference;
import com.squareup.sdk.reader.core.ResultError;
import com.squareup.sdk.reader.crm.StoreCardActivityCallback;
import com.squareup.sdk.reader.crm.StoreCustomerCardErrorCode;
import com.squareup.sdk.reader.flutter.internal.ErrorHandlerUtils;
import com.squareup.sdk.reader.flutter.internal.converter.CardConverter;
import io.flutter.plugin.common.MethodChannel.Result;

final class StoreCustomerCardModule {
  // Define all the checkout debug codes and messages below
  // These error codes and messages **MUST** align with iOS error codes and dart error codes
  // Search KEEP_IN_SYNC_STORE_CUSTOMER_CARD_ERROR to update all places

  // flutter plugin debug error codes
  private static final String FL_STORE_CUSTOMER_CARD_ALREADY_IN_PROGRESS = "fl_store_customer_card_already_in_progress";

  // flutter plugin debug messages
  private static final String FL_MESSAGE_STORE_CUSTOMER_CARD_ALREADY_IN_PROGRESS = "A store customer card operation is already in progress. Ensure that the in-progress store customer card is completed before calling startStoreCardAsync again.";

  private Context currentContext;
  private final CardConverter cardConverter;
  private volatile CallbackReference storeCustomerCardCallbackRef;


  public StoreCustomerCardModule(Context context) {
    currentContext = context;
    cardConverter = new CardConverter();
  }

  public void startStoreCard(String customerId, final Result flutterResult) {
    if (storeCustomerCardCallbackRef != null) {
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_STORE_CUSTOMER_CARD_ALREADY_IN_PROGRESS),
          ErrorHandlerUtils.getDebugErrorObject(FL_STORE_CUSTOMER_CARD_ALREADY_IN_PROGRESS, FL_MESSAGE_STORE_CUSTOMER_CARD_ALREADY_IN_PROGRESS));
      return;
    }

    StoreCardActivityCallback storeCardActivityCallback = new StoreCardActivityCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<Card, ResultError<StoreCustomerCardErrorCode>> result) {
        storeCustomerCardCallbackRef.clear();
        storeCustomerCardCallbackRef = null;
        if (result.isError()) {
          ResultError<StoreCustomerCardErrorCode> error = result.getError();
          flutterResult.error(
              ErrorHandlerUtils.getErrorCode(error.getCode()),
              error.getMessage(),
              ErrorHandlerUtils.getDebugErrorObject(error.getDebugCode(), error.getDebugMessage()));
          return;
        }

        Card card = result.getSuccessValue();
        flutterResult.success(cardConverter.toMapObject(card));
      }
    };

    storeCustomerCardCallbackRef = ReaderSdk.customerCardManager().addStoreCardActivityCallback(storeCardActivityCallback);
    ReaderSdk.customerCardManager().startStoreCardActivity(currentContext, customerId);
  }

  public void setContext(Context context) {
    this.currentContext = context;
  }
}
