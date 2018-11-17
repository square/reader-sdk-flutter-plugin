// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

const TenderType _$cardTenderType = const TenderType._('card');
const TenderType _$cashTenderType = const TenderType._('cash');
const TenderType _$otherTenderType = const TenderType._('other');

TenderType _$tenderTypeValueOf(String name) {
  switch (name) {
    case 'card':
      return _$cardTenderType;
    case 'cash':
      return _$cashTenderType;
    case 'other':
      return _$otherTenderType;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TenderType> _$tenderTypeValues =
    new BuiltSet<TenderType>(const <TenderType>[
  _$cardTenderType,
  _$cashTenderType,
  _$otherTenderType,
]);

const EntryMethod _$chip = const EntryMethod._('chip');
const EntryMethod _$contactless = const EntryMethod._('contactless');
const EntryMethod _$manuallyEntered = const EntryMethod._('manuallyEntered');
const EntryMethod _$swipe = const EntryMethod._('swipe');
const EntryMethod _$unknown = const EntryMethod._('unknown');

EntryMethod _$entryMethodValueOf(String name) {
  switch (name) {
    case 'chip':
      return _$chip;
    case 'contactless':
      return _$contactless;
    case 'manuallyEntered':
      return _$manuallyEntered;
    case 'swipe':
      return _$swipe;
    case 'unknown':
      return _$unknown;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EntryMethod> _$entryMethodValues =
    new BuiltSet<EntryMethod>(const <EntryMethod>[
  _$chip,
  _$contactless,
  _$manuallyEntered,
  _$swipe,
  _$unknown,
]);

const Brand _$otherBrand = const Brand._('otherBrand');
const Brand _$visa = const Brand._('visa');
const Brand _$mastercard = const Brand._('mastercard');
const Brand _$americanExpress = const Brand._('americanExpress');
const Brand _$discover = const Brand._('discover');
const Brand _$discoverDiners = const Brand._('discoverDiners');
const Brand _$interac = const Brand._('interac');
const Brand _$jCB = const Brand._('jCB');
const Brand _$chinaUnionPay = const Brand._('chinaUnionPay');
const Brand _$squareGiftCard = const Brand._('squareGiftCard');

Brand _$brandValueOf(String name) {
  switch (name) {
    case 'otherBrand':
      return _$otherBrand;
    case 'visa':
      return _$visa;
    case 'mastercard':
      return _$mastercard;
    case 'americanExpress':
      return _$americanExpress;
    case 'discover':
      return _$discover;
    case 'discoverDiners':
      return _$discoverDiners;
    case 'interac':
      return _$interac;
    case 'jCB':
      return _$jCB;
    case 'chinaUnionPay':
      return _$chinaUnionPay;
    case 'squareGiftCard':
      return _$squareGiftCard;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Brand> _$brandValues = new BuiltSet<Brand>(const <Brand>[
  _$otherBrand,
  _$visa,
  _$mastercard,
  _$americanExpress,
  _$discover,
  _$discoverDiners,
  _$interac,
  _$jCB,
  _$chinaUnionPay,
  _$squareGiftCard,
]);

const AdditionalPaymentType _$manualCardEntryAdditionalPaymentType =
    const AdditionalPaymentType._('manualCardEntry');
const AdditionalPaymentType _$cashAdditionalPaymentType =
    const AdditionalPaymentType._('cash');
const AdditionalPaymentType _$otherAdditionalPaymentType =
    const AdditionalPaymentType._('other');

AdditionalPaymentType _$additionalPaymentTypeValueOf(String name) {
  switch (name) {
    case 'manualCardEntry':
      return _$manualCardEntryAdditionalPaymentType;
    case 'cash':
      return _$cashAdditionalPaymentType;
    case 'other':
      return _$otherAdditionalPaymentType;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AdditionalPaymentType> _$additionalPaymentTypeValues =
    new BuiltSet<AdditionalPaymentType>(const <AdditionalPaymentType>[
  _$manualCardEntryAdditionalPaymentType,
  _$cashAdditionalPaymentType,
  _$otherAdditionalPaymentType,
]);

const ErrorCode _$usageError = const ErrorCode._('usageError');
const ErrorCode _$authorizeErrorNoNetwork =
    const ErrorCode._('authorizeErrorNoNetwork');
const ErrorCode _$checkoutErrorCanceled =
    const ErrorCode._('checkoutErrorCanceled');
const ErrorCode _$checkoutErrorSdkNotAuthorized =
    const ErrorCode._('checkoutErrorSdkNotAuthorized');
const ErrorCode _$readerSettingsErrorSdkNotAuthorized =
    const ErrorCode._('readerSettingsErrorSdkNotAuthorized');

ErrorCode _$errorCodeValueOf(String name) {
  switch (name) {
    case 'usageError':
      return _$usageError;
    case 'authorizeErrorNoNetwork':
      return _$authorizeErrorNoNetwork;
    case 'checkoutErrorCanceled':
      return _$checkoutErrorCanceled;
    case 'checkoutErrorSdkNotAuthorized':
      return _$checkoutErrorSdkNotAuthorized;
    case 'readerSettingsErrorSdkNotAuthorized':
      return _$readerSettingsErrorSdkNotAuthorized;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ErrorCode> _$errorCodeValues =
    new BuiltSet<ErrorCode>(const <ErrorCode>[
  _$usageError,
  _$authorizeErrorNoNetwork,
  _$checkoutErrorCanceled,
  _$checkoutErrorSdkNotAuthorized,
  _$readerSettingsErrorSdkNotAuthorized,
]);

Serializer<Money> _$moneySerializer = new _$MoneySerializer();
Serializer<Location> _$locationSerializer = new _$LocationSerializer();
Serializer<CheckoutResult> _$checkoutResultSerializer =
    new _$CheckoutResultSerializer();
Serializer<TenderType> _$tenderTypeSerializer = new _$TenderTypeSerializer();
Serializer<Tender> _$tenderSerializer = new _$TenderSerializer();
Serializer<CashDetails> _$cashDetailsSerializer = new _$CashDetailsSerializer();
Serializer<EntryMethod> _$entryMethodSerializer = new _$EntryMethodSerializer();
Serializer<CardDetails> _$cardDetailsSerializer = new _$CardDetailsSerializer();
Serializer<Brand> _$brandSerializer = new _$BrandSerializer();
Serializer<Card> _$cardSerializer = new _$CardSerializer();
Serializer<AdditionalPaymentType> _$additionalPaymentTypeSerializer =
    new _$AdditionalPaymentTypeSerializer();
Serializer<CheckoutParameters> _$checkoutParametersSerializer =
    new _$CheckoutParametersSerializer();
Serializer<TipSettings> _$tipSettingsSerializer = new _$TipSettingsSerializer();
Serializer<ErrorCode> _$errorCodeSerializer = new _$ErrorCodeSerializer();

class _$MoneySerializer implements StructuredSerializer<Money> {
  @override
  final Iterable<Type> types = const [Money, _$Money];
  @override
  final String wireName = 'Money';

  @override
  Iterable serialize(Serializers serializers, Money object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'amount',
      serializers.serialize(object.amount, specifiedType: const FullType(int)),
    ];
    if (object.currencyCode != null) {
      result
        ..add('currencyCode')
        ..add(serializers.serialize(object.currencyCode,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Money deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoneyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currencyCode':
          result.currencyCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currencyCode',
      serializers.serialize(object.currencyCode,
          specifiedType: const FullType(String)),
      'businessName',
      serializers.serialize(object.businessName,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'locationId',
      serializers.serialize(object.locationId,
          specifiedType: const FullType(String)),
      'isCardProcessingActivated',
      serializers.serialize(object.isCardProcessingActivated,
          specifiedType: const FullType(bool)),
      'maximumCardPaymentAmountMoney',
      serializers.serialize(object.maximumCardPaymentAmountMoney,
          specifiedType: const FullType(Money)),
      'minimumCardPaymentAmountMoney',
      serializers.serialize(object.minimumCardPaymentAmountMoney,
          specifiedType: const FullType(Money)),
    ];

    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currencyCode':
          result.currencyCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'businessName':
          result.businessName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locationId':
          result.locationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isCardProcessingActivated':
          result.isCardProcessingActivated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'maximumCardPaymentAmountMoney':
          result.maximumCardPaymentAmountMoney.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'minimumCardPaymentAmountMoney':
          result.minimumCardPaymentAmountMoney.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(Money)) as Money);
          break;
      }
    }

    return result.build();
  }
}

class _$CheckoutResultSerializer
    implements StructuredSerializer<CheckoutResult> {
  @override
  final Iterable<Type> types = const [CheckoutResult, _$CheckoutResult];
  @override
  final String wireName = 'CheckoutResult';

  @override
  Iterable serialize(Serializers serializers, CheckoutResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'transactionClientId',
      serializers.serialize(object.transactionClientId,
          specifiedType: const FullType(String)),
      'locationId',
      serializers.serialize(object.locationId,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'totalMoney',
      serializers.serialize(object.totalMoney,
          specifiedType: const FullType(Money)),
      'totalTipMoney',
      serializers.serialize(object.totalTipMoney,
          specifiedType: const FullType(Money)),
      'tenders',
      serializers.serialize(object.tenders,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Tender)])),
    ];
    if (object.transactionId != null) {
      result
        ..add('transactionId')
        ..add(serializers.serialize(object.transactionId,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  CheckoutResult deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckoutResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'transactionId':
          result.transactionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transactionClientId':
          result.transactionClientId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locationId':
          result.locationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalMoney':
          result.totalMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'totalTipMoney':
          result.totalTipMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'tenders':
          result.tenders.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Tender)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$TenderTypeSerializer implements PrimitiveSerializer<TenderType> {
  @override
  final Iterable<Type> types = const <Type>[TenderType];
  @override
  final String wireName = 'TenderType';

  @override
  Object serialize(Serializers serializers, TenderType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TenderType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TenderType.valueOf(serialized as String);
}

class _$TenderSerializer implements StructuredSerializer<Tender> {
  @override
  final Iterable<Type> types = const [Tender, _$Tender];
  @override
  final String wireName = 'Tender';

  @override
  Iterable serialize(Serializers serializers, Tender object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'totalMoney',
      serializers.serialize(object.totalMoney,
          specifiedType: const FullType(Money)),
      'tipMoney',
      serializers.serialize(object.tipMoney,
          specifiedType: const FullType(Money)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TenderType)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
    ];
    if (object.tenderId != null) {
      result
        ..add('tenderId')
        ..add(serializers.serialize(object.tenderId,
            specifiedType: const FullType(String)));
    }
    if (object.cardDetails != null) {
      result
        ..add('cardDetails')
        ..add(serializers.serialize(object.cardDetails,
            specifiedType: const FullType(CardDetails)));
    }
    if (object.cashDetails != null) {
      result
        ..add('cashDetails')
        ..add(serializers.serialize(object.cashDetails,
            specifiedType: const FullType(CashDetails)));
    }

    return result;
  }

  @override
  Tender deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TenderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'totalMoney':
          result.totalMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'tipMoney':
          result.tipMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(TenderType)) as TenderType;
          break;
        case 'tenderId':
          result.tenderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cardDetails':
          result.cardDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(CardDetails)) as CardDetails);
          break;
        case 'cashDetails':
          result.cashDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(CashDetails)) as CashDetails);
          break;
      }
    }

    return result.build();
  }
}

class _$CashDetailsSerializer implements StructuredSerializer<CashDetails> {
  @override
  final Iterable<Type> types = const [CashDetails, _$CashDetails];
  @override
  final String wireName = 'CashDetails';

  @override
  Iterable serialize(Serializers serializers, CashDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'buyerTenderedMoney',
      serializers.serialize(object.buyerTenderedMoney,
          specifiedType: const FullType(Money)),
      'changeBackMoney',
      serializers.serialize(object.changeBackMoney,
          specifiedType: const FullType(Money)),
    ];

    return result;
  }

  @override
  CashDetails deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CashDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'buyerTenderedMoney':
          result.buyerTenderedMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'changeBackMoney':
          result.changeBackMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryMethodSerializer implements PrimitiveSerializer<EntryMethod> {
  static const Map<String, String> _toWire = const <String, String>{
    'chip': 'CHIP',
    'contactless': 'CONTACTLESS',
    'manuallyEntered': 'MANUALLY_ENTERED',
    'swipe': 'SWIPE',
    'unknown': 'UNKNOWN',
  };
  static const Map<String, String> _fromWire = const <String, String>{
    'CHIP': 'chip',
    'CONTACTLESS': 'contactless',
    'MANUALLY_ENTERED': 'manuallyEntered',
    'SWIPE': 'swipe',
    'UNKNOWN': 'unknown',
  };

  @override
  final Iterable<Type> types = const <Type>[EntryMethod];
  @override
  final String wireName = 'EntryMethod';

  @override
  Object serialize(Serializers serializers, EntryMethod object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EntryMethod deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EntryMethod.valueOf(_fromWire[serialized] ?? serialized as String);
}

class _$CardDetailsSerializer implements StructuredSerializer<CardDetails> {
  @override
  final Iterable<Type> types = const [CardDetails, _$CardDetails];
  @override
  final String wireName = 'CardDetails';

  @override
  Iterable serialize(Serializers serializers, CardDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'entryMethod',
      serializers.serialize(object.entryMethod,
          specifiedType: const FullType(EntryMethod)),
      'card',
      serializers.serialize(object.card, specifiedType: const FullType(Card)),
    ];

    return result;
  }

  @override
  CardDetails deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'entryMethod':
          result.entryMethod = serializers.deserialize(value,
              specifiedType: const FullType(EntryMethod)) as EntryMethod;
          break;
        case 'card':
          result.card.replace(serializers.deserialize(value,
              specifiedType: const FullType(Card)) as Card);
          break;
      }
    }

    return result.build();
  }
}

