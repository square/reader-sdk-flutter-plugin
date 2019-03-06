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

#import "SQRDTender+FlutterReaderSDKAdditions.h"
#import "SQRDMoney+FlutterReaderSDKAdditions.h"
#import "SQRDTenderCardDetails+FlutterReaderSDKAdditions.h"
#import "SQRDTenderCashDetails+FlutterReaderSDKAdditions.h"
#import "FlutterReaderSDKDateFormatter.h"


@implementation SQRDTender (FlutterReaderSDKAdditions)

- (NSDictionary *)jsonDictionary;
{
    NSMutableDictionary *tenderResult = [[NSMutableDictionary alloc] init];
    tenderResult[@"createdAt"] = [FlutterReaderSDKDateFormatter iso8601StringFromDate:self.createdAt];
    tenderResult[@"tipMoney"] = [self.tipMoney jsonDictionary];
    tenderResult[@"totalMoney"] = [self.totalMoney jsonDictionary];

    NSString *tenderType = nil;
    switch (self.type) {
        case SQRDTenderTypeCard:
            tenderType = @"card";
            tenderResult[@"tenderId"] = self.tenderID;
            tenderResult[@"cardDetails"] = [self.cardDetails jsonDictionary];
            break;
        case SQRDTenderTypeCash:
            tenderType = @"cash";
            tenderResult[@"cashDetails"] = [self.cashDetails jsonDictionary];
            break;
        case SQRDTenderTypeOther:
            tenderType = @"other";
            break;
    }
    tenderResult[@"type"] = tenderType;
    return tenderResult;
}

@end
