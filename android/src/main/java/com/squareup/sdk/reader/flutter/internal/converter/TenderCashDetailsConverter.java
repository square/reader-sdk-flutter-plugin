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
package com.squareup.sdk.reader.flutter.internal.converter;

import com.squareup.sdk.reader.checkout.TenderCashDetails;
import java.util.HashMap;

class TenderCashDetailsConverter {
    private final MoneyConverter moneyConverter;

    public TenderCashDetailsConverter(){
        moneyConverter = new MoneyConverter();
    }

    public HashMap<String, Object> toJSObject(TenderCashDetails tenderCashDetails) {
        HashMap<String, Object> mapToReturn = new HashMap<>();
        mapToReturn.put("buyerTenderedMoney", moneyConverter.toMapObject(tenderCashDetails.getBuyerTenderedMoney()));
        mapToReturn.put("changeBackMoney", moneyConverter.toMapObject(tenderCashDetails.getChangeBackMoney()));
        return mapToReturn;
    }
}