class _$BrandSerializer implements PrimitiveSerializer<Brand> {
  static const Map<String, String> _toWire = const <String, String>{
    'otherBrand': 'OTHER_BRAND',
    'visa': 'VISA',
    'mastercard': 'MASTERCARD',
    'americanExpress': 'AMERICAN_EXPRESS',
    'discover': 'DISCOVER',
    'discoverDiners': 'DISCOVER_DINERS',
    'interac': 'INTERAC',
    'jCB': 'JCB',
    'chinaUnionPay': 'CHINA_UNION_PAY',
    'squareGiftCard': 'SQUARE_GIFT_CARD',
  };
  static const Map<String, String> _fromWire = const <String, String>{
    'OTHER_BRAND': 'otherBrand',
    'VISA': 'visa',
    'MASTERCARD': 'mastercard',
    'AMERICAN_EXPRESS': 'americanExpress',
    'DISCOVER': 'discover',
    'DISCOVER_DINERS': 'discoverDiners',
    'INTERAC': 'interac',
    'JCB': 'jCB',
    'CHINA_UNION_PAY': 'chinaUnionPay',
    'SQUARE_GIFT_CARD': 'squareGiftCard',
  };

  @override
  final Iterable<Type> types = const <Type>[Brand];
  @override
  final String wireName = 'Brand';

