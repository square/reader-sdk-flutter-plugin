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

#import "SQRDCheckoutResult+FlutterReaderSDKAdditions.h"
#import "SQRDTender+FlutterReaderSDKAdditions.h"
#import "SQRDMoney+FlutterReaderSDKAdditions.h"
#import "FlutterReaderSDKDateFormatter.h"


@implementation SQRDCheckoutResult (FlutterReaderSDKAdditions)

- (NSDictionary *)jsonDictionary
{
    NSMutableArray *tenders = [[NSMutableArray alloc] init];
    for (SQRDTender *tender in self.tenders) {
        [tenders addObject:[tender jsonDictionary]];
    }

    return @{
        @"transactionId" : self.transactionID ?: [NSNull null],
        @"transactionClientId" : self.transactionClientID,
        @"locationId" : self.locationID,
        @"createdAt" : [FlutterReaderSDKDateFormatter iso8601StringFromDate:self.createdAt],
        @"totalMoney" : [self.totalMoney jsonDictionary],
        @"totalTipMoney" : [self.totalTipMoney jsonDictionary],
        @"tenders" : tenders,
    };
}

@end
