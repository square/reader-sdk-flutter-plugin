package com.squareup.sdk.reader.flutter;

import android.app.Activity;
import com.squareup.sdk.reader.ReaderSdk;
import com.squareup.sdk.reader.checkout.AdditionalPaymentType;
import com.squareup.sdk.reader.checkout.CheckoutActivityCallback;
import com.squareup.sdk.reader.checkout.CheckoutErrorCode;
import com.squareup.sdk.reader.checkout.CheckoutParameters;
import com.squareup.sdk.reader.checkout.CheckoutResult;
import com.squareup.sdk.reader.checkout.CurrencyCode;
import com.squareup.sdk.reader.checkout.Money;
import com.squareup.sdk.reader.checkout.TipSettings;
import com.squareup.sdk.reader.core.CallbackReference;
import com.squareup.sdk.reader.core.ResultError;
import com.squareup.sdk.reader.flutter.internal.ErrorHandlerUtils;
import com.squareup.sdk.reader.flutter.internal.converter.CheckoutResultConverter;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;

final class CheckoutModule {
  // Define all the checkout debug codes and messages below
  // These error codes and messages **MUST** align with iOS error codes and javascript error codes
  // Search KEEP_IN_SYNC_CHECKOUT_ERROR to update all places

  // react native module debug error codes
  private static final String FL_CHECKOUT_ALREADY_IN_PROGRESS = "fl_checkout_already_in_progress";
  private static final String FL_CHECKOUT_INVALID_PARAMETER = "fl_checkout_invalid_parameter";

  // react native module debug messages
  private static final String FL_MESSAGE_CHECKOUT_ALREADY_IN_PROGRESS = "A checkout operation is already in progress. Ensure that the in-progress checkout is completed before calling startCheckoutAsync again.";
  private static final String FL_MESSAGE_CHECKOUT_INVALID_PARAMETER = "Invalid parameter found in checkout parameters.";

  private final Activity currentActivity;
  private volatile CallbackReference checkoutCallbackRef;


  public CheckoutModule(Activity activity) {
    currentActivity = activity;
  }

