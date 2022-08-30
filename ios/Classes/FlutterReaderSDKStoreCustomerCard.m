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

#import "FlutterReaderSDKStoreCustomerCard.h"
#import "FlutterReaderSDKErrorUtilities.h"
#import "Converters/SQRDCard+FlutterReaderSDKAdditions.h"


@interface FlutterReaderSDKStoreCustomerCard ()

@property (strong, readwrite) FlutterResult storeCardResolver;

@end

// Define all the error codes and messages below
// These error codes and messages **MUST** align with iOS error codes and javascript error codes
// Search KEEP_IN_SYNC_STORE_CUSTOMER_CARD_ERROR to update all places

// Expected errors:
static NSString *const FlutterReaderSDKStoreCustomerCardCancelled = @"STORE_CUSTOMER_CARD_CANCELED";
static NSString *const FlutterReaderSDKStoreCustomerCardInvalidCustomerID = @"STORE_CUSTOMER_CARD_INVALID_CUSTOMER_ID";
static NSString *const FlutterReaderSDKStoreCustomerCardSdkNotAuthorized = @"STORE_CUSTOMER_CARD_SDK_NOT_AUTHORIZED";
static NSString *const FlutterReaderSDKStoreCustomerCardNoNetwork = @"STORE_CUSTOMER_CARD_NO_NETWORK";

// flutter plugin debug error codes
static NSString *const FlutterReaderSDKStoreCustomerCardAlreadyInProgress = @"fl_add_customer_already_in_progress";

// flutter plugin debug messages
static NSString *const FlutterReaderSDKMessageStoreCustomerCardAlreadyInProgress = @"A store customer card operation is already in progress. Ensure that the in-progress store customer card is completed before calling startStoreCardAsync again.";


@implementation FlutterReaderSDKStoreCustomerCard

- (void)startStoreCard:(FlutterResult)result customerID:(NSString *)customerID
{
    if (self.storeCardResolver != nil) {
        self.storeCardResolver([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                                   message:[FlutterReaderSDKErrorUtilities
                                                               nativeModuleErrorMessage:FlutterReaderSDKStoreCustomerCardAlreadyInProgress]
                                                   details:[FlutterReaderSDKErrorUtilities
                                                               debugErrorObject:FlutterReaderSDKStoreCustomerCardAlreadyInProgress
                                                                   debugMessage:FlutterReaderSDKMessageStoreCustomerCardAlreadyInProgress]]);
        return;
    }

    SQRDStoreCustomerCardController *storeCustomerCardContorller = [[SQRDStoreCustomerCardController alloc] initWithCustomerID:customerID delegate:self];

    self.storeCardResolver = result;
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    [storeCustomerCardContorller presentFromViewController:rootViewController];
}

#pragma mark - SQRDCheckoutControllerDelegate
- (void)storeCustomerCardController:(SQRDStoreCustomerCardController *)storeCustomerCardController didFinishWithCard:(nonnull SQRDCard *)card
{
    self.storeCardResolver([card jsonDictionary]);
    [self _clearStoreCardHooks];
}

- (void)storeCustomerCardController:(SQRDStoreCustomerCardController *)storeCustomerCardController didFailWithError:(NSError *)error
{
    NSString *debugCode = error.userInfo[SQRDErrorDebugCodeKey];
    NSString *debugMessage = error.userInfo[SQRDErrorDebugMessageKey];
    self.storeCardResolver([FlutterError errorWithCode:[self _storeCustomerCardErrorCodeFromNativeErrorCode:error.code]
                                               message:error.localizedDescription
                                               details:[FlutterReaderSDKErrorUtilities debugErrorObject:debugCode debugMessage:debugMessage]]);
    [self _clearStoreCardHooks];
}

- (void)storeCustomerCardControllerDidCancel:(SQRDStoreCustomerCardController *)storeCustomerCardController
{
    // Return store card cancel as an error in order to align with Android implementation
    self.storeCardResolver([FlutterError errorWithCode:FlutterReaderSDKStoreCustomerCardCancelled
                                               message:[FlutterReaderSDKErrorUtilities nativeModuleErrorMessage:FlutterReaderSDKStoreCustomerCardCancelled]
                                               details:[FlutterReaderSDKErrorUtilities debugErrorObject:FlutterReaderSDKStoreCustomerCardCancelled debugMessage:@"The user canceled the store customer flow."]]);
    [self _clearStoreCardHooks];
}

#pragma mark - Private Methods
- (void)_clearStoreCardHooks
{
    self.storeCardResolver = nil;
}

- (NSString *)_storeCustomerCardErrorCodeFromNativeErrorCode:(NSInteger)nativeErrorCode
{
    NSString *errorCode = @"UNKNOWN";
    if (nativeErrorCode == SQRDStoreCustomerCardControllerErrorUsageError) {
        errorCode = FlutterReaderSDKUsageError;
    } else {
        switch (nativeErrorCode) {
            case SQRDStoreCustomerCardControllerErrorInvalidCustomerID:
                errorCode = FlutterReaderSDKStoreCustomerCardInvalidCustomerID;
                break;
            case SQRDStoreCustomerCardControllerErrorSDKNotAuthorized:
                errorCode = FlutterReaderSDKStoreCustomerCardSdkNotAuthorized;
                break;
            case SQRDStoreCustomerCardControllerErrorNoNetworkConnection:
                errorCode = FlutterReaderSDKStoreCustomerCardNoNetwork;
                break;
        }
    }
    return errorCode;
}

@end
