#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
@import SquareReaderSDK;


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [SQRDReaderSDK initializeWithApplicationLaunchOptions:launchOptions];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