  @override
  Object serialize(Serializers serializers, Brand object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  Brand deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Brand.valueOf(_fromWire[serialized] ?? serialized as String);
}

class _$CardSerializer implements StructuredSerializer<Card> {
  @override
  final Iterable<Type> types = const [Card, _$Card];
  @override
  final String wireName = 'Card';

  @override
  Iterable serialize(Serializers serializers, Card object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'brand',
      serializers.serialize(object.brand, specifiedType: const FullType(Brand)),
      'lastFourDigits',
      serializers.serialize(object.lastFourDigits,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Card deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(Brand)) as Brand;
          break;
        case 'lastFourDigits':
          result.lastFourDigits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AdditionalPaymentTypeSerializer
    implements PrimitiveSerializer<AdditionalPaymentType> {
  static const Map<String, String> _toWire = const <String, String>{
    'manualCardEntry': 'manual_card_entry',
    'cash': 'cash',
    'other': 'other',
  };
  static const Map<String, String> _fromWire = const <String, String>{
    'manual_card_entry': 'manualCardEntry',
    'cash': 'cash',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[AdditionalPaymentType];
  @override
  final String wireName = 'AdditionalPaymentType';

  @override
  Object serialize(Serializers serializers, AdditionalPaymentType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdditionalPaymentType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdditionalPaymentType.valueOf(
          _fromWire[serialized] ?? serialized as String);
}

class _$CheckoutParametersSerializer
    implements StructuredSerializer<CheckoutParameters> {
  @override
  final Iterable<Type> types = const [CheckoutParameters, _$CheckoutParameters];
  @override
  final String wireName = 'CheckoutParameters';

  @override
  Iterable serialize(Serializers serializers, CheckoutParameters object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'amountMoney',
      serializers.serialize(object.amountMoney,
          specifiedType: const FullType(Money)),
    ];
    if (object.skipReceipt != null) {
      result
        ..add('skipReceipt')
        ..add(serializers.serialize(object.skipReceipt,
            specifiedType: const FullType(bool)));
    }
    if (object.alwaysRequireSignature != null) {
      result
        ..add('alwaysRequireSignature')
        ..add(serializers.serialize(object.alwaysRequireSignature,
            specifiedType: const FullType(bool)));
    }
    if (object.allowSplitTender != null) {
      result
        ..add('allowSplitTender')
        ..add(serializers.serialize(object.allowSplitTender,
            specifiedType: const FullType(bool)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.additionalPaymentTypes != null) {
      result
        ..add('additionalPaymentTypes')
        ..add(serializers.serialize(object.additionalPaymentTypes,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AdditionalPaymentType)])));
    }
    if (object.tipSettings != null) {
      result
        ..add('tipSettings')
        ..add(serializers.serialize(object.tipSettings,
            specifiedType: const FullType(TipSettings)));
    }

    return result;
  }

  @override
  CheckoutParameters deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckoutParametersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'amountMoney':
          result.amountMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money)) as Money);
          break;
        case 'skipReceipt':
          result.skipReceipt = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'alwaysRequireSignature':
          result.alwaysRequireSignature = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'allowSplitTender':
          result.allowSplitTender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'additionalPaymentTypes':
          result.additionalPaymentTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AdditionalPaymentType)]))
              as BuiltList);
          break;
        case 'tipSettings':
          result.tipSettings.replace(serializers.deserialize(value,
              specifiedType: const FullType(TipSettings)) as TipSettings);
          break;
      }
    }

    return result.build();
  }
}

class _$TipSettingsSerializer implements StructuredSerializer<TipSettings> {
  @override
  final Iterable<Type> types = const [TipSettings, _$TipSettings];
  @override
  final String wireName = 'TipSettings';

