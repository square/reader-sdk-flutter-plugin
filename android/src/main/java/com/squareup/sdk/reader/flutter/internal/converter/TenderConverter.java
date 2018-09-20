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
import com.squareup.sdk.reader.checkout.Tender;
import java.util.HashMap;
import java.util.Map;

class TenderConverter {
    private static final Map<Tender.Type, String> tenderTypeMap;

    static {
        tenderTypeMap = new HashMap<>();
        for (Tender.Type type : Tender.Type.values()) {
            switch (type) {
                case CARD:
                    tenderTypeMap.put(type, "card");
                    break;
                case CASH:
                    tenderTypeMap.put(type, "cash");
                    break;
                case OTHER:
                    tenderTypeMap.put(type, "other");
                    break;
                default:
                    throw new RuntimeException("Unexpected tender type: " + type.name());
            }
        }

    }

    private final MoneyConverter moneyConverter;
    private final TenderCardDetailsConverter tenderCardDetailsConverter;
    private final TenderCashDetailsConverter tenderCashDetailsConverter;

    public TenderConverter(){
        moneyConverter = new MoneyConverter();
        tenderCardDetailsConverter = new TenderCardDetailsConverter();
        tenderCashDetailsConverter = new TenderCashDetailsConverter();
    }

    public HashMap<String, Object> toMapObject(Tender tender) {
        HashMap<String, Object>  mapToReturn = new HashMap<> ();
        mapToReturn.put("createdAt", DateFormatUtils.formatISO8601UTC(tender.getCreatedAt()));
        mapToReturn.put("tipMoney", moneyConverter.toMapObject(tender.getTipMoney()));
        mapToReturn.put("totalMoney", moneyConverter.toMapObject(tender.getTotalMoney()));
        Tender.Type tenderType = tender.getType();
        mapToReturn.put("type", tenderTypeMap.get(tenderType));

        if (tenderType == Tender.Type.CARD) {
            mapToReturn.put("tenderId", tender.getTenderId());
            mapToReturn.put("cardDetails", tenderCardDetailsConverter.toMapObject(tender.getCardDetails()));
        } else if (tenderType == Tender.Type.CASH) {
            mapToReturn.put("cashDetails", tenderCashDetailsConverter.toJSObject(tender.getCashDetails()));
        }

        return mapToReturn;
    }
}
