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
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'models.g.dart';

abstract class Money implements Built<Money, MoneyBuilder> {
  int get amount;

  @nullable
  String get currencyCode;

  Money._();
  factory Money([updates(MoneyBuilder b)]) = _$Money;
  static Serializer<Money> get serializer => _$moneySerializer;
}


abstract class Location implements Built<Location, LocationBuilder> {
  String get currencyCode;
  String get businessName;
  String get name;
  String get locationId;
  bool get isCardProcessingActivated;
  Money get maximumCardPaymentAmountMoney;
  Money get minimumCardPaymentAmountMoney;

  Location._();
  factory Location([updates(LocationBuilder b)]) = _$Location;
  static Serializer<Location> get serializer => _$locationSerializer;
}

abstract class CheckoutResult implements Built<CheckoutResult, CheckoutResultBuilder> {
  @nullable
  String get transactionId;
  String get transactionClientId;
  String get locationId;
  String get createdAt;
  Money get totalMoney;
  Money get totalTipMoney;
  BuiltList<Tender> get tenders;

  CheckoutResult._();
  factory CheckoutResult([updates(CheckoutResultBuilder b)]) = _$CheckoutResult;
  static Serializer<CheckoutResult> get serializer => _$checkoutResultSerializer;
}

class TenderType extends EnumClass {
  static Serializer<TenderType> get serializer => _$tenderTypeSerializer;

  static const TenderType card = _$cardTenderType;
  static const TenderType cash = _$cashTenderType;
  static const TenderType other = _$otherTenderType;

  const TenderType._(String name) : super(name);

  static BuiltSet<TenderType> get values => _$tenderTypeValues;
  static TenderType valueOf(String name) => _$tenderTypeValueOf(name);
}

abstract class Tender implements Built<Tender, TenderBuilder> {
  Money get totalMoney;

  Money get tipMoney;

  TenderType get type;

  @nullable
  String get tenderId;

  String get createdAt;

  @nullable
  CardDetails get cardDetails;

  @nullable
  CashDetails get cashDetails;

  Tender._();
  factory Tender([updates(TenderBuilder b)]) = _$Tender;
  static Serializer<Tender> get serializer => _$tenderSerializer;
}

abstract class CashDetails implements Built<CashDetails, CashDetailsBuilder> {
  Money get buyerTenderedMoney;

  Money get changeBackMoney;

  CashDetails._();
  factory CashDetails([updates(CashDetailsBuilder b)]) = _$CashDetails;
  static Serializer<CashDetails> get serializer => _$cashDetailsSerializer;
}

class EntryMethod extends EnumClass {
  static Serializer<EntryMethod> get serializer => _$entryMethodSerializer;

  @BuiltValueEnumConst(wireName: 'CHIP')
  static const EntryMethod chip = _$chip;
  @BuiltValueEnumConst(wireName: 'CONTACTLESS')
  static const EntryMethod contactless = _$contactless;
  @BuiltValueEnumConst(wireName: 'MANUALLY_ENTERED')
  static const EntryMethod manuallyEntered = _$manuallyEntered;
  @BuiltValueEnumConst(wireName: 'SWIPE')
  static const EntryMethod swipe = _$swipe;
  @BuiltValueEnumConst(wireName: 'UNKNOWN')
  static const EntryMethod unknown = _$unknown;

  const EntryMethod._(String name) : super(name);

  static BuiltSet<EntryMethod> get values => _$entryMethodValues;
  static EntryMethod valueOf(String name) => _$entryMethodValueOf(name);
}

abstract class CardDetails implements Built<CardDetails, CardDetailsBuilder> {
  EntryMethod get entryMethod;
  Card get card;

  CardDetails._();
  factory CardDetails([updates(CardDetailsBuilder b)]) = _$CardDetails;
  static Serializer<CardDetails> get serializer => _$cardDetailsSerializer;
}

class Brand extends EnumClass {
  static Serializer<Brand> get serializer => _$brandSerializer;