  @override
  Iterable serialize(Serializers serializers, TipSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.showCustomTipField != null) {
      result
        ..add('showCustomTipField')
        ..add(serializers.serialize(object.showCustomTipField,
            specifiedType: const FullType(bool)));
    }
    if (object.showSeparateTipScreen != null) {
      result
        ..add('showSeparateTipScreen')
        ..add(serializers.serialize(object.showSeparateTipScreen,
            specifiedType: const FullType(bool)));
    }
    if (object.tipPercentages != null) {
      result
        ..add('tipPercentages')
        ..add(serializers.serialize(object.tipPercentages,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }

    return result;
  }

  @override
  TipSettings deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TipSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'showCustomTipField':
          result.showCustomTipField = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'showSeparateTipScreen':
          result.showSeparateTipScreen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'tipPercentages':
          result.tipPercentages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorCodeSerializer implements PrimitiveSerializer<ErrorCode> {
  static const Map<String, String> _toWire = const <String, String>{
    'usageError': 'USAGE_ERROR',
    'authorizeErrorNoNetwork': 'AUTHORIZE_NO_NETWORK',
    'checkoutErrorCanceled': 'CHECKOUT_CANCELED',
    'checkoutErrorSdkNotAuthorized': 'CHECKOUT_SDK_NOT_AUTHORIZED',
    'readerSettingsErrorSdkNotAuthorized': 'READER_SETTINGS_SDK_NOT_AUTHORIZED',
  };
  static const Map<String, String> _fromWire = const <String, String>{
    'USAGE_ERROR': 'usageError',
    'AUTHORIZE_NO_NETWORK': 'authorizeErrorNoNetwork',
    'CHECKOUT_CANCELED': 'checkoutErrorCanceled',
    'CHECKOUT_SDK_NOT_AUTHORIZED': 'checkoutErrorSdkNotAuthorized',
    'READER_SETTINGS_SDK_NOT_AUTHORIZED': 'readerSettingsErrorSdkNotAuthorized',
  };

  @override
  final Iterable<Type> types = const <Type>[ErrorCode];
  @override
  final String wireName = 'ErrorCode';

  @override
  Object serialize(Serializers serializers, ErrorCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ErrorCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ErrorCode.valueOf(_fromWire[serialized] ?? serialized as String);
}

class _$Money extends Money {
  @override
  final int amount;
  @override
  final String currencyCode;

  factory _$Money([void updates(MoneyBuilder b)]) =>
      (new MoneyBuilder()..update(updates)).build();

  _$Money._({this.amount, this.currencyCode}) : super._() {
    if (amount == null) {
      throw new BuiltValueNullFieldError('Money', 'amount');
    }
  }

  @override
  Money rebuild(void updates(MoneyBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MoneyBuilder toBuilder() => new MoneyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Money &&
        amount == other.amount &&
        currencyCode == other.currencyCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, amount.hashCode), currencyCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Money')
          ..add('amount', amount)
          ..add('currencyCode', currencyCode))
        .toString();
  }
}

class MoneyBuilder implements Builder<Money, MoneyBuilder> {
  _$Money _$v;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  String _currencyCode;
  String get currencyCode => _$this._currencyCode;
  set currencyCode(String currencyCode) => _$this._currencyCode = currencyCode;

  MoneyBuilder();

  MoneyBuilder get _$this {
    if (_$v != null) {
      _amount = _$v.amount;
      _currencyCode = _$v.currencyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Money other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Money;
  }

  @override
  void update(void updates(MoneyBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Money build() {
    final _$result =
        _$v ?? new _$Money._(amount: amount, currencyCode: currencyCode);
    replace(_$result);
    return _$result;
  }
}

class _$Location extends Location {
  @override
  final String currencyCode;
  @override
  final String businessName;
  @override
  final String name;
  @override
  final String locationId;
  @override
  final bool isCardProcessingActivated;
  @override
  final Money maximumCardPaymentAmountMoney;
  @override
  final Money minimumCardPaymentAmountMoney;

  factory _$Location([void updates(LocationBuilder b)]) =>
      (new LocationBuilder()..update(updates)).build();

  _$Location._(
      {this.currencyCode,
      this.businessName,
      this.name,
      this.locationId,
      this.isCardProcessingActivated,
      this.maximumCardPaymentAmountMoney,
      this.minimumCardPaymentAmountMoney})
      : super._() {
    if (currencyCode == null) {
      throw new BuiltValueNullFieldError('Location', 'currencyCode');
    }
    if (businessName == null) {
      throw new BuiltValueNullFieldError('Location', 'businessName');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Location', 'name');
    }
    if (locationId == null) {
      throw new BuiltValueNullFieldError('Location', 'locationId');
    }
    if (isCardProcessingActivated == null) {
      throw new BuiltValueNullFieldError(
          'Location', 'isCardProcessingActivated');
    }
    if (maximumCardPaymentAmountMoney == null) {
      throw new BuiltValueNullFieldError(
          'Location', 'maximumCardPaymentAmountMoney');
    }
    if (minimumCardPaymentAmountMoney == null) {
      throw new BuiltValueNullFieldError(
          'Location', 'minimumCardPaymentAmountMoney');
    }
  }

  @override
  Location rebuild(void updates(LocationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        currencyCode == other.currencyCode &&
        businessName == other.businessName &&
        name == other.name &&
        locationId == other.locationId &&
        isCardProcessingActivated == other.isCardProcessingActivated &&
        maximumCardPaymentAmountMoney == other.maximumCardPaymentAmountMoney &&
        minimumCardPaymentAmountMoney == other.minimumCardPaymentAmountMoney;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, currencyCode.hashCode),
                            businessName.hashCode),
                        name.hashCode),
                    locationId.hashCode),
                isCardProcessingActivated.hashCode),
            maximumCardPaymentAmountMoney.hashCode),
        minimumCardPaymentAmountMoney.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Location')
          ..add('currencyCode', currencyCode)
          ..add('businessName', businessName)
          ..add('name', name)
          ..add('locationId', locationId)
          ..add('isCardProcessingActivated', isCardProcessingActivated)
          ..add('maximumCardPaymentAmountMoney', maximumCardPaymentAmountMoney)
          ..add('minimumCardPaymentAmountMoney', minimumCardPaymentAmountMoney))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location _$v;

  String _currencyCode;
  String get currencyCode => _$this._currencyCode;
  set currencyCode(String currencyCode) => _$this._currencyCode = currencyCode;

