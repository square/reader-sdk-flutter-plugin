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

#import "FlutterReaderSDKAuthorization.h"
#import "FlutterReaderSDKErrorUtilities.h"
#import "Converters/SQRDLocation+FlutterReaderSDKAdditions.h"

// Define all the error codes and messages below
// These error codes and messages **MUST** align with android error codes and dart error codes
// Search KEEP_IN_SYNC_AUTHORIZE_ERROR to update all places

// Expected errors:
static NSString *const FlutterReaderSDKAuthorizeNoNetwork = @"AUTHORIZE_NO_NETWORK";

// flutter plugin debug error codes
static NSString *const FlutterReaderSDKAuthLocationNotAuthorized = @"fl_auth_location_not_authorized";

// flutter plugin debug messages
static NSString *const FlutterReaderSDKMessageAuthLocationNotAuthorized = @"This device must be authorized with a Square location in order to get that location. Obtain an authorization code for a Square location from the mobile/authorization-code endpoint and then call authorizeAsync.";


@implementation FlutterReaderSDKAuthorization

- (void)isAuthorized:(FlutterResult)result
{
    result(@(SQRDReaderSDK.sharedSDK.isAuthorized));
}

- (void)isAuthorizationInProgress:(FlutterResult)result
{
    result(@(SQRDReaderSDK.sharedSDK.isAuthorizationInProgress));
}

- (void)authorizedLocation:(FlutterResult)result
{
    if (SQRDReaderSDK.sharedSDK.isAuthorized) {
        result([SQRDReaderSDK.sharedSDK.authorizedLocation jsonDictionary]);
    } else {
        result([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                   message:[FlutterReaderSDKErrorUtilities nativeModuleErrorMessage:FlutterReaderSDKAuthLocationNotAuthorized]
                                   details:[FlutterReaderSDKErrorUtilities debugErrorObject:FlutterReaderSDKAuthLocationNotAuthorized debugMessage:FlutterReaderSDKMessageAuthLocationNotAuthorized]]);
    }
}

- (void)authorize:(FlutterResult)result authCode:(NSString *)authCode
{
    [SQRDReaderSDK.sharedSDK authorizeWithCode:authCode
                             completionHandler:^(SQRDLocation *_Nullable location, NSError *_Nullable error) {
                                 if (error != nil) {
                                     NSString *debugCode = error.userInfo[SQRDErrorDebugCodeKey];
                                     NSString *debugMessage = error.userInfo[SQRDErrorDebugMessageKey];
                                     result([FlutterError errorWithCode:[self _authorizationErrorCodeFromNativeErrorCode:error.code]
                                                                message:error.localizedDescription
                                                                details:[FlutterReaderSDKErrorUtilities debugErrorObject:debugCode debugMessage:debugMessage]]);
                                     return;
                                 }
                                 result([location jsonDictionary]);
                             }];
}

- (void)canDeauthorize:(FlutterResult)result
{
    result(@(SQRDReaderSDK.sharedSDK.canDeauthorize));
}

- (void)deauthorize:(FlutterResult)result
{
    [SQRDReaderSDK.sharedSDK deauthorizeWithCompletionHandler:^(NSError *_Nullable error) {
        if (error != nil) {
            NSString *debugCode = error.userInfo[SQRDErrorDebugCodeKey];
            NSString *debugMessage = error.userInfo[SQRDErrorDebugMessageKey];
            result([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                       message:error.localizedDescription
                                       details:[FlutterReaderSDKErrorUtilities debugErrorObject:debugCode debugMessage:debugMessage]]);
            return;
        }
        result(nil);
    }];
}

#pragma mark - Private Methods
- (NSString *)_authorizationErrorCodeFromNativeErrorCode:(NSInteger)nativeErrorCode
{
    NSString *errorCode = @"UNKNOWN";
    if (nativeErrorCode == SQRDAuthorizationErrorUsageError) {
        errorCode = FlutterReaderSDKUsageError;
    } else {
        switch (nativeErrorCode) {
            case SQRDAuthorizationErrorNoNetworkConnection:
                errorCode = FlutterReaderSDKAuthorizeNoNetwork;
                break;
        }
    }
    return errorCode;
}

@end
