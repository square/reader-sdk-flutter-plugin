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

#import "FlutterReaderSDKCheckout.h"
#import "FlutterReaderSDKErrorUtilities.h"
#import "Converters/SQRDCheckoutResult+FlutterReaderSDKAdditions.h"


@interface FlutterReaderSDKCheckout ()

@property (strong, readwrite) FlutterResult checkoutResolver;

@end

// Define all the error codes and messages below
// These error codes and messages **MUST** align with android error codes and dart error codes
// Search KEEP_IN_SYNC_CHECKOUT_ERROR to update all places

// Expected errors:
static NSString *const FlutterReaderSDKCheckoutCancelled = @"CHECKOUT_CANCELED";
static NSString *const FlutterReaderSDKCheckoutSdkNotAuthorized = @"CHECKOUT_SDK_NOT_AUTHORIZED";

// flutter plugin debug error codes
static NSString *const FlutterReaderSDKCheckoutAlreadyInProgress = @"fl_checkout_already_in_progress";
static NSString *const FlutterReaderSDKCheckoutInvalidParameter = @"fl_checkout_invalid_parameter";

// flutter plugin debug messages
static NSString *const FlutterReaderSDKMessageCheckoutAlreadyInProgress = @"A checkout operation is already in progress. Ensure that the in-progress checkout is completed before calling startCheckoutAsync again.";
static NSString *const FlutterReaderSDKMessageCheckoutInvalidParameter = @"Invalid parameter found in checkout parameters.";


@implementation FlutterReaderSDKCheckout

- (void)startCheckout:(FlutterResult)result checkoutParametersDictionary:(NSDictionary *)checkoutParametersDictionary
{
    if (self.checkoutResolver != nil) {
        self.checkoutResolver([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                                  message:[FlutterReaderSDKErrorUtilities nativeModuleErrorMessage:FlutterReaderSDKCheckoutAlreadyInProgress]
                                                  details:[FlutterReaderSDKErrorUtilities debugErrorObject:FlutterReaderSDKCheckoutAlreadyInProgress debugMessage:FlutterReaderSDKMessageCheckoutAlreadyInProgress]]);
        return;
    }
    NSString *paramError = nil;
    if ([self _validateCheckoutParameters:checkoutParametersDictionary errorMsg:&paramError] == NO) {
        NSString *paramErrorDebugMessage = [NSString stringWithFormat:@"%@ %@", FlutterReaderSDKMessageCheckoutInvalidParameter, paramError];
        result([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                                  message:[FlutterReaderSDKErrorUtilities nativeModuleErrorMessage:FlutterReaderSDKCheckoutInvalidParameter]
                                                  details:[FlutterReaderSDKErrorUtilities debugErrorObject:FlutterReaderSDKCheckoutInvalidParameter debugMessage:paramErrorDebugMessage]]);
        return;
    }
    NSDictionary *amountMoneyDictionary = checkoutParametersDictionary[@"amountMoney"];
    SQRDMoney *amountMoney = nil;
    if (amountMoneyDictionary[@"currencyCode"]) {
        amountMoney = [[SQRDMoney alloc] initWithAmount:[amountMoneyDictionary[@"amount"] longValue] currencyCode:SQRDCurrencyCodeMake(amountMoneyDictionary[@"currencyCode"])];
    } else {
        amountMoney = [[SQRDMoney alloc] initWithAmount:[amountMoneyDictionary[@"amount"] longValue]];
    }

    SQRDCheckoutParameters *checkoutParams = [[SQRDCheckoutParameters alloc] initWithAmountMoney:amountMoney];
    if (checkoutParametersDictionary[@"note"]) {
        checkoutParams.note = checkoutParametersDictionary[@"note"];
    }
    if (checkoutParametersDictionary[@"skipReceipt"]) {
        checkoutParams.skipReceipt = [checkoutParametersDictionary[@"skipReceipt"] boolValue];
    }
    if (checkoutParametersDictionary[@"collectSignature"]) {
        checkoutParams.collectSignature = [checkoutParametersDictionary[@"collectSignature"] boolValue];
    }
    if (checkoutParametersDictionary[@"allowSplitTender"]) {
        checkoutParams.allowSplitTender = [checkoutParametersDictionary[@"allowSplitTender"] boolValue];
    }
    if (checkoutParametersDictionary[@"tipSettings"]) {
        SQRDTipSettings *tipSettings = [self _buildTipSettings:checkoutParametersDictionary[@"tipSettings"]];
        checkoutParams.tipSettings = tipSettings;
    }
    if (checkoutParametersDictionary[@"additionalPaymentTypes"]) {
        checkoutParams.additionalPaymentTypes = [self _buildAdditionalPaymentTypes:checkoutParametersDictionary[@"additionalPaymentTypes"]];
    }
    SQRDCheckoutController *checkoutController = [[SQRDCheckoutController alloc] initWithParameters:checkoutParams delegate:self];

    self.checkoutResolver = result;
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    [checkoutController presentFromViewController:rootViewController];
}