  public void startCheckout(HashMap<String, Object> checkoutParameters, final Result flutterResult) {
    StringBuilder paramError = new StringBuilder();
    if (!validateCheckoutParams(checkoutParameters, paramError)) {
      String paramErrorDebugMessage = String.format("%s %s", FL_MESSAGE_CHECKOUT_INVALID_PARAMETER, paramError.toString());
      String message = ErrorHandlerUtils.getNativeModuleErrorMessage(FL_CHECKOUT_INVALID_PARAMETER);
      flutterResult.error(ErrorHandlerUtils.USAGE_ERROR, message, ErrorHandlerUtils.getDebugErrorObject(FL_CHECKOUT_INVALID_PARAMETER, paramErrorDebugMessage));
      return;
    }

    if (checkoutCallbackRef != null) {
      flutterResult.error(
          ErrorHandlerUtils.USAGE_ERROR,
          ErrorHandlerUtils.getNativeModuleErrorMessage(FL_CHECKOUT_ALREADY_IN_PROGRESS),
          ErrorHandlerUtils.getDebugErrorObject(FL_CHECKOUT_ALREADY_IN_PROGRESS, FL_MESSAGE_CHECKOUT_ALREADY_IN_PROGRESS));
      return;
    }

    CheckoutActivityCallback checkoutCallback = new CheckoutActivityCallback() {
      @Override
      public void onResult(com.squareup.sdk.reader.core.Result<CheckoutResult, ResultError<CheckoutErrorCode>> result) {
        checkoutCallbackRef.clear();
        checkoutCallbackRef = null;
        if (result.isError()) {
          ResultError<CheckoutErrorCode> error = result.getError();
          flutterResult.error(
              ErrorHandlerUtils.getErrorCode(error.getCode()),
              error.getMessage(),
              ErrorHandlerUtils.getDebugErrorObject(error.getDebugCode(), error.getDebugMessage()));
          return;
        }
        CheckoutResult checkoutResult = result.getSuccessValue();
        CheckoutResultConverter checkoutResultConverter = new CheckoutResultConverter();
        flutterResult.success(checkoutResultConverter.toMapObject(checkoutResult));
      }
    };
    checkoutCallbackRef = ReaderSdk.checkoutManager().addCheckoutActivityCallback(checkoutCallback);

    HashMap<String, Object> amountMoneyMap = (HashMap<String, Object>)checkoutParameters.get("amountMoney");
    Money amountMoney = new Money(
        ((Integer)amountMoneyMap.get("amount")).longValue(),
        amountMoneyMap.containsKey("currencyCode") ? CurrencyCode.valueOf((String)amountMoneyMap.get("currencyCode")) : CurrencyCode.current());

    CheckoutParameters.Builder checkoutParamsBuilder = CheckoutParameters.newBuilder(amountMoney);
    if (checkoutParameters.containsKey("note")) {
      checkoutParamsBuilder.note((String)checkoutParameters.get("note"));
    }
    if (checkoutParameters.containsKey("skipReceipt")) {
      checkoutParamsBuilder.skipReceipt((Boolean)checkoutParameters.get("skipReceipt"));
    }
    if (checkoutParameters.containsKey("alwaysRequireSignature")) {
      checkoutParamsBuilder.alwaysRequireSignature((Boolean)checkoutParameters.get("alwaysRequireSignature"));
    }
    if (checkoutParameters.containsKey("allowSplitTender")) {
      checkoutParamsBuilder.allowSplitTender((Boolean)checkoutParameters.get("allowSplitTender"));
    }
    if (checkoutParameters.containsKey("tipSettings")) {
      TipSettings tipSettings = buildTipSettings((HashMap<String, Object>)checkoutParameters.get("tipSettings"));
      checkoutParamsBuilder.tipSettings(tipSettings);
    }
    if (checkoutParameters.containsKey("additionalPaymentTypes")) {
      Set<AdditionalPaymentType> additionalPaymentTypes = buildAdditionalPaymentTypes((ArrayList<Object>)checkoutParameters.get("additionalPaymentTypes"));
      checkoutParamsBuilder.additionalPaymentTypes(additionalPaymentTypes);
    }

    final CheckoutParameters checkoutParams = checkoutParamsBuilder.build();
    ReaderSdk.checkoutManager().startCheckoutActivity(currentActivity, checkoutParams);
  }

