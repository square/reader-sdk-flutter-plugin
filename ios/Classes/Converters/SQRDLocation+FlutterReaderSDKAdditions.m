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

#import "SQRDLocation+FlutterReaderSDKAdditions.h"
#import "SQRDMoney+FlutterReaderSDKAdditions.h"


@implementation SQRDLocation (FlutterReaderSDKAdditions)

- (NSMutableDictionary *)jsonDictionary
{
    NSMutableDictionary *locationResult = [[NSMutableDictionary alloc] init];
    locationResult[@"locationId"] = self.locationID;
    locationResult[@"name"] = self.name;
    locationResult[@"businessName"] = self.businessName;
    locationResult[@"isCardProcessingActivated"] = [NSNumber numberWithBool:self.isCardProcessingActivated == YES];
    locationResult[@"minimumCardPaymentAmountMoney"] = [self.minimumCardPaymentAmountMoney jsonDictionary];
    locationResult[@"maximumCardPaymentAmountMoney"] = [self.maximumCardPaymentAmountMoney jsonDictionary];
    locationResult[@"currencyCode"] = SQRDCurrencyCodeGetISOCurrencyCode(self.currencyCode);
    return locationResult;
}

@end