#pragma mark - SQRDCheckoutControllerDelegate
- (void)checkoutController:(SQRDCheckoutController *)checkoutController didFinishCheckoutWithResult:(SQRDCheckoutResult *)result
{
    self.checkoutResolver([result jsonDictionary]);
    [self _clearCheckoutHooks];
}

- (void)checkoutController:(SQRDCheckoutController *)checkoutController didFailWithError:(NSError *)error
{
    NSString *debugCode = error.userInfo[SQRDErrorDebugCodeKey];
    NSString *debugMessage = error.userInfo[SQRDErrorDebugMessageKey];
    self.checkoutResolver([FlutterError errorWithCode:[self _checkoutErrorCodeFromNativeErrorCode:error.code]
                                              message:error.localizedDescription
                                              details:[FlutterReaderSDKErrorUtilities debugErrorObject:debugCode debugMessage:debugMessage]]);
    [self _clearCheckoutHooks];
}

- (void)checkoutControllerDidCancel:(SQRDCheckoutController *)checkoutController
{
    // Return transaction cancel as an error in order to align with Android implementation
    self.checkoutResolver([FlutterError errorWithCode:FlutterReaderSDKCheckoutCancelled
                                              message:[FlutterReaderSDKErrorUtilities nativeModuleErrorMessage:FlutterReaderSDKCheckoutCancelled]
                                              details:[FlutterReaderSDKErrorUtilities debugErrorObject:FlutterReaderSDKCheckoutCancelled debugMessage:@"The user canceled the transaction."]]);
    [self _clearCheckoutHooks];
}

#pragma mark - Private Methods
- (void)_clearCheckoutHooks
{
    self.checkoutResolver = nil;
}

