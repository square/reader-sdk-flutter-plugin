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

#import "FlutterReaderSDKReaderSettings.h"
#import "FlutterReaderSDKErrorUtilities.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>

@interface FlutterReaderSDKReaderSettings ()

@property (strong, readwrite) FlutterResult readerSettingResolver;

@end

// Define all the error codes and messages below
// These error codes and messages **MUST** align with iOS error codes and javascript error codes
// Search KEEP_IN_SYNC_READER_SETTINGS_ERROR to update all places

// Expected errors:
static NSString *const FlutterReaderSDKReaderSettingsSdkNotAuthorized = @"READER_SETTINGS_SDK_NOT_AUTHORIZED";

// React native module debug error codes
static NSString *const FlutterReaderSDKReaderSettingsAlreadyInProgress = @"rn_reader_settings_already_in_progress";

// react native module debug messages
static NSString *const FlutterReaderSDKMessageReaderSettingsAlreadyInProgress = @"A reader settings operation is already in progress. Ensure that the in-progress reader settings is completed before calling startReaderSettingsAsync again.";

@implementation FlutterReaderSDKReaderSettings

- (void) startReaderSettings:(FlutterResult)result {
    if (self.readerSettingResolver != nil) {
        result([FlutterError errorWithCode:FlutterReaderSDKUsageError
                                   message:[FlutterReaderSDKErrorUtilities getNativeModuleErrorMessage:FlutterReaderSDKReaderSettingsAlreadyInProgress]
                                   details:[FlutterReaderSDKErrorUtilities getDebugErrorObject:FlutterReaderSDKReaderSettingsAlreadyInProgress debugMessage:FlutterReaderSDKMessageReaderSettingsAlreadyInProgress]]);
        return;
    }
    SQRDReaderSettingsController *readerSettingsController = [[SQRDReaderSettingsController alloc] initWithDelegate:self];
    self.readerSettingResolver = result;
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    [readerSettingsController presentFromViewController:rootViewController];
}

- (void)readerSettingsControllerDidPresent:(SQRDReaderSettingsController *)readerSettingsController
{
    self.readerSettingResolver([NSNull null]);
    [self clearReaderSettingHooks];
}

- (void)readerSettingsController:(SQRDReaderSettingsController *)readerSettingsController didFailToPresentWithError:(NSError *)error
{
    NSString *debugCode = error.userInfo[SQRDErrorDebugCodeKey];
    NSString *debugMessage = error.userInfo[SQRDErrorDebugMessageKey];
    self.readerSettingResolver([FlutterError errorWithCode:[self getReaderSettingsErrorCode:error.code]
                                                   message:error.localizedDescription
                                                   details:[FlutterReaderSDKErrorUtilities getDebugErrorObject:debugCode debugMessage:debugMessage]]);
    [self clearReaderSettingHooks];
}

- (void)clearReaderSettingHooks
{
    self.readerSettingResolver = nil;
}

- (NSString *)getReaderSettingsErrorCode:(NSInteger)nativeErrorCode
{
    NSString *errorCode = @"UNKNOWN";
    if (nativeErrorCode == SQRDReaderSettingsControllerErrorUsageError) {
        errorCode = FlutterReaderSDKUsageError;
    } else {
        switch (nativeErrorCode) {
            case SQRDReaderSettingsControllerErrorSDKNotAuthorized:
                errorCode = FlutterReaderSDKReaderSettingsSdkNotAuthorized;
                break;
        }
    }
    return errorCode;
}

@end
