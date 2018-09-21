#import "ReaderSdkFlutterPlugin.h"
#import "FlutterReaderSDKAuthorization.h"
#import "FlutterReaderSDKCheckout.h"
#import "FlutterReaderSDKReaderSettings.h"

@interface ReaderSdkFlutterPlugin ()

@property (strong, readwrite) FlutterReaderSDKAuthorization* authorization;
@property (strong, readwrite) FlutterReaderSDKCheckout* checkout;
@property (strong, readwrite) FlutterReaderSDKReaderSettings* readerSettings;

@end

@implementation ReaderSdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"reader_sdk_flutter_plugin"
            binaryMessenger:[registrar messenger]];
  ReaderSdkFlutterPlugin* instance = [[ReaderSdkFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)init {
    self.authorization = [[FlutterReaderSDKAuthorization alloc] init];
    self.checkout = [[FlutterReaderSDKCheckout alloc] init];
    self.readerSettings = [[FlutterReaderSDKReaderSettings alloc] init];
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"isAuthorized" isEqualToString:call.method]) {
      [self.authorization isAuthorized:result];
  } else if ([@"authorizedLocation" isEqualToString:call.method]) {
      [self.authorization authorizedLocation:result];
  } else if ([@"authorize" isEqualToString:call.method]) {
      NSString* authCode = call.arguments[@"authCode"];
      [self.authorization authorize:result authCode:authCode];
  } else if ([@"canDeauthorize" isEqualToString:call.method]) {
      [self.authorization canDeauthorize:result];
  } else if ([@"deauthorize" isEqualToString:call.method]) {
      [self.authorization deauthorize:result];
  } else if ([@"startCheckout" isEqualToString:call.method]) {
      [self.checkout startCheckout:result checkoutParametersDictionary:call.arguments[@"checkoutParams"]];
  } else if ([@"startReaderSettings" isEqualToString:call.method]) {
      [self.readerSettings startReaderSettings:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