- (BOOL)_validateCheckoutParameters:(NSDictionary *)checkoutParametersDictionary errorMsg:(NSString **)errorMsg
{
    // check types of all parameters
    if (!checkoutParametersDictionary[@"amountMoney"] || ![checkoutParametersDictionary[@"amountMoney"] isKindOfClass:[NSDictionary class]]) {
        *errorMsg = @"'amountMoney' is missing or not an object";
        return NO;
    }
    if (checkoutParametersDictionary[@"skipReceipt"] && ![checkoutParametersDictionary[@"skipReceipt"] isKindOfClass:[NSNumber class]]) {
        *errorMsg = @"'skipReceipt' is not a boolean";
        return NO;
    }
    if (checkoutParametersDictionary[@"collectSignature"] && ![checkoutParametersDictionary[@"collectSignature"] isKindOfClass:[NSNumber class]]) {
        *errorMsg = @"'collectSignature' is not a boolean";
        return NO;
    }
    if (checkoutParametersDictionary[@"allowSplitTender"] && ![checkoutParametersDictionary[@"allowSplitTender"] isKindOfClass:[NSNumber class]]) {
        *errorMsg = @"'allowSplitTender' is not a boolean";
        return NO;
    }
    if (checkoutParametersDictionary[@"note"] && ![checkoutParametersDictionary[@"note"] isKindOfClass:[NSString class]]) {
        *errorMsg = @"'note' is not a string";
        return NO;
    }
    if (checkoutParametersDictionary[@"tipSettings"] && ![checkoutParametersDictionary[@"tipSettings"] isKindOfClass:[NSDictionary class]]) {
        *errorMsg = @"'tipSettings' is not an object";
        return NO;
    }
    if (checkoutParametersDictionary[@"additionalPaymentTypes"] && ![checkoutParametersDictionary[@"additionalPaymentTypes"] isKindOfClass:[NSArray class]]) {
        *errorMsg = @"'additionalPaymentTypes' is not an array";
        return NO;
    }

    // check amountMoney
    NSDictionary *amountMoney = checkoutParametersDictionary[@"amountMoney"];
    if (!amountMoney[@"amount"] || ![amountMoney[@"amount"] isKindOfClass:[NSNumber class]]) {
        *errorMsg = @"'amount' is not an integer";
        return NO;
    }
    if (amountMoney[@"currencyCode"] && ![amountMoney[@"currencyCode"] isKindOfClass:[NSString class]]) {
        *errorMsg = @"'currencyCode' is not a string";
        return NO;
    }

    // check tipSettings
    NSDictionary *tipSettings = checkoutParametersDictionary[@"tipSettings"];
    if (tipSettings != nil) {
        if ((tipSettings[@"showCustomTipField"] && ![tipSettings[@"showCustomTipField"] isKindOfClass:[NSNumber class]])) {
            *errorMsg = @"'showCustomTipField' is not a boolean";
            return NO;
        }
        if (tipSettings[@"showSeparateTipScreen"] && ![tipSettings[@"showSeparateTipScreen"] isKindOfClass:[NSNumber class]]) {
            *errorMsg = @"'showSeparateTipScreen' is not a boolean";
            return NO;
        }
        if (tipSettings[@"tipPercentages"] && ![tipSettings[@"tipPercentages"] isKindOfClass:[NSArray class]]) {
            *errorMsg = @"'tipPercentages' is not an array";
            return NO;
        }
    }

    return YES;
}

- (SQRDTipSettings *)_buildTipSettings:(NSDictionary *)tipSettingConfig
{
    SQRDTipSettings *tipSettings = [[SQRDTipSettings alloc] init];
    if (tipSettingConfig[@"showCustomTipField"]) {
        tipSettings.showCustomTipField = [tipSettingConfig[@"showCustomTipField"] boolValue];
    }
    if (tipSettingConfig[@"showSeparateTipScreen"]) {
        tipSettings.showSeparateTipScreen = [tipSettingConfig[@"showSeparateTipScreen"] boolValue];
    }
    if (tipSettingConfig[@"tipPercentages"]) {
        NSMutableArray *tipPercentages = [[NSMutableArray alloc] init];
        for (NSNumber *percentage in tipSettingConfig[@"tipPercentages"]) {
            [tipPercentages addObject:percentage];
        }
        tipSettings.tipPercentages = tipPercentages;
    }

    return tipSettings;
}

- (SQRDAdditionalPaymentTypes)_buildAdditionalPaymentTypes:(NSArray *)additionalPaymentTypes
{
    SQRDAdditionalPaymentTypes sqrdAdditionalPaymentTypes = 0;
    for (NSString *typeName in additionalPaymentTypes) {
        if ([typeName isEqualToString:@"cash"]) {
            sqrdAdditionalPaymentTypes |= SQRDAdditionalPaymentTypeCash;
        } else if ([typeName isEqualToString:@"manual_card_entry"]) {
            sqrdAdditionalPaymentTypes |= SQRDAdditionalPaymentTypeManualCardEntry;
        } else if ([typeName isEqualToString:@"other"]) {
            sqrdAdditionalPaymentTypes |= SQRDAdditionalPaymentTypeOther;
        }
    }

    return sqrdAdditionalPaymentTypes;
}

- (NSString *)_checkoutErrorCodeFromNativeErrorCode:(NSInteger)nativeErrorCode
{
    NSString *errorCode = @"UNKNOWN";
    if (nativeErrorCode == SQRDCheckoutControllerErrorUsageError) {
        errorCode = FlutterReaderSDKUsageError;
    } else {
        switch (nativeErrorCode) {
            case SQRDCheckoutControllerErrorSDKNotAuthorized:
                errorCode = FlutterReaderSDKCheckoutSdkNotAuthorized;
                break;
        }
    }
    return errorCode;
}

@end