  String _businessName;
  String get businessName => _$this._businessName;
  set businessName(String businessName) => _$this._businessName = businessName;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _locationId;
  String get locationId => _$this._locationId;
  set locationId(String locationId) => _$this._locationId = locationId;

  bool _isCardProcessingActivated;
  bool get isCardProcessingActivated => _$this._isCardProcessingActivated;
  set isCardProcessingActivated(bool isCardProcessingActivated) =>
      _$this._isCardProcessingActivated = isCardProcessingActivated;

  MoneyBuilder _maximumCardPaymentAmountMoney;
  MoneyBuilder get maximumCardPaymentAmountMoney =>
      _$this._maximumCardPaymentAmountMoney ??= new MoneyBuilder();
  set maximumCardPaymentAmountMoney(
          MoneyBuilder maximumCardPaymentAmountMoney) =>
      _$this._maximumCardPaymentAmountMoney = maximumCardPaymentAmountMoney;

  MoneyBuilder _minimumCardPaymentAmountMoney;
  MoneyBuilder get minimumCardPaymentAmountMoney =>
      _$this._minimumCardPaymentAmountMoney ??= new MoneyBuilder();
  set minimumCardPaymentAmountMoney(
          MoneyBuilder minimumCardPaymentAmountMoney) =>
      _$this._minimumCardPaymentAmountMoney = minimumCardPaymentAmountMoney;

  LocationBuilder();

  LocationBuilder get _$this {
    if (_$v != null) {
      _currencyCode = _$v.currencyCode;
      _businessName = _$v.businessName;
      _name = _$v.name;
      _locationId = _$v.locationId;
      _isCardProcessingActivated = _$v.isCardProcessingActivated;
      _maximumCardPaymentAmountMoney =
          _$v.maximumCardPaymentAmountMoney?.toBuilder();
      _minimumCardPaymentAmountMoney =
          _$v.minimumCardPaymentAmountMoney?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Location;
  }

  @override
  void update(void updates(LocationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Location build() {
    _$Location _$result;
    try {
      _$result = _$v ??
          new _$Location._(
              currencyCode: currencyCode,
              businessName: businessName,
              name: name,
              locationId: locationId,
              isCardProcessingActivated: isCardProcessingActivated,
              maximumCardPaymentAmountMoney:
                  maximumCardPaymentAmountMoney.build(),
              minimumCardPaymentAmountMoney:
                  minimumCardPaymentAmountMoney.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'maximumCardPaymentAmountMoney';
        maximumCardPaymentAmountMoney.build();
        _$failedField = 'minimumCardPaymentAmountMoney';
        minimumCardPaymentAmountMoney.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Location', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CheckoutResult extends CheckoutResult {
  @override
  final String transactionId;
  @override
  final String transactionClientId;
  @override
  final String locationId;
  @override
  final String createdAt;
  @override
  final Money totalMoney;
  @override
  final Money totalTipMoney;
  @override
  final BuiltList<Tender> tenders;

  factory _$CheckoutResult([void updates(CheckoutResultBuilder b)]) =>
      (new CheckoutResultBuilder()..update(updates)).build();

  _$CheckoutResult._(
      {this.transactionId,
      this.transactionClientId,
      this.locationId,
      this.createdAt,
      this.totalMoney,
      this.totalTipMoney,
      this.tenders})
      : super._() {
    if (transactionClientId == null) {
      throw new BuiltValueNullFieldError(
          'CheckoutResult', 'transactionClientId');
    }
    if (locationId == null) {
      throw new BuiltValueNullFieldError('CheckoutResult', 'locationId');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('CheckoutResult', 'createdAt');
    }
    if (totalMoney == null) {
      throw new BuiltValueNullFieldError('CheckoutResult', 'totalMoney');
    }
    if (totalTipMoney == null) {
      throw new BuiltValueNullFieldError('CheckoutResult', 'totalTipMoney');
    }
    if (tenders == null) {
      throw new BuiltValueNullFieldError('CheckoutResult', 'tenders');
    }
  }

  @override
  CheckoutResult rebuild(void updates(CheckoutResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutResultBuilder toBuilder() =>
      new CheckoutResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutResult &&
        transactionId == other.transactionId &&
        transactionClientId == other.transactionClientId &&
        locationId == other.locationId &&
        createdAt == other.createdAt &&
        totalMoney == other.totalMoney &&
        totalTipMoney == other.totalTipMoney &&
        tenders == other.tenders;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, transactionId.hashCode),
                            transactionClientId.hashCode),
                        locationId.hashCode),
                    createdAt.hashCode),
                totalMoney.hashCode),
            totalTipMoney.hashCode),
        tenders.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CheckoutResult')
          ..add('transactionId', transactionId)
          ..add('transactionClientId', transactionClientId)
          ..add('locationId', locationId)
          ..add('createdAt', createdAt)
          ..add('totalMoney', totalMoney)
          ..add('totalTipMoney', totalTipMoney)
          ..add('tenders', tenders))
        .toString();
  }
}

