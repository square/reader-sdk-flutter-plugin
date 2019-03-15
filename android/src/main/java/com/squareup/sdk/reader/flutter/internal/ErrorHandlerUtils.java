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
package com.squareup.sdk.reader.flutter.internal;

import com.squareup.sdk.reader.authorization.AuthorizeErrorCode;
import com.squareup.sdk.reader.checkout.CheckoutErrorCode;
import com.squareup.sdk.reader.core.ErrorCode;
import com.squareup.sdk.reader.crm.StoreCustomerCardErrorCode;
import com.squareup.sdk.reader.hardware.ReaderSettingsErrorCode;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class ErrorHandlerUtils {
    // Define all the error codes and messages below
    // These error codes and messages **MUST** align with iOS error codes and dart error codes

    // Usage error
    public static final String USAGE_ERROR = "USAGE_ERROR";

    private static final Map<AuthorizeErrorCode, String> authorizeErrorMap;
    private static final Map<CheckoutErrorCode, String> checkoutErrorMap;
    private static final Map<ReaderSettingsErrorCode, String> readerSettingsErrorMap;
    private static final Map<StoreCustomerCardErrorCode, String> storeCustomerCardErrorMap;

    static {
        // Build Expected Error mappings
        authorizeErrorMap = new LinkedHashMap<>();
        for(AuthorizeErrorCode authorizeErrorCode : AuthorizeErrorCode.values()) {
            // Search KEEP_IN_SYNC_AUTHORIZE_ERROR to update all places
            switch (authorizeErrorCode) {
                case NO_NETWORK:
                    authorizeErrorMap.put(AuthorizeErrorCode.NO_NETWORK, "AUTHORIZE_NO_NETWORK");
                    break;
                case USAGE_ERROR:
                    // Usage error is handled separately
                    break;
                default:
                    throw new RuntimeException("Unexpected auth error code: " + authorizeErrorCode.name());
            }
        }

        checkoutErrorMap = new LinkedHashMap<>();
        for(CheckoutErrorCode checkoutErrorCode : CheckoutErrorCode.values()) {
            // Search KEEP_IN_SYNC_CHECKOUT_ERROR to update all places
            switch (checkoutErrorCode) {
                case SDK_NOT_AUTHORIZED:
                    checkoutErrorMap.put(CheckoutErrorCode.SDK_NOT_AUTHORIZED, "CHECKOUT_SDK_NOT_AUTHORIZED");
                    break;
                case CANCELED:
                    checkoutErrorMap.put(CheckoutErrorCode.CANCELED, "CHECKOUT_CANCELED");
                    break;
                case USAGE_ERROR:
                    // Usage error is handled separately
                    break;
                default:
                    throw new RuntimeException("Unexpected checkout error code: " + checkoutErrorCode.name());
            }
        }

        readerSettingsErrorMap = new LinkedHashMap<>();
        for(ReaderSettingsErrorCode readerSettingsErrorCode : ReaderSettingsErrorCode.values()) {
            // Search KEEP_IN_SYNC_READER_SETTINGS_ERROR to update all places
            switch (readerSettingsErrorCode) {
                case SDK_NOT_AUTHORIZED:
                    readerSettingsErrorMap.put(ReaderSettingsErrorCode.SDK_NOT_AUTHORIZED, "READER_SETTINGS_SDK_NOT_AUTHORIZED");
                    break;
                case USAGE_ERROR:
                    // Usage error is handled separately
                    break;
                default:
                    throw new RuntimeException("Unexpected reader settings error code: " + readerSettingsErrorCode.name());
            }
        }

        storeCustomerCardErrorMap = new LinkedHashMap<>();
        for(StoreCustomerCardErrorCode storeCustomerCardErrorCode : StoreCustomerCardErrorCode.values()) {
            // Search KEEP_IN_SYNC_STORE_CUSTOMER_CARD_ERROR to update all places
            switch (storeCustomerCardErrorCode) {
                case CANCELED:
                    storeCustomerCardErrorMap.put(StoreCustomerCardErrorCode.CANCELED, "STORE_CUSTOMER_CARD_CANCELED");
                    break;
                case INVALID_CUSTOMER_ID:
                    storeCustomerCardErrorMap.put(StoreCustomerCardErrorCode.INVALID_CUSTOMER_ID, "STORE_CUSTOMER_CARD_INVALID_CUSTOMER_ID");
                    break;
                case SDK_NOT_AUTHORIZED:
                    storeCustomerCardErrorMap.put(StoreCustomerCardErrorCode.SDK_NOT_AUTHORIZED, "STORE_CUSTOMER_CARD_SDK_NOT_AUTHORIZED");
                    break;
                case NO_NETWORK:
                    storeCustomerCardErrorMap.put(StoreCustomerCardErrorCode.NO_NETWORK, "STORE_CUSTOMER_CARD_NO_NETWORK");
                    break;
                case USAGE_ERROR:
                    // Usage error is handled separately
                    break;
                default:
                    throw new RuntimeException("Unexpected reader settings error code: " + storeCustomerCardErrorCode.name());
            }
        }
    }

    public static String getNativeModuleErrorMessage(String nativeModuleErrorCode) {
        return String.format("Something went wrong. Please contact the developer of this application and provide them with this error code: %s", nativeModuleErrorCode);
    }

    public static HashMap<String, String> getDebugErrorObject(String debugCode, String debugMessage) {
        HashMap<String, String> errorData = new HashMap<>();
        errorData.put("debugCode", debugCode);
        errorData.put("debugMessage", debugMessage);
        return errorData;
    }

    public static String getErrorCode(ErrorCode nativeErrorCode) {
        if (nativeErrorCode.isUsageError()) {
            return USAGE_ERROR;
        } else {
            String errorCodeString;
            if (nativeErrorCode instanceof AuthorizeErrorCode) {
                AuthorizeErrorCode authErrorCode = (AuthorizeErrorCode)nativeErrorCode;
                errorCodeString = authorizeErrorMap.get(authErrorCode);
            } else if (nativeErrorCode instanceof CheckoutErrorCode) {
                CheckoutErrorCode checkoutErrorCode = (CheckoutErrorCode)nativeErrorCode;
                errorCodeString = checkoutErrorMap.get(checkoutErrorCode);
            } else if (nativeErrorCode instanceof ReaderSettingsErrorCode) {
                ReaderSettingsErrorCode readerSettingsErrorCode = (ReaderSettingsErrorCode)nativeErrorCode;
                errorCodeString = readerSettingsErrorMap.get(readerSettingsErrorCode);
            } else if (nativeErrorCode instanceof StoreCustomerCardErrorCode) {
                StoreCustomerCardErrorCode storeCustomerCardErrorCode = (StoreCustomerCardErrorCode)nativeErrorCode;
                errorCodeString = storeCustomerCardErrorMap.get(storeCustomerCardErrorCode);
            } else {
                throw new RuntimeException("Unexpected error code: " + nativeErrorCode.toString());
            }
            return errorCodeString;
        }
    }
}