  static private boolean validateCheckoutParams(HashMap<String, Object> checkoutParamsMap, StringBuilder paramError) {
    // check types of all parameters
    if (!checkoutParamsMap.containsKey("amountMoney") || !(checkoutParamsMap.get("amountMoney") instanceof HashMap)) {
      paramError.append("'amountMoney' is missing or not an object");
      return false;
    } else if (checkoutParamsMap.containsKey("skipReceipt") && !(checkoutParamsMap.get("skipReceipt") instanceof Boolean)) {
      paramError.append("'skipReceipt' is not a boolean");
      return false;
    } else if (checkoutParamsMap.containsKey("alwaysRequireSignature") && !(checkoutParamsMap.get("alwaysRequireSignature") instanceof Boolean)) {
      paramError.append("'alwaysRequireSignature' is not a boolean");
      return false;
    } else if (checkoutParamsMap.containsKey("allowSplitTender") && !(checkoutParamsMap.get("allowSplitTender") instanceof Boolean)) {
      paramError.append("'allowSplitTender' is not a boolean");
      return false;
    } else if (checkoutParamsMap.containsKey("note") && !(checkoutParamsMap.get("note") instanceof String)) {
      paramError.append("'note' is not a string");
      return false;
    } else if (checkoutParamsMap.containsKey("tipSettings") && !(checkoutParamsMap.get("tipSettings") instanceof HashMap)) {
      paramError.append("'tipSettings' is not an object");
      return false;
    } else if (checkoutParamsMap.containsKey("additionalPaymentTypes") && !(checkoutParamsMap.get("additionalPaymentTypes") instanceof ArrayList)) {
      paramError.append("'additionalPaymentTypes' is not an array");
      return false;
    }

    // check amountMoney
    HashMap<String, Object> amountMoneyMap = (HashMap<String, Object>)checkoutParamsMap.get("amountMoney");
    if (!amountMoneyMap.containsKey("amount") || !(amountMoneyMap.get("amount") instanceof Integer)) {
      paramError.append("'amount' is not an integer");
      return false;
    }
    if (amountMoneyMap.containsKey("currencyCode") && !(amountMoneyMap.get("currencyCode") instanceof String)) {
      paramError.append("'currencyCode' is not an String");
      return false;
    }
    if (amountMoneyMap.containsKey("currencyCode")) {
      try {
        CurrencyCode.valueOf((String) amountMoneyMap.get("currencyCode"));
      } catch (IllegalArgumentException ex) {
        paramError.append("failed to parse 'currencyCode'");
        return false;
      }
    }

    // check tipSettings
    HashMap<String, Object> tipSettingsMap = (HashMap<String, Object>)checkoutParamsMap.get("tipSettings");
    if (tipSettingsMap.containsKey("showCustomTipField") && !(tipSettingsMap.get("showCustomTipField") instanceof Boolean)) {
      paramError.append("'showCustomTipField' is not a boolean");
      return false;
    } else if (tipSettingsMap.containsKey("showSeparateTipScreen") && !(tipSettingsMap.get("showSeparateTipScreen") instanceof Boolean)) {
      paramError.append("'showSeparateTipScreen' is not a boolean");
      return false;
    } else if (tipSettingsMap.containsKey("tipPercentages") && !(tipSettingsMap.get("tipPercentages") instanceof ArrayList)) {
      paramError.append("'tipPercentages' is not an array");
      return false;
    }

    return true;
  }

  static private TipSettings buildTipSettings(HashMap<String, Object> tipSettingsConfig) {
    TipSettings.Builder tipSettingsBuilder = TipSettings.newBuilder();

    if (tipSettingsConfig.containsKey("showCustomTipField")) {
      tipSettingsBuilder.showCustomTipField((Boolean) tipSettingsConfig.get("showCustomTipField"));
    }
    if (tipSettingsConfig.containsKey("showSeparateTipScreen")) {
      tipSettingsBuilder.showSeparateTipScreen((Boolean) tipSettingsConfig.get("showSeparateTipScreen"));
    }
    if (tipSettingsConfig.containsKey("tipPercentages")) {
      ArrayList<Object> tipPercentages = (ArrayList<Object>) tipSettingsConfig.get("tipPercentages");
      if (tipPercentages != null) {
        ArrayList<Integer> percentagesList = new ArrayList<>();
        for (int i = 0; i < tipPercentages.size(); i++) {
          percentagesList.add((int)tipPercentages.get(i));
        }
        tipSettingsBuilder.tipPercentages(percentagesList);
      }
    }

    return tipSettingsBuilder.build();
  }

  static private Set<AdditionalPaymentType> buildAdditionalPaymentTypes(ArrayList<Object> additionalPaymentTypes) {
    Set<AdditionalPaymentType> types = new LinkedHashSet<>();
    if (additionalPaymentTypes != null) {
      for (int i = 0; i < additionalPaymentTypes.size(); i++) {
        String typeName = (String)additionalPaymentTypes.get(i);
        switch (typeName) {
          case "cash":
            types.add(AdditionalPaymentType.CASH);
            break;
          case "manual_card_entry":
            types.add(AdditionalPaymentType.MANUAL_CARD_ENTRY);
            break;
          case "other":
            types.add(AdditionalPaymentType.OTHER);
            break;
          default:
            throw new RuntimeException("Unexpected payment type: " + typeName);
        }
      }
    }
    return types;
  }
}