class CheckoutResultBuilder
    implements Builder<CheckoutResult, CheckoutResultBuilder> {
  _$CheckoutResult _$v;

  String _transactionId;
  String get transactionId => _$this._transactionId;
  set transactionId(String transactionId) =>
      _$this._transactionId = transactionId;

  String _transactionClientId;
  String get transactionClientId => _$this._transactionClientId;
  set transactionClientId(String transactionClientId) =>
      _$this._transactionClientId = transactionClientId;

  String _locationId;
  String get locationId => _$this._locationId;
  set locationId(String locationId) => _$this._locationId = locationId;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  MoneyBuilder _totalMoney;
  MoneyBuilder get totalMoney => _$this._totalMoney ??= new MoneyBuilder();
  set totalMoney(MoneyBuilder totalMoney) => _$this._totalMoney = totalMoney;

  MoneyBuilder _totalTipMoney;
  MoneyBuilder get totalTipMoney =>
      _$this._totalTipMoney ??= new MoneyBuilder();
  set totalTipMoney(MoneyBuilder totalTipMoney) =>
      _$this._totalTipMoney = totalTipMoney;

  ListBuilder<Tender> _tenders;
  ListBuilder<Tender> get tenders =>
      _$this._tenders ??= new ListBuilder<Tender>();
  set tenders(ListBuilder<Tender> tenders) => _$this._tenders = tenders;

  CheckoutResultBuilder();

  CheckoutResultBuilder get _$this {
    if (_$v != null) {
      _transactionId = _$v.transactionId;
      _transactionClientId = _$v.transactionClientId;
      _locationId = _$v.locationId;
      _createdAt = _$v.createdAt;
      _totalMoney = _$v.totalMoney?.toBuilder();
      _totalTipMoney = _$v.totalTipMoney?.toBuilder();
      _tenders = _$v.tenders?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CheckoutResult;
  }

  @override
  void update(void updates(CheckoutResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckoutResult build() {
    _$CheckoutResult _$result;
    try {
      _$result = _$v ??
          new _$CheckoutResult._(
              transactionId: transactionId,
              transactionClientId: transactionClientId,
              locationId: locationId,
              createdAt: createdAt,
              totalMoney: totalMoney.build(),
              totalTipMoney: totalTipMoney.build(),
              tenders: tenders.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'totalMoney';
        totalMoney.build();
        _$failedField = 'totalTipMoney';
        totalTipMoney.build();
        _$failedField = 'tenders';
        tenders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CheckoutResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Tender extends Tender {
  @override
  final Money totalMoney;
  @override
  final Money tipMoney;
  @override
  final TenderType type;
  @override
  final String tenderId;
  @override
  final String createdAt;
  @override
  final CardDetails cardDetails;
  @override
  final CashDetails cashDetails;

  factory _$Tender([void updates(TenderBuilder b)]) =>
      (new TenderBuilder()..update(updates)).build();

  _$Tender._(
      {this.totalMoney,
      this.tipMoney,
      this.type,
      this.tenderId,
      this.createdAt,
      this.cardDetails,
      this.cashDetails})
      : super._() {
    if (totalMoney == null) {
      throw new BuiltValueNullFieldError('Tender', 'totalMoney');
    }
    if (tipMoney == null) {
      throw new BuiltValueNullFieldError('Tender', 'tipMoney');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Tender', 'type');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Tender', 'createdAt');
    }
  }

  @override
  Tender rebuild(void updates(TenderBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TenderBuilder toBuilder() => new TenderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tender &&
        totalMoney == other.totalMoney &&
        tipMoney == other.tipMoney &&
        type == other.type &&
        tenderId == other.tenderId &&
        createdAt == other.createdAt &&
        cardDetails == other.cardDetails &&
        cashDetails == other.cashDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, totalMoney.hashCode), tipMoney.hashCode),
                        type.hashCode),
                    tenderId.hashCode),
                createdAt.hashCode),
            cardDetails.hashCode),
        cashDetails.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tender')
          ..add('totalMoney', totalMoney)
          ..add('tipMoney', tipMoney)
          ..add('type', type)
          ..add('tenderId', tenderId)
          ..add('createdAt', createdAt)
          ..add('cardDetails', cardDetails)
          ..add('cashDetails', cashDetails))
        .toString();
  }
}

class TenderBuilder implements Builder<Tender, TenderBuilder> {
  _$Tender _$v;

  MoneyBuilder _totalMoney;
  MoneyBuilder get totalMoney => _$this._totalMoney ??= new MoneyBuilder();
  set totalMoney(MoneyBuilder totalMoney) => _$this._totalMoney = totalMoney;

  MoneyBuilder _tipMoney;
  MoneyBuilder get tipMoney => _$this._tipMoney ??= new MoneyBuilder();
  set tipMoney(MoneyBuilder tipMoney) => _$this._tipMoney = tipMoney;

  TenderType _type;
  TenderType get type => _$this._type;
  set type(TenderType type) => _$this._type = type;

  String _tenderId;
  String get tenderId => _$this._tenderId;
  set tenderId(String tenderId) => _$this._tenderId = tenderId;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  CardDetailsBuilder _cardDetails;
  CardDetailsBuilder get cardDetails =>
      _$this._cardDetails ??= new CardDetailsBuilder();
  set cardDetails(CardDetailsBuilder cardDetails) =>
      _$this._cardDetails = cardDetails;

  CashDetailsBuilder _cashDetails;
  CashDetailsBuilder get cashDetails =>
      _$this._cashDetails ??= new CashDetailsBuilder();
  set cashDetails(CashDetailsBuilder cashDetails) =>
      _$this._cashDetails = cashDetails;

  TenderBuilder();

