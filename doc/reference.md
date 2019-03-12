# Reader SDK Flutter Plugin Technical Reference

This technical reference documents methods available in the Flutter
plugin for Reader SDK. For detailed documentation on Reader SDK, please see
[docs.connect.squareup.com].

---

* [Methods at a glance](#methods-at-a-glance)
* [Method details](#method-details)
* [Objects](#objects)
* [Enums](#enums)
* [Errors](#errors)

---



## Methods at a glance

Method                                          | Return Object                     | Description
----------------------------------------------- | --------------------------------- | ---
[authorize](#authorize)                         | [Location](#location)             | Authorizes Reader SDK to collect payments.
[canDeauthorize](#candeauthorize)               | bool                              | Verifies Reader SDK can be deauthorized.
[deauthorize](#deauthorize)                     | void                              | Deauthorizes Reader SDK.
[authorizedLocation](#authorizedlocation)       | [Location](#location)             | Returns the currently authorized location
[isAuthorized](#isauthorized)                   | bool                              | Verifies Reader SDK is currently authorized for payment collection.
[startCheckout](#startcheckout)                 | [CheckoutResult](#checkoutresult) | Begins the checkout workflow.
[startReaderSettings](#startreadersettings)     | void                              | Starts the Reader settings flow for connecting Square Reader



## Method details

### authorize

Used to authorize [Reader SDK] to collect payments on behalf of a Square
location.

Parameter | Type   | Description
--------- | ------ | -----------
authCode  | String | Authorization code from the [Mobile Authorization API]

* **On success**: returns information about the currently authorized location as a
  [Location](#location) object.
* **On failure**: throws [`usageError`](#e1) or [`authorizeErrorNoNetwork`](#e2).

#### Example usage

```dart
import 'package:square_reader_sdk/reader_sdk.dart';
import 'package:square_reader_sdk/models.dart';

try {
  // authCode is a mobile authorization code from the Mobile Authorization API
  var location = await ReaderSdk.authorize(authCode);
  // Authorized and authorizedLocation is available
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ErrorCode.authorizeErrorNoNetwork:
      // Remind connecting to network
    break;
    case ErrorCode.usageError:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
    break;
  }
}
```


---

### canDeauthorize

Used to determine if it is safe to deauthorize Reader SDK.

* **On success**: returns `true` if all transactions have successfully synced to
  Square, `false` otherwise.
* **On failure**: throws [`usageError`](#e1).

#### Example usage

```dart
import 'package:square_reader_sdk/reader_sdk.dart';

if (await ReaderSdk.canDeauthorize) {

  // Handle deauthorization

} else {
  print('Unable to deauthorize: You cannot deauthorize right now.');
}
```


---

### deauthorize

Used to deauthorize [Reader SDK]. Reader SDK cannot be deauthorized if there
are transactions that have not been synced to Square.

* **On success**: returns nothing.
* **On failure**: throws [`usageError`](#e1) or [`authorizeErrorNoNetwork`](#e2).

#### Example usage

```dart
import 'package:square_reader_sdk/reader_sdk.dart';

try {
  await ReaderSdk.deauthorize();
  // Deauthorize finished successfully
} on ReaderSdkException catch (e) {
  var errorMessage = e.message;
  if (_debug) {
    errorMessage += '\n\nDebug Message: ${e.debugMessage}';
    print('${e.code}:${e.debugCode}:${e.debugMessage}');
  }
  displayErrorModal(context, errorMessage);
}
```


---

### authorizedLocation

Used to fetch information about the location currently authorized for Reader
SDK.

* **On success**: returns information about the currently authorized location as a
  [Location](#location) object.
* **On failure**: throws [`usageError`](#e1).

#### Example usage

```dart
import 'package:square_reader_sdk/reader_sdk.dart';

try {
  var location = await ReaderSdk.authorizedLocation;
  // Start using the location object
} on ReaderSdkException catch (e) {
  var errorMessage = e.message;
  if (_debug) {
    errorMessage += '\n\nDebug Message: ${e.debugMessage}';
    print('${e.code}:${e.debugCode}:${e.debugMessage}');
  }
  displayErrorModal(context, errorMessage);
}
```


---

### isAuthorized

Used to determine if Reader SDK is currently authorized to accept payments.

* **On success**: returns `true` if the authorization flow was completed with a
  valid [Mobile Authorization API] token, `false` otherwise.
* **On failure**: throws [`usageError`](#e1).


#### Example usage

```dart
import 'package:square_reader_sdk/reader_sdk.dart';

if (await ReaderSdk.isAuthorized) {

  // Ready to take payments

} else {
  print('Unable to take payments', 'Reader SDK is not authorized.');
}
```


---

### startCheckout

Used to start the checkout flow and collect payment information from Square
Reader. Checkout cannot be started from a modal screen.

Parameter      | Type                                    | Description
-------------- | --------------------------------------- | -----------
checkoutParams | [CheckoutParameter](#checkoutparameter) | Configures the checkout flow and transaction amount.

* **On success**: returns information about the checkout result as a
  [CheckoutResult](#checkoutresult) object.
* **On failure**: throws [`usageError`](#e1), [`checkoutErrorCanceled`](#e3), or
  [`checkoutErrorSdkNotAuthorized`](#e4)


#### Example usage

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

try {
  var checkoutResult = await ReaderSdk.startCheckout(checkoutParameters);
  // checkout finished successfully and checkoutResult is available
} on ReaderSdkException catch (e) {
  switch (e.code) {
    case ErrorCode.checkoutErrorCanceled:
      // Handle canceled transaction here
      break;
    case ErrorCode.checkoutErrorSdkNotAuthorized:
      // Handle sdk not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```


---

### startReaderSettings

Used to start the Reader settings flow. Returns an error if Reader SDK is not
currently authorized.

* **On success**: returns nothing.
* **On failure**: throws [`usageError`](#e1) or
  [`readerSettingsErrorSdkNotAuthorized`](#e5)

#### Example usage

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

try {
  await ReaderSdk.startReaderSettings();
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ErrorCode.readerSettingsErrorSdkNotAuthorized:
      // Handle reader settings not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```


---

### startStoreCard

Used to start the store a card for a customer flow.

Card information is only stored on Square servers, not on the mobile device running Reader SDK, which means cards cannot be saved while the device is offline. Saved card information can be requested using Square APIs and the associated customer ID.

* **On success**: returns information about the stored card as a
  [Card](#card) object.
* **On failure**: throws [`usageError`](#e1),
[`storeCustomerErrorCanceled`](#e6),
[`storeCustomerErrorInvalidCustomerId`](#e7),
[`storeCustomerErrorSdkNotAuthorized`](#e8) or
[`storeCustomerErrorNoNetwork`](#e9)

#### Example usage

```dart
import 'package:square_reader_sdk/models.dart';
import 'package:square_reader_sdk/reader_sdk.dart';

const customerId = 'DRYKVK5Y6H5R4JH9ZPQB3XPZQC';
try {
  await ReaderSdk.startStoreCard(customerId);
  // Customer's card is stored successfully and card infomation is available
} on ReaderSdkException catch (e) {
  switch(e.code) {
    case ErrorCode.storeCustomerErrorCanceled:
      // Handle canceled
      break;
    case ErrorCode.storeCustomerErrorInvalidCustomerId:
      // Handle invalid customer id error
      break;
    case ErrorCode.storeCustomerErrorSdkNotAuthorized:
      // Handle no network error
      break;
    case ErrorCode.storeCustomerErrorNoNetwork:
      // Handle sdk not authorized
      break;
    default:
      var errorMessage = e.message;
      if (_debug) {
        errorMessage += '\n\nDebug Message: ${e.debugMessage}';
        print('${e.code}:${e.debugCode}:${e.debugMessage}');
      }
      displayErrorModal(context, errorMessage);
  }
}
```


## Objects

Reader SDK plugin objects are extended from [`built_value`], which is immutable
and serializable.

### Card

Represents the non-confidential details of a payment card.

Field             | Type            | Description
----------------- | --------------- | -----------------
brand             | String          | [CardBrand](#cardbrand) constant that indicates the entity responsible for issuing the card.
lastFourDigits    | String          | Indicates how the card information was captured.
expirationMonth   | integer         | The month when the associated card expires, if available. Expiration month is always an integer between 1 and 12, inclusive.
expirationYear    | integer         | The 4-digit year when the associated card expires, if available.
id                | String          | The unique, Square-issued identifier for the card. Only set when the object represents a saved card on file.
cardholderName    | String          | The cardholder name. This value is present only if this object represents a customer’s card on file.

#### Example output

```dart
card.toString();
/* toString() output:
{
  "brand": "VISA",
  "lastFourDigits": "1111",
  "expirationMonth": 10,
  "expirationYear": 2019,
  "id": "ccof:GrUQnrDgWnQIK6tp3GB",
  "cardHolderName": "Tod Hu"
}
*/
```


---

### CardDetails

Contains details related to a `card` tender used in a successful checkout flow.

Field       | Type          | Description
----------- | ------------- | -----------------
entryMethod | String        | [EntryMethod](#entrymethod) constant that indicates how the card information was captured.
card        | [Card](#card) | Provides information about the card used for payment.

#### Example output

```dart
cardDetails.toString();
/* toString() output:
{
  "entryMethod": "MANUALLY_ENTERED",
  "card": {
    "brand": "VISA",
    "lastFourDigits": "1111"
  }
}
*/
```


---

### CashDetails

Contains details related to a `cash` tender used in a successful checkout flow.

Field            | Type            | Description
---------------- | --------------- | -----------------
buyerTenderMoney | [Money](#money) | The total payment amount provided as `cash` during checkout.
changBackMoney   | [Money](#money) | The total change provided as `cash` during checkout.

#### Example output

```dart
cashDetails.toString();
/* toString() output:
{
  "buyerTenderMoney": {
    "currencyCode": "USD",
    "amount": 110
  },
  "changBackMoney": {
    "currencyCode": "USD",
    "amount": 10
  }
}
*/
```


---

### CheckoutParameter

Configures the UI experience for the checkout flow.

Field                  | Type                        | Description
---------------------- | --------------------------- | -----------------
amountMoney            | [Money](#money)             | **REQUIRED**. The total payment amount.
skipReceipt            | bool                        | Indicates that the digital receipt options screen should not be displayed during checkout. Default: `false`
collectSignature       | boolean                     | Indicates that signature collection is required during checkout. When false, the signature screen will never be displayed; when true, it will always be used. Default: `false`
allowSplitTender       | bool                        | Indicates that multiple payment methods are allowed. Default: `false`
note                   | String                      | A note to display on digital receipts and in the [Square Dashboard]. Default: `null`
tipSettings            | [TipSettings](#tipsettings) | Settings that configure the tipping behavior of the checkout flow. Default: `null`
additionalPaymentTypes | String[]                    | [AdditionalPaymentType](#additionalpaymenttype) constant denoting valid payment methods for checkout (in addition to payments via Square Readers). Default: empty set.

#### Example construction

```dart
var builder = CheckoutParametersBuilder();
builder.amountMoney = MoneyBuilder()
  ..amount = 1000
  ..currencyCode = 'USD';
builder.skipReceipt = false;
builder.collectSignature = true;
builder.allowSplitTender = false;
builder.note = 'Payment for dogsitting';
builder.additionalPaymentTypes =
    ListBuilder([
      AdditionalPaymentType.cash,
      AdditionalPaymentType.manualCardEntry,
      AdditionalPaymentType.other
    ]);
builder.tipSettings = TipSettingsBuilder()
  ..showCustomTipField = false
  ..showSeparateTipScreen = true
  ..tipPercentages = ListBuilder([10, 15, 20]);

CheckoutParameters checkoutParameters = builder.build();
```


---

### CheckoutResult

Contains the result of a successful checkout flow.

Field               | Type                 | Description
------------------- | -------------------- | -----------------
totalMoney          | [Money](#money)     | The total amount of money collected during the checkout flow.
locationId          | String              | The unique ID of the location to which the transaction was credited.
totalTipMoney       | [Money](#money)     | The total tip amount applied across all tenders.
transactionClientId | String              | A unique client-generated ID.
createdAt           | String              | The date and time when the transaction was completed as determined by the client device.
tenders             | [Tender](#tender)[] | The set of tenders associated with a successful transaction.
transactionId       | String              | A unique ID issued by Square. Only set for successful transactions that include one or more card tenders.

All successful transactions include a client-generated ID (`transactionClientId`).
Transactions with card tenders also include a `transactionId` that is assigned
when the card is processed by Square.

To reconcile transactions that do not have card tenders, use
`transactionClientId` to match client-generated transactions to the `client_id`
field in transactions returned by the ListTransactions endpoint of the
[Transactions API].

#### Example output

```dart
checkoutResult.toString();
/* toString() output:
{
"totalMoney": {
  "currencyCode": "USD",
  "amount": 100
},
"locationId": "XXXXXXXXXXXXX",
"totalTipMoney": {
  "currencyCode": "USD",
  "amount": 0
},
"tenders": [
  {
    "type": "cash",
    "createdAt": "2018-08-22T18:05:18Z"
  },
  {
    "type": "card",
    "tenderId": "XXXXXXXXXXXXXXXXXXXXXXXX",
    "createdAt": "2018-08-22T18:05:59Z"
  },
],
  "transactionId": "XXXXXXXXXXXXXXXXXXXXXXXX",
  "transactionClientId": "0X0000X0-0000-000X-XX0X-X00XX00X00X0",
  "createdAt": "2018-08-22T18:05:21Z"
}
*/
```


---

### Location

Represents information about a location associated with a Square account.

Field                         | Type            | Description
----------------------------- | --------------- | -----------------
currencyCode                  | String          | The currency used for all transactions at this location, specified in [ISO 4217 format] .
businessName                  | String          | The business name associated with the location. This is the name shown on Square digital receipts.
isCardProcessingActivated     | bool            | Indicates whether or not this location is activated for card processing.
maximumCardPaymentAmountMoney | [Money](#money) | The maximum card payment amount allowed at this location.
minimumCardPaymentAmountMoney | [Money](#money) | The minimum card payment amount allowed at this location.
name                          | String          | The nickname of the location as set in the [Square Dashboard].
locationId                    | String          | A unique ID for the location assigned by Square

#### Example output

```dart
location.toString();
/* toString() output:
{
  "currencyCode": "USD",
  "businessName": "Raphael's Puppy Care Emporium",
  "isCardProcessingActivated": true,
  "maximumCardPaymentAmountMoney": {
    "amount": 50000,
    "currencyCode": "USD"},
  "minimumCardPaymentAmountMoney": {
    "amount": 100,
    "currencyCode": "USD"},
  "name": "Chicago Treat-mobile",
  "locationId": "XXXXXXXXXXXXX"
}
*/
```


---

### Money

Captures information about the amount tendered during a transaction. **Monetary
amounts are specified, in the smallest denomination of the currency indicated**.
For example, when `currency` is `USD`, `amount` is in cents, so a 1 dollar
payment (1 USD) would have `amount` equal to `100`.  

Field        | Type    | Description
------------ | ------- | -----------------
amount       | integer | **REQUIRED** The amount of money, in the smallest denomination of the indicated currency.
currencyCode | String  | The type of currency, in [ISO 4217 format]. For example, the currency code for US dollars is USD.

All `Money` objects require an `amount` and `currencyCode` but `currenyCode` is
optional for the Reader SDK Flutter plugin because `Money` objects will use
the currency code of the currently authorized location by default.

#### Example output

```dart
money.toString();
/* toString() output:
{
  "amount": 100,
  "currencyCode": "USD"
}
*/
```


---

### Tender

Contains the result of a processed tender.

Field       | Type                        | Description
----------- | --------------------------- | -----------------
cardDetails | [CardDetails](#carddetails) | Details about the tender. Only set for `card` tenders.
cashDetails | [CashDetails](#cashdetails) | Details about the tender. Only set for `cash` tenders.
createdAt   | String                      | The date and time when the tender was processed as determined by the client device.
tenderId    | String                      | A unique ID issued by Square. Only set for `card` tenders.
tipMoney    | [Money](#money)             | The monetary amount added to this tender as a tip.
totalMoney  | [Money](#money)             | The total monetary amount of this tender, including tips.
type        | String                      | [TenderType](#tendertype) constant denoting the method used to make payment.


#### Example output

```dart
tender.toString();
/* toString() output:
{
  "type": "cash",
  "tenderId": "XXXXXXXXXXXXXXXXXXXXXXXX",
  "createdAt": "2018-08-22T18:05:18Z",
  "totalMoney": {
    "amount": 1500,
    "currencyCode": "USD"
  },
  "tipMoney": {
    "amount": 500,
    "currencyCode": "USD"
  },
  "cashDetails": {
    "buyerTenderMoney": {
      "currencyCode": "USD",
      "amount": 2000
    },
    "changBackMoney": {
      "currencyCode": "USD",
      "amount": 500
    }
  }      
}
*/
```


---

### TipSettings

Settings that configure the tipping behavior of the checkout flow.

Field                 | Type      | Description
--------------------- | --------- | -----------------
showCustomTipField    | bool      | Indicates whether custom tip amounts are allowed during the checkout flow. Default: `false`.
showSeparateTipScreen | bool      | Indicates that tip options should be presented on their own screen. Default: `false`.
tipPercentages        | Integer[] | A list of up to 3 non-negative integers from 0 to 100 (inclusive) to indicate tip percentages that will be presented during the checkout flow. Default: `[15, 20, 25]`

#### Example output

```dart
tipSettings.toString();
/* toString() output:
{
  "showCustomTipField": "false",
  "showSeparateTipScreen": "true",
  "tipPercentages": [10, 15, 20]
}
*/
```



## Enums

Constants in Reader SDK are implemented as strings rather than explicit types,
but the plugin will return, and look for, explicit string values for the
constants.

### AdditionalPaymentType

Payment types accepted during the Reader SDK checkout flow in addition to
payment via Square Readers:

* `manualCardEntry` - Manually typed-in card payments.
* `cash`            - Cash payments. Useful for testing.
* `other`           - Check, third-party gift cards, and other payment types.


---

### CardBrand

Supported brands for `card` payments accepted during the Reader SDK checkout
flow.

* `visa` - Visa Inc. credit or debit card.
* `mastercard` - Mastercard Incorporated credit or debit card.
* `americanExpress` - American Express Company credit card.
* `discover` - Discover Financial Services credit card.
* `discoverDiners` - Diners Club International credit card.
* `interac` - Canadian Interbank Network debit card.
* `jcb` - Japan Credit Bureau credit card.
* `chinaUnionPay` - China UnionPay credit card.
* `squareGiftCard` - [Square-issued gift card].
* `eftpos` - A debit or cash-back transaction (Electronic Funds Transfer at Point Of Sale).
* `otherBrand` - An unexpected card type.


---

### EntryMethod

Entry methods for `card` payments accepted during the Reader SDK checkout flow.

* `chip` - Card information collected with Square Reader via chip ("dip").
* `contactless` - Card information collected with Square Reader via NFC ("tap").
* `manuallyEntered` - Card information collected by typing it in ("keyed-in").
* `swipe` - Card information collected with Square Reader via magstripe ("swipe").
* `unknown` - **iOS only**. Card information collected in some other way (e.g., Apple Pay digital wallet).

---

### TenderType

Methods used to provide payment during a successful checkout flow:

* `card`  - Scanned, dipped, or manually typed-in card payments.
* `cash`  - Cash payments. Useful for testing.
* `other` - Check, third-party gift cards, and other payment types.



## Errors

Error                                                    | Cause                                                               | Returned by
-------------------------------------------------------- | ------------------------------------------------------------------- | ---
<a id="e1">`usageError`</a>                              | Reader SDK was used in an unexpected or unsupported way.            | all methods
<a id="e2">`authorizeErrorNoNetwork`</a>                 | Reader SDK could not connect to the network.                        | [authorize](#authorize)
<a id="e3">`checkoutErrorCanceled`</a>                   | The user canceled the checkout flow.                                | [startCheckout](#startcheckout)
<a id="e4">`checkoutErrorSdkNotAuthorized`</a>           | The checkout flow started but Reader SDK was not authorized.        | [startCheckout](#startcheckout)
<a id="e5">`readerSettingsErrorSdkNotAuthorized`</a>     | The Reader settings flow started but Reader SDK was not authorized. | [startReaderSettings](#startreadersettings)
<a id="e6">`storeCustomerErrorCanceled`</a>              | The user canceled the store card flow.                              | [startStoreCard](#startstorecard)
<a id="e7">`storeCustomerErrorInvalidCustomerId`</a>     | The customer ID passed into the controller was invalid.             | [startStoreCard](#startstorecard)
<a id="e8">`storeCustomerErrorSdkNotAuthorized`</a>      | The flow to store a customer card started but Reader SDK was not authorized. | [startStoreCard](#startstorecard)
<a id="e9">`storeCustomerErrorNoNetwork`</a>             | Reader SDK could not connect to the network.                        | [startStoreCard](#startstorecard)


[//]: # "Link anchor definitions"
[docs.connect.squareup.com]: https://docs.connect.squareup.com
[Mobile Authorization API]: https://docs.connect.squareup.com/payments/readersdk/mobile-authz-guide
[Reader SDK]: https://docs.connect.squareup.com/payments/readersdk/overview
[ISO 4217 format]: https://www.iban.com/currency-codes.html
[Square Dashboard]: https://squareup.com/dashboard/
[Transactions API]: https://docs.connect.squareup.com/payments/transactions/overview
[Square-issued gift card]: https://squareup.com/us/en/software/gift-cards
[`built_value`]: https://github.com/google/built_value.dart
