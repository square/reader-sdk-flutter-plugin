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
package com.squareup.sdk.reader.flutter.internal.converter;

import com.squareup.sdk.reader.flutter.internal.DateFormatUtils;
import com.squareup.sdk.reader.checkout.CheckoutResult;
import com.squareup.sdk.reader.checkout.Money;
import com.squareup.sdk.reader.checkout.Tender;
import java.util.ArrayList;
import java.util.HashMap;

public class CheckoutResultConverter {
    private final MoneyConverter moneyConverter;
    private final TenderConverter tenderConverter;

    public CheckoutResultConverter() {
        moneyConverter = new MoneyConverter();
        tenderConverter = new TenderConverter();
    }

    public HashMap<String, Object> toMapObject(CheckoutResult result) {
        HashMap<String, Object> mapToReturn = new HashMap<>();
        if (result.getTransactionId() != null) {
            mapToReturn.put("transactionId", result.getTransactionId());
        }
        mapToReturn.put("transactionClientId", result.getTransactionClientId());
        mapToReturn.put("locationId", result.getLocationId());
        mapToReturn.put("createdAt", DateFormatUtils.formatISO8601UTC(result.getCreatedAt()));
        Money totalMoney = result.getTotalMoney();
        mapToReturn.put("totalMoney", moneyConverter.toMapObject(totalMoney));
        Money totalTipMoney = result.getTotalTipMoney();
        mapToReturn.put("totalTipMoney", moneyConverter.toMapObject(totalTipMoney));

        ArrayList<HashMap<String, Object>> jsTenders = new ArrayList<>();
        for (Tender tender : result.getTenders()) {
            jsTenders.add(tenderConverter.toMapObject(tender));
        }
        mapToReturn.put("tenders", jsTenders);

        return mapToReturn;
    }
}
