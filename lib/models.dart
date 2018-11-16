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

abstract class Tender implements Built<Tender, TenderBuilder> {

  Money get totalMoney;

  Money get tipMoney;

  String get type;

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

abstract class CardDetails implements Built<CardDetails, CardDetailsBuilder> {
  String get entryMethod;
  Card get card;

  CardDetails._();
  factory CardDetails([updates(CardDetailsBuilder b)]) = _$CardDetails;
  static Serializer<CardDetails> get serializer => _$cardDetailsSerializer;
}

abstract class Card implements Built<Card, CardBuilder> {
  String get brand;
  String get lastFourDigits;

  Card._();
  factory Card([updates(CardBuilder b)]) = _$Card;
  static Serializer<Card> get serializer => _$cardSerializer;
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
  BuiltList<String> get additionalPaymentTypes;

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

  // error codes are defined below, both iOS and Android *MUST* return same error for these errors:
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
