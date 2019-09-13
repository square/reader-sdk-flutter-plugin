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

#import "SquareReaderSdkFlutterPlugin.h"
#import "FlutterReaderSDKAuthorization.h"
#import "FlutterReaderSDKCheckout.h"
#import "FlutterReaderSDKReaderSettings.h"
#import "FlutterReaderSDKStoreCustomerCard.h"


@interface SquareReaderSdkFlutterPlugin ()

@property (strong, readwrite) FlutterReaderSDKAuthorization *authorization;
@property (strong, readwrite) FlutterReaderSDKCheckout *checkout;
@property (strong, readwrite) FlutterReaderSDKReaderSettings *readerSettings;
@property (strong, readwrite) FlutterReaderSDKStoreCustomerCard *storeCustomerCard;

@end


@implementation SquareReaderSdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar
{
    FlutterMethodChannel *channel = [FlutterMethodChannel
        methodChannelWithName:@"square_reader_sdk"
              binaryMessenger:[registrar messenger]];
    SquareReaderSdkFlutterPlugin *instance = [[SquareReaderSdkFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.authorization = [[FlutterReaderSDKAuthorization alloc] init];
    self.checkout = [[FlutterReaderSDKCheckout alloc] init];
    self.readerSettings = [[FlutterReaderSDKReaderSettings alloc] init];
    self.storeCustomerCard = [[FlutterReaderSDKStoreCustomerCard alloc] init];
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result
{
    if ([@"isAuthorized" isEqualToString:call.method]) {
        [self.authorization isAuthorized:result];
    } else if ([@"isAuthorizationInProgress" isEqualToString:call.method]) {
        [self.authorization isAuthorizationInProgress:result];
    } else if ([@"authorizedLocation" isEqualToString:call.method]) {
        [self.authorization authorizedLocation:result];
    } else if ([@"authorize" isEqualToString:call.method]) {
        NSString *authCode = call.arguments[@"authCode"];
        [self.authorization authorize:result authCode:authCode];
    } else if ([@"canDeauthorize" isEqualToString:call.method]) {
        [self.authorization canDeauthorize:result];
    } else if ([@"deauthorize" isEqualToString:call.method]) {
        [self.authorization deauthorize:result];
    } else if ([@"startCheckout" isEqualToString:call.method]) {
        [self.checkout startCheckout:result checkoutParametersDictionary:call.arguments[@"checkoutParams"]];
    } else if ([@"startReaderSettings" isEqualToString:call.method]) {
        [self.readerSettings startReaderSettings:result];
    } else if ([@"startStoreCard" isEqualToString:call.method]) {
        NSString *customerID = call.arguments[@"customerId"];
        [self.storeCustomerCard startStoreCard:result customerID:customerID];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