  TenderBuilder get _$this {
    if (_$v != null) {
      _totalMoney = _$v.totalMoney?.toBuilder();
      _tipMoney = _$v.tipMoney?.toBuilder();
      _type = _$v.type;
      _tenderId = _$v.tenderId;
      _createdAt = _$v.createdAt;
      _cardDetails = _$v.cardDetails?.toBuilder();
      _cashDetails = _$v.cashDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tender other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Tender;
  }

  @override
  void update(void updates(TenderBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Tender build() {
    _$Tender _$result;
    try {
      _$result = _$v ??
          new _$Tender._(
              totalMoney: totalMoney.build(),
              tipMoney: tipMoney.build(),
              type: type,
              tenderId: tenderId,
              createdAt: createdAt,
              cardDetails: _cardDetails?.build(),
              cashDetails: _cashDetails?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'totalMoney';
        totalMoney.build();
        _$failedField = 'tipMoney';
        tipMoney.build();

        _$failedField = 'cardDetails';
        _cardDetails?.build();
        _$failedField = 'cashDetails';
        _cashDetails?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Tender', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CashDetails extends CashDetails {
  @override
  final Money buyerTenderedMoney;
  @override
  final Money changeBackMoney;

  factory _$CashDetails([void updates(CashDetailsBuilder b)]) =>
      (new CashDetailsBuilder()..update(updates)).build();

  _$CashDetails._({this.buyerTenderedMoney, this.changeBackMoney}) : super._() {
    if (buyerTenderedMoney == null) {
      throw new BuiltValueNullFieldError('CashDetails', 'buyerTenderedMoney');
    }
    if (changeBackMoney == null) {
      throw new BuiltValueNullFieldError('CashDetails', 'changeBackMoney');
    }
  }

  @override
  CashDetails rebuild(void updates(CashDetailsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CashDetailsBuilder toBuilder() => new CashDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CashDetails &&
        buyerTenderedMoney == other.buyerTenderedMoney &&
        changeBackMoney == other.changeBackMoney;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, buyerTenderedMoney.hashCode), changeBackMoney.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CashDetails')
          ..add('buyerTenderedMoney', buyerTenderedMoney)
          ..add('changeBackMoney', changeBackMoney))
        .toString();
  }
}

class CashDetailsBuilder implements Builder<CashDetails, CashDetailsBuilder> {
  _$CashDetails _$v;

  MoneyBuilder _buyerTenderedMoney;
  MoneyBuilder get buyerTenderedMoney =>
      _$this._buyerTenderedMoney ??= new MoneyBuilder();
  set buyerTenderedMoney(MoneyBuilder buyerTenderedMoney) =>
      _$this._buyerTenderedMoney = buyerTenderedMoney;

  MoneyBuilder _changeBackMoney;
  MoneyBuilder get changeBackMoney =>
      _$this._changeBackMoney ??= new MoneyBuilder();
  set changeBackMoney(MoneyBuilder changeBackMoney) =>
      _$this._changeBackMoney = changeBackMoney;

  CashDetailsBuilder();

  CashDetailsBuilder get _$this {
    if (_$v != null) {
      _buyerTenderedMoney = _$v.buyerTenderedMoney?.toBuilder();
      _changeBackMoney = _$v.changeBackMoney?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CashDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CashDetails;
  }

  @override
  void update(void updates(CashDetailsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CashDetails build() {
    _$CashDetails _$result;
    try {
      _$result = _$v ??
          new _$CashDetails._(
              buyerTenderedMoney: buyerTenderedMoney.build(),
              changeBackMoney: changeBackMoney.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'buyerTenderedMoney';
        buyerTenderedMoney.build();
        _$failedField = 'changeBackMoney';
        changeBackMoney.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CashDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CardDetails extends CardDetails {
  @override
  final EntryMethod entryMethod;
  @override
  final Card card;

  factory _$CardDetails([void updates(CardDetailsBuilder b)]) =>
      (new CardDetailsBuilder()..update(updates)).build();

  _$CardDetails._({this.entryMethod, this.card}) : super._() {
    if (entryMethod == null) {
      throw new BuiltValueNullFieldError('CardDetails', 'entryMethod');
    }
    if (card == null) {
      throw new BuiltValueNullFieldError('CardDetails', 'card');
    }
  }

  @override
  CardDetails rebuild(void updates(CardDetailsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CardDetailsBuilder toBuilder() => new CardDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardDetails &&
        entryMethod == other.entryMethod &&
        card == other.card;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, entryMethod.hashCode), card.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardDetails')
          ..add('entryMethod', entryMethod)
          ..add('card', card))
        .toString();
  }
}

class CardDetailsBuilder implements Builder<CardDetails, CardDetailsBuilder> {
  _$CardDetails _$v;

  EntryMethod _entryMethod;
  EntryMethod get entryMethod => _$this._entryMethod;
  set entryMethod(EntryMethod entryMethod) => _$this._entryMethod = entryMethod;

  CardBuilder _card;
  CardBuilder get card => _$this._card ??= new CardBuilder();
  set card(CardBuilder card) => _$this._card = card;

  CardDetailsBuilder();

  CardDetailsBuilder get _$this {
    if (_$v != null) {
      _entryMethod = _$v.entryMethod;
      _card = _$v.card?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CardDetails;
  }

  @override
  void update(void updates(CardDetailsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CardDetails build() {
    _$CardDetails _$result;
    try {
      _$result = _$v ??
          new _$CardDetails._(entryMethod: entryMethod, card: card.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'card';
        card.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CardDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Card extends Card {
  @override
  final Brand brand;
  @override
  final String lastFourDigits;

  factory _$Card([void updates(CardBuilder b)]) =>
      (new CardBuilder()..update(updates)).build();

  _$Card._({this.brand, this.lastFourDigits}) : super._() {
    if (brand == null) {
      throw new BuiltValueNullFieldError('Card', 'brand');
    }
    if (lastFourDigits == null) {
      throw new BuiltValueNullFieldError('Card', 'lastFourDigits');
    }
  }

  @override
  Card rebuild(void updates(CardBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CardBuilder toBuilder() => new CardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Card &&
        brand == other.brand &&
        lastFourDigits == other.lastFourDigits;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, brand.hashCode), lastFourDigits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Card')
          ..add('brand', brand)
          ..add('lastFourDigits', lastFourDigits))
        .toString();
  }
}

class CardBuilder implements Builder<Card, CardBuilder> {
  _$Card _$v;

  Brand _brand;
  Brand get brand => _$this._brand;
  set brand(Brand brand) => _$this._brand = brand;

  String _lastFourDigits;
  String get lastFourDigits => _$this._lastFourDigits;
  set lastFourDigits(String lastFourDigits) =>
      _$this._lastFourDigits = lastFourDigits;

  CardBuilder();

  CardBuilder get _$this {
    if (_$v != null) {
      _brand = _$v.brand;
      _lastFourDigits = _$v.lastFourDigits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Card other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Card;
  }

  @override
  void update(void updates(CardBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Card build() {
    final _$result =
        _$v ?? new _$Card._(brand: brand, lastFourDigits: lastFourDigits);
    replace(_$result);
    return _$result;
  }
}

class _$CheckoutParameters extends CheckoutParameters {
  @override
  final Money amountMoney;
  @override
  final bool skipReceipt;
  @override
  final bool alwaysRequireSignature;
  @override
  final bool allowSplitTender;
  @override
  final String note;
  @override
  final BuiltList<AdditionalPaymentType> additionalPaymentTypes;
  @override
  final TipSettings tipSettings;

  factory _$CheckoutParameters([void updates(CheckoutParametersBuilder b)]) =>
      (new CheckoutParametersBuilder()..update(updates)).build();

  _$CheckoutParameters._(
      {this.amountMoney,
      this.skipReceipt,
      this.alwaysRequireSignature,
      this.allowSplitTender,
      this.note,
      this.additionalPaymentTypes,
      this.tipSettings})
      : super._() {
    if (amountMoney == null) {
      throw new BuiltValueNullFieldError('CheckoutParameters', 'amountMoney');
    }
  }

  @override
  CheckoutParameters rebuild(void updates(CheckoutParametersBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutParametersBuilder toBuilder() =>
      new CheckoutParametersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutParameters &&
        amountMoney == other.amountMoney &&
        skipReceipt == other.skipReceipt &&
        alwaysRequireSignature == other.alwaysRequireSignature &&
        allowSplitTender == other.allowSplitTender &&
        note == other.note &&
        additionalPaymentTypes == other.additionalPaymentTypes &&
        tipSettings == other.tipSettings;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, amountMoney.hashCode), skipReceipt.hashCode),
                        alwaysRequireSignature.hashCode),
                    allowSplitTender.hashCode),
                note.hashCode),
            additionalPaymentTypes.hashCode),
        tipSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CheckoutParameters')
          ..add('amountMoney', amountMoney)
          ..add('skipReceipt', skipReceipt)
          ..add('alwaysRequireSignature', alwaysRequireSignature)
          ..add('allowSplitTender', allowSplitTender)
          ..add('note', note)
          ..add('additionalPaymentTypes', additionalPaymentTypes)
          ..add('tipSettings', tipSettings))
        .toString();
  }
}

class CheckoutParametersBuilder
    implements Builder<CheckoutParameters, CheckoutParametersBuilder> {
  _$CheckoutParameters _$v;

  MoneyBuilder _amountMoney;
  MoneyBuilder get amountMoney => _$this._amountMoney ??= new MoneyBuilder();
  set amountMoney(MoneyBuilder amountMoney) =>
      _$this._amountMoney = amountMoney;

  bool _skipReceipt;
  bool get skipReceipt => _$this._skipReceipt;
  set skipReceipt(bool skipReceipt) => _$this._skipReceipt = skipReceipt;

  bool _alwaysRequireSignature;
  bool get alwaysRequireSignature => _$this._alwaysRequireSignature;
  set alwaysRequireSignature(bool alwaysRequireSignature) =>
      _$this._alwaysRequireSignature = alwaysRequireSignature;

  bool _allowSplitTender;
  bool get allowSplitTender => _$this._allowSplitTender;
  set allowSplitTender(bool allowSplitTender) =>
      _$this._allowSplitTender = allowSplitTender;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  ListBuilder<AdditionalPaymentType> _additionalPaymentTypes;
  ListBuilder<AdditionalPaymentType> get additionalPaymentTypes =>
      _$this._additionalPaymentTypes ??=
          new ListBuilder<AdditionalPaymentType>();
  set additionalPaymentTypes(
          ListBuilder<AdditionalPaymentType> additionalPaymentTypes) =>
      _$this._additionalPaymentTypes = additionalPaymentTypes;

  TipSettingsBuilder _tipSettings;
  TipSettingsBuilder get tipSettings =>
      _$this._tipSettings ??= new TipSettingsBuilder();
  set tipSettings(TipSettingsBuilder tipSettings) =>
      _$this._tipSettings = tipSettings;

  CheckoutParametersBuilder();

  CheckoutParametersBuilder get _$this {
    if (_$v != null) {
      _amountMoney = _$v.amountMoney?.toBuilder();
      _skipReceipt = _$v.skipReceipt;
      _alwaysRequireSignature = _$v.alwaysRequireSignature;
      _allowSplitTender = _$v.allowSplitTender;
      _note = _$v.note;
      _additionalPaymentTypes = _$v.additionalPaymentTypes?.toBuilder();
      _tipSettings = _$v.tipSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutParameters other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CheckoutParameters;
  }

  @override
  void update(void updates(CheckoutParametersBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckoutParameters build() {
    _$CheckoutParameters _$result;
    try {
      _$result = _$v ??
          new _$CheckoutParameters._(
              amountMoney: amountMoney.build(),
              skipReceipt: skipReceipt,
              alwaysRequireSignature: alwaysRequireSignature,
              allowSplitTender: allowSplitTender,
              note: note,
              additionalPaymentTypes: _additionalPaymentTypes?.build(),
              tipSettings: _tipSettings?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'amountMoney';
        amountMoney.build();

        _$failedField = 'additionalPaymentTypes';
        _additionalPaymentTypes?.build();
        _$failedField = 'tipSettings';
        _tipSettings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CheckoutParameters', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TipSettings extends TipSettings {
  @override
  final bool showCustomTipField;
  @override
  final bool showSeparateTipScreen;
  @override
  final BuiltList<int> tipPercentages;

  factory _$TipSettings([void updates(TipSettingsBuilder b)]) =>
      (new TipSettingsBuilder()..update(updates)).build();

  _$TipSettings._(
      {this.showCustomTipField,
      this.showSeparateTipScreen,
      this.tipPercentages})
      : super._();

  @override
  TipSettings rebuild(void updates(TipSettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TipSettingsBuilder toBuilder() => new TipSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TipSettings &&
        showCustomTipField == other.showCustomTipField &&
        showSeparateTipScreen == other.showSeparateTipScreen &&
        tipPercentages == other.tipPercentages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, showCustomTipField.hashCode),
            showSeparateTipScreen.hashCode),
        tipPercentages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TipSettings')
          ..add('showCustomTipField', showCustomTipField)
          ..add('showSeparateTipScreen', showSeparateTipScreen)
          ..add('tipPercentages', tipPercentages))
        .toString();
  }
}

class TipSettingsBuilder implements Builder<TipSettings, TipSettingsBuilder> {
  _$TipSettings _$v;

  bool _showCustomTipField;
  bool get showCustomTipField => _$this._showCustomTipField;
  set showCustomTipField(bool showCustomTipField) =>
      _$this._showCustomTipField = showCustomTipField;

  bool _showSeparateTipScreen;
  bool get showSeparateTipScreen => _$this._showSeparateTipScreen;
  set showSeparateTipScreen(bool showSeparateTipScreen) =>
      _$this._showSeparateTipScreen = showSeparateTipScreen;

  ListBuilder<int> _tipPercentages;
  ListBuilder<int> get tipPercentages =>
      _$this._tipPercentages ??= new ListBuilder<int>();
  set tipPercentages(ListBuilder<int> tipPercentages) =>
      _$this._tipPercentages = tipPercentages;

  TipSettingsBuilder();

  TipSettingsBuilder get _$this {
    if (_$v != null) {
      _showCustomTipField = _$v.showCustomTipField;
      _showSeparateTipScreen = _$v.showSeparateTipScreen;
      _tipPercentages = _$v.tipPercentages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TipSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TipSettings;
  }

  @override
  void update(void updates(TipSettingsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TipSettings build() {
    _$TipSettings _$result;
    try {
      _$result = _$v ??
          new _$TipSettings._(
              showCustomTipField: showCustomTipField,
              showSeparateTipScreen: showSeparateTipScreen,
              tipPercentages: _tipPercentages?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tipPercentages';
        _tipPercentages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TipSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
