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

import com.squareup.sdk.reader.checkout.Card;
import java.util.HashMap;
import java.util.Map;

public class CardConverter {
    private static final Map<Card.Brand, String> brandStringMap;

    static {
        brandStringMap = new HashMap<>();
        for (Card.Brand brand : Card.Brand.values()) {
            switch(brand) {
                case OTHER_BRAND:
                    brandStringMap.put(brand, "OTHER_BRAND");
                    break;
                case VISA:
                    brandStringMap.put(brand, "VISA");
                    break;
                case MASTERCARD:
                    brandStringMap.put(brand, "MASTERCARD");
                    break;
                case AMERICAN_EXPRESS:
                    brandStringMap.put(brand, "AMERICAN_EXPRESS");
                    break;
                case DISCOVER:
                    brandStringMap.put(brand, "DISCOVER");
                    break;
                case DISCOVER_DINERS:
                    brandStringMap.put(brand, "DISCOVER_DINERS");
                    break;
                case INTERAC:
                    brandStringMap.put(brand, "INTERAC");
                    break;
                case JCB:
                    brandStringMap.put(brand, "JCB");
                    break;
                case CHINA_UNIONPAY:
                    brandStringMap.put(brand, "CHINA_UNIONPAY");
                    break;
                case SQUARE_GIFT_CARD:
                    brandStringMap.put(brand, "SQUARE_GIFT_CARD");
                    break;
                case EFTPOS:
                    brandStringMap.put(brand, "EFTPOS");
                    break;
                //case FELICA:
                //    brandStringMap.put(brand, "FELICA");
                default:
                    // UNKNOWN should never happen if the right Reader SDK version is loaded with plugin
                    // But we choose not break plugin if the type isn't important
                    brandStringMap.put(brand, "UNKNOWN");
            }
        }
    }

    public HashMap<String, Object> toMapObject(Card card) {
        HashMap<String, Object> mapToReturn = new HashMap<>();
        mapToReturn.put("brand", brandStringMap.get(card.getBrand()));
        mapToReturn.put("lastFourDigits", card.getLastFourDigits());
        mapToReturn.put("expirationMonth", card.getExpirationMonth());
        mapToReturn.put("expirationYear", card.getExpirationYear());
        mapToReturn.put("id", card.getId());
        mapToReturn.put("cardholderName", card.getCardholderName());
        return mapToReturn;
    }
}