  @BuiltValueEnumConst(wireName: 'OTHER_BRAND')
  static const Brand otherBrand = _$otherBrand;
  @BuiltValueEnumConst(wireName: 'VISA')
  static const Brand visa = _$visa;
  @BuiltValueEnumConst(wireName: 'MASTERCARD')
  static const Brand mastercard = _$mastercard;
  @BuiltValueEnumConst(wireName: 'AMERICAN_EXPRESS')
  static const Brand americanExpress = _$americanExpress;
  @BuiltValueEnumConst(wireName: 'DISCOVER')
  static const Brand discover = _$discover;
  @BuiltValueEnumConst(wireName: 'DISCOVER_DINERS')
  static const Brand discoverDiners = _$discoverDiners;
  @BuiltValueEnumConst(wireName: 'INTERAC')
  static const Brand interac = _$interac;
  @BuiltValueEnumConst(wireName: 'JCB')
  static const Brand jCB = _$jCB;
  @BuiltValueEnumConst(wireName: 'CHINA_UNION_PAY')
  static const Brand chinaUnionPay = _$chinaUnionPay;
  @BuiltValueEnumConst(wireName: 'SQUARE_GIFT_CARD')
  static const Brand squareGiftCard = _$squareGiftCard;

  const Brand._(String name) : super(name);

  static BuiltSet<Brand> get values => _$brandValues;
  static Brand valueOf(String name) => _$brandValueOf(name);
}

abstract class Card implements Built<Card, CardBuilder> {
  Brand get brand;
  String get lastFourDigits;

  Card._();
  factory Card([updates(CardBuilder b)]) = _$Card;
  static Serializer<Card> get serializer => _$cardSerializer;
}

class AdditionalPaymentType extends EnumClass {
  static Serializer<AdditionalPaymentType> get serializer => _$additionalPaymentTypeSerializer;

  @BuiltValueEnumConst(wireName: 'manual_card_entry')
  static const AdditionalPaymentType manualCardEntry = _$manualCardEntryAdditionalPaymentType;
  @BuiltValueEnumConst(wireName: 'cash')
  static const AdditionalPaymentType cash = _$cashAdditionalPaymentType;
  @BuiltValueEnumConst(wireName: 'other')
  static const AdditionalPaymentType other = _$otherAdditionalPaymentType;

  const AdditionalPaymentType._(String name) : super(name);

  static BuiltSet<AdditionalPaymentType> get values => _$additionalPaymentTypeValues;
  static AdditionalPaymentType valueOf(String name) => _$additionalPaymentTypeValueOf(name);
}

abstract class CheckoutParameters implements Built<CheckoutParameters, CheckoutParametersBuilder> {

  Money get amountMoney;

  @nullable
  bool get skipReceipt;

  @nullable
  bool get alwaysRequireSignature;

  @nullable
  bool get allowSplitTender;

  @nullable
  String get note;

  @nullable
  BuiltList<AdditionalPaymentType> get additionalPaymentTypes;

  @nullable
  TipSettings get tipSettings;

  CheckoutParameters._();
  factory CheckoutParameters([updates(CheckoutParametersBuilder b)]) = _$CheckoutParameters;
  static Serializer<CheckoutParameters> get serializer => _$checkoutParametersSerializer;
}

abstract class TipSettings implements Built<TipSettings, TipSettingsBuilder> {
  @nullable
  bool get showCustomTipField;
  @nullable
  bool get showSeparateTipScreen;
  @nullable
  BuiltList<int> get tipPercentages;

  TipSettings._();
  factory TipSettings([updates(TipSettingsBuilder b)]) = _$TipSettings;
  static Serializer<TipSettings> get serializer => _$tipSettingsSerializer;
}

class ErrorCode extends EnumClass {
  static Serializer<ErrorCode> get serializer => _$errorCodeSerializer;

  @BuiltValueEnumConst(wireName: 'USAGE_ERROR')
  static const ErrorCode usageError = _$usageError;
  @BuiltValueEnumConst(wireName: 'AUTHORIZE_NO_NETWORK')
  static const ErrorCode authorizeErrorNoNetwork = _$authorizeErrorNoNetwork;
  @BuiltValueEnumConst(wireName: 'CHECKOUT_CANCELED')
  static const ErrorCode checkoutErrorCanceled = _$checkoutErrorCanceled;
  @BuiltValueEnumConst(wireName: 'CHECKOUT_SDK_NOT_AUTHORIZED')
  static const ErrorCode checkoutErrorSdkNotAuthorized = _$checkoutErrorSdkNotAuthorized;
  @BuiltValueEnumConst(wireName: 'READER_SETTINGS_SDK_NOT_AUTHORIZED')
  static const ErrorCode readerSettingsErrorSdkNotAuthorized = _$readerSettingsErrorSdkNotAuthorized;

  const ErrorCode._(String name) : super(name);

  static BuiltSet<ErrorCode> get values => _$errorCodeValues;
  static ErrorCode valueOf(String name) => _$errorCodeValueOf(name);
}
