// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
const Brand _$jCB = const Brand._('jcb');
const Brand _$chinaUnionPay = const Brand._('chinaUnionPay');
const Brand _$squareGiftCard = const Brand._('squareGiftCard');
const Brand _$eftpos = const Brand._('eftpos');

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
    case 'jcb':
      return _$jCB;
    case 'chinaUnionPay':
      return _$chinaUnionPay;
    case 'squareGiftCard':
      return _$squareGiftCard;
    case 'eftpos':
      return _$eftpos;
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
  _$eftpos,
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
const ErrorCode _$storeCustomerErrorCanceled =
    const ErrorCode._('storeCustomerErrorCanceled');
const ErrorCode _$storeCustomerErrorInvalidCustomerId =
    const ErrorCode._('storeCustomerErrorInvalidCustomerId');
const ErrorCode _$storeCustomerErrorSdkNotAuthorized =
    const ErrorCode._('storeCustomerErrorSdkNotAuthorized');
const ErrorCode _$storeCustomerErrorNoNetwork =
    const ErrorCode._('storeCustomerErrorNoNetwork');

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
    case 'storeCustomerErrorCanceled':
      return _$storeCustomerErrorCanceled;
    case 'storeCustomerErrorInvalidCustomerId':
      return _$storeCustomerErrorInvalidCustomerId;
    case 'storeCustomerErrorSdkNotAuthorized':
      return _$storeCustomerErrorSdkNotAuthorized;
    case 'storeCustomerErrorNoNetwork':
      return _$storeCustomerErrorNoNetwork;
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
  _$storeCustomerErrorCanceled,
  _$storeCustomerErrorInvalidCustomerId,
  _$storeCustomerErrorSdkNotAuthorized,
  _$storeCustomerErrorNoNetwork,
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
  Iterable<Object?> serialize(Serializers serializers, Money object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'amount',
      serializers.serialize(object.amount, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.currencyCode;
    if (value != null) {
      result
        ..add('currencyCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Money deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoneyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
  Iterable<Object?> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
  Location deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'minimumCardPaymentAmountMoney':
          result.minimumCardPaymentAmountMoney.replace(serializers.deserialize(
              value,
              specifiedType: const FullType(Money))! as Money);
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
  Iterable<Object?> serialize(Serializers serializers, CheckoutResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    Object? value;
    value = object.transactionId;
    if (value != null) {
      result
        ..add('transactionId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CheckoutResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckoutResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'totalTipMoney':
          result.totalTipMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'tenders':
          result.tenders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Tender)]))!
              as BuiltList<Object>);
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
  Iterable<Object?> serialize(Serializers serializers, Tender object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    Object? value;
    value = object.tenderId;
    if (value != null) {
      result
        ..add('tenderId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cardDetails;
    if (value != null) {
      result
        ..add('cardDetails')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CardDetails)));
    }
    value = object.cashDetails;
    if (value != null) {
      result
        ..add('cashDetails')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CashDetails)));
    }
    return result;
  }

  @override
  Tender deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TenderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'totalMoney':
          result.totalMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'tipMoney':
          result.tipMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
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
              specifiedType: const FullType(CardDetails))! as CardDetails);
          break;
        case 'cashDetails':
          result.cashDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(CashDetails))! as CashDetails);
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
  Iterable<Object?> serialize(Serializers serializers, CashDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
  CashDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CashDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'buyerTenderedMoney':
          result.buyerTenderedMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'changeBackMoney':
          result.changeBackMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryMethodSerializer implements PrimitiveSerializer<EntryMethod> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'chip': 'CHIP',
    'contactless': 'CONTACTLESS',
    'manuallyEntered': 'MANUALLY_ENTERED',
    'swipe': 'SWIPE',
    'unknown': 'UNKNOWN',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
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
  Iterable<Object?> serialize(Serializers serializers, CardDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entryMethod',
      serializers.serialize(object.entryMethod,
          specifiedType: const FullType(EntryMethod)),
      'card',
      serializers.serialize(object.card, specifiedType: const FullType(Card)),
    ];

    return result;
  }

  @override
  CardDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entryMethod':
          result.entryMethod = serializers.deserialize(value,
              specifiedType: const FullType(EntryMethod)) as EntryMethod;
          break;
        case 'card':
          result.card.replace(serializers.deserialize(value,
              specifiedType: const FullType(Card))! as Card);
          break;
      }
    }

    return result.build();
  }
}

class _$BrandSerializer implements PrimitiveSerializer<Brand> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'otherBrand': 'OTHER_BRAND',
    'visa': 'VISA',
    'mastercard': 'MASTERCARD',
    'americanExpress': 'AMERICAN_EXPRESS',
    'discover': 'DISCOVER',
    'discoverDiners': 'DISCOVER_DINERS',
    'interac': 'INTERAC',
    'jcb': 'JCB',
    'chinaUnionPay': 'CHINA_UNION_PAY',
    'squareGiftCard': 'SQUARE_GIFT_CARD',
    'eftpos': 'EFTPOS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'OTHER_BRAND': 'otherBrand',
    'VISA': 'visa',
    'MASTERCARD': 'mastercard',
    'AMERICAN_EXPRESS': 'americanExpress',
    'DISCOVER': 'discover',
    'DISCOVER_DINERS': 'discoverDiners',
    'INTERAC': 'interac',
    'JCB': 'jcb',
    'CHINA_UNION_PAY': 'chinaUnionPay',
    'SQUARE_GIFT_CARD': 'squareGiftCard',
    'EFTPOS': 'eftpos',
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
  Iterable<Object?> serialize(Serializers serializers, Card object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'brand',
      serializers.serialize(object.brand, specifiedType: const FullType(Brand)),
      'lastFourDigits',
      serializers.serialize(object.lastFourDigits,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.expirationMonth;
    if (value != null) {
      result
        ..add('expirationMonth')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.expirationYear;
    if (value != null) {
      result
        ..add('expirationYear')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cardholderName;
    if (value != null) {
      result
        ..add('cardholderName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Card deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(Brand)) as Brand;
          break;
        case 'lastFourDigits':
          result.lastFourDigits = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expirationMonth':
          result.expirationMonth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'expirationYear':
          result.expirationYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cardholderName':
          result.cardholderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AdditionalPaymentTypeSerializer
    implements PrimitiveSerializer<AdditionalPaymentType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'manualCardEntry': 'manual_card_entry',
    'cash': 'cash',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
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
  Iterable<Object?> serialize(
      Serializers serializers, CheckoutParameters object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'amountMoney',
      serializers.serialize(object.amountMoney,
          specifiedType: const FullType(Money)),
    ];
    Object? value;
    value = object.skipReceipt;
    if (value != null) {
      result
        ..add('skipReceipt')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.collectSignature;
    if (value != null) {
      result
        ..add('collectSignature')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.allowSplitTender;
    if (value != null) {
      result
        ..add('allowSplitTender')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.delayCapture;
    if (value != null) {
      result
        ..add('delayCapture')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.additionalPaymentTypes;
    if (value != null) {
      result
        ..add('additionalPaymentTypes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AdditionalPaymentType)])));
    }
    value = object.tipSettings;
    if (value != null) {
      result
        ..add('tipSettings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TipSettings)));
    }
    return result;
  }

  @override
  CheckoutParameters deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckoutParametersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'amountMoney':
          result.amountMoney.replace(serializers.deserialize(value,
              specifiedType: const FullType(Money))! as Money);
          break;
        case 'skipReceipt':
          result.skipReceipt = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'collectSignature':
          result.collectSignature = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'allowSplitTender':
          result.allowSplitTender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'delayCapture':
          result.delayCapture = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'additionalPaymentTypes':
          result.additionalPaymentTypes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(AdditionalPaymentType)
              ]))! as BuiltList<Object>);
          break;
        case 'tipSettings':
          result.tipSettings.replace(serializers.deserialize(value,
              specifiedType: const FullType(TipSettings))! as TipSettings);
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
  Iterable<Object?> serialize(Serializers serializers, TipSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.showCustomTipField;
    if (value != null) {
      result
        ..add('showCustomTipField')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.showSeparateTipScreen;
    if (value != null) {
      result
        ..add('showSeparateTipScreen')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tipPercentages;
    if (value != null) {
      result
        ..add('tipPercentages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  TipSettings deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TipSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorCodeSerializer implements PrimitiveSerializer<ErrorCode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'usageError': 'USAGE_ERROR',
    'authorizeErrorNoNetwork': 'AUTHORIZE_NO_NETWORK',
    'checkoutErrorCanceled': 'CHECKOUT_CANCELED',
    'checkoutErrorSdkNotAuthorized': 'CHECKOUT_SDK_NOT_AUTHORIZED',
    'readerSettingsErrorSdkNotAuthorized': 'READER_SETTINGS_SDK_NOT_AUTHORIZED',
    'storeCustomerErrorCanceled': 'STORE_CUSTOMER_CARD_CANCELED',
    'storeCustomerErrorInvalidCustomerId':
        'STORE_CUSTOMER_CARD_INVALID_CUSTOMER_ID',
    'storeCustomerErrorSdkNotAuthorized':
        'STORE_CUSTOMER_CARD_SDK_NOT_AUTHORIZED',
    'storeCustomerErrorNoNetwork': 'STORE_CUSTOMER_CARD_NO_NETWORK',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'USAGE_ERROR': 'usageError',
    'AUTHORIZE_NO_NETWORK': 'authorizeErrorNoNetwork',
    'CHECKOUT_CANCELED': 'checkoutErrorCanceled',
    'CHECKOUT_SDK_NOT_AUTHORIZED': 'checkoutErrorSdkNotAuthorized',
    'READER_SETTINGS_SDK_NOT_AUTHORIZED': 'readerSettingsErrorSdkNotAuthorized',
    'STORE_CUSTOMER_CARD_CANCELED': 'storeCustomerErrorCanceled',
    'STORE_CUSTOMER_CARD_INVALID_CUSTOMER_ID':
        'storeCustomerErrorInvalidCustomerId',
    'STORE_CUSTOMER_CARD_SDK_NOT_AUTHORIZED':
        'storeCustomerErrorSdkNotAuthorized',
    'STORE_CUSTOMER_CARD_NO_NETWORK': 'storeCustomerErrorNoNetwork',
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
  final String? currencyCode;

  factory _$Money([void Function(MoneyBuilder)? updates]) =>
      (new MoneyBuilder()..update(updates)).build();

  _$Money._({required this.amount, this.currencyCode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(amount, 'Money', 'amount');
  }

  @override
  Money rebuild(void Function(MoneyBuilder) updates) =>
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
  _$Money? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  MoneyBuilder();

  MoneyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _currencyCode = $v.currencyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Money other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Money;
  }

  @override
  void update(void Function(MoneyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Money build() {
    final _$result = _$v ??
        new _$Money._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, 'Money', 'amount'),
            currencyCode: currencyCode);
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

  factory _$Location([void Function(LocationBuilder)? updates]) =>
      (new LocationBuilder()..update(updates)).build();

  _$Location._(
      {required this.currencyCode,
      required this.businessName,
      required this.name,
      required this.locationId,
      required this.isCardProcessingActivated,
      required this.maximumCardPaymentAmountMoney,
      required this.minimumCardPaymentAmountMoney})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        currencyCode, 'Location', 'currencyCode');
    BuiltValueNullFieldError.checkNotNull(
        businessName, 'Location', 'businessName');
    BuiltValueNullFieldError.checkNotNull(name, 'Location', 'name');
    BuiltValueNullFieldError.checkNotNull(locationId, 'Location', 'locationId');
    BuiltValueNullFieldError.checkNotNull(
        isCardProcessingActivated, 'Location', 'isCardProcessingActivated');
    BuiltValueNullFieldError.checkNotNull(maximumCardPaymentAmountMoney,
        'Location', 'maximumCardPaymentAmountMoney');
    BuiltValueNullFieldError.checkNotNull(minimumCardPaymentAmountMoney,
        'Location', 'minimumCardPaymentAmountMoney');
  }

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
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
  _$Location? _$v;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _businessName;
  String? get businessName => _$this._businessName;
  set businessName(String? businessName) => _$this._businessName = businessName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _locationId;
  String? get locationId => _$this._locationId;
  set locationId(String? locationId) => _$this._locationId = locationId;

  bool? _isCardProcessingActivated;
  bool? get isCardProcessingActivated => _$this._isCardProcessingActivated;
  set isCardProcessingActivated(bool? isCardProcessingActivated) =>
      _$this._isCardProcessingActivated = isCardProcessingActivated;

  MoneyBuilder? _maximumCardPaymentAmountMoney;
  MoneyBuilder get maximumCardPaymentAmountMoney =>
      _$this._maximumCardPaymentAmountMoney ??= new MoneyBuilder();
  set maximumCardPaymentAmountMoney(
          MoneyBuilder? maximumCardPaymentAmountMoney) =>
      _$this._maximumCardPaymentAmountMoney = maximumCardPaymentAmountMoney;

  MoneyBuilder? _minimumCardPaymentAmountMoney;
  MoneyBuilder get minimumCardPaymentAmountMoney =>
      _$this._minimumCardPaymentAmountMoney ??= new MoneyBuilder();
  set minimumCardPaymentAmountMoney(
          MoneyBuilder? minimumCardPaymentAmountMoney) =>
      _$this._minimumCardPaymentAmountMoney = minimumCardPaymentAmountMoney;

  LocationBuilder();

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _businessName = $v.businessName;
      _name = $v.name;
      _locationId = $v.locationId;
      _isCardProcessingActivated = $v.isCardProcessingActivated;
      _maximumCardPaymentAmountMoney =
          $v.maximumCardPaymentAmountMoney.toBuilder();
      _minimumCardPaymentAmountMoney =
          $v.minimumCardPaymentAmountMoney.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Location build() {
    _$Location _$result;
    try {
      _$result = _$v ??
          new _$Location._(
              currencyCode: BuiltValueNullFieldError.checkNotNull(
                  currencyCode, 'Location', 'currencyCode'),
              businessName: BuiltValueNullFieldError.checkNotNull(
                  businessName, 'Location', 'businessName'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'Location', 'name'),
              locationId: BuiltValueNullFieldError.checkNotNull(
                  locationId, 'Location', 'locationId'),
              isCardProcessingActivated: BuiltValueNullFieldError.checkNotNull(
                  isCardProcessingActivated,
                  'Location',
                  'isCardProcessingActivated'),
              maximumCardPaymentAmountMoney:
                  maximumCardPaymentAmountMoney.build(),
              minimumCardPaymentAmountMoney:
                  minimumCardPaymentAmountMoney.build());
    } catch (_) {
      late String _$failedField;
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
  final String? transactionId;
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

  factory _$CheckoutResult([void Function(CheckoutResultBuilder)? updates]) =>
      (new CheckoutResultBuilder()..update(updates)).build();

  _$CheckoutResult._(
      {this.transactionId,
      required this.transactionClientId,
      required this.locationId,
      required this.createdAt,
      required this.totalMoney,
      required this.totalTipMoney,
      required this.tenders})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transactionClientId, 'CheckoutResult', 'transactionClientId');
    BuiltValueNullFieldError.checkNotNull(
        locationId, 'CheckoutResult', 'locationId');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'CheckoutResult', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        totalMoney, 'CheckoutResult', 'totalMoney');
    BuiltValueNullFieldError.checkNotNull(
        totalTipMoney, 'CheckoutResult', 'totalTipMoney');
    BuiltValueNullFieldError.checkNotNull(tenders, 'CheckoutResult', 'tenders');
  }

  @override
  CheckoutResult rebuild(void Function(CheckoutResultBuilder) updates) =>
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
  _$CheckoutResult? _$v;

  String? _transactionId;
  String? get transactionId => _$this._transactionId;
  set transactionId(String? transactionId) =>
      _$this._transactionId = transactionId;

  String? _transactionClientId;
  String? get transactionClientId => _$this._transactionClientId;
  set transactionClientId(String? transactionClientId) =>
      _$this._transactionClientId = transactionClientId;

  String? _locationId;
  String? get locationId => _$this._locationId;
  set locationId(String? locationId) => _$this._locationId = locationId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  MoneyBuilder? _totalMoney;
  MoneyBuilder get totalMoney => _$this._totalMoney ??= new MoneyBuilder();
  set totalMoney(MoneyBuilder? totalMoney) => _$this._totalMoney = totalMoney;

  MoneyBuilder? _totalTipMoney;
  MoneyBuilder get totalTipMoney =>
      _$this._totalTipMoney ??= new MoneyBuilder();
  set totalTipMoney(MoneyBuilder? totalTipMoney) =>
      _$this._totalTipMoney = totalTipMoney;

  ListBuilder<Tender>? _tenders;
  ListBuilder<Tender> get tenders =>
      _$this._tenders ??= new ListBuilder<Tender>();
  set tenders(ListBuilder<Tender>? tenders) => _$this._tenders = tenders;

  CheckoutResultBuilder();

  CheckoutResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _transactionClientId = $v.transactionClientId;
      _locationId = $v.locationId;
      _createdAt = $v.createdAt;
      _totalMoney = $v.totalMoney.toBuilder();
      _totalTipMoney = $v.totalTipMoney.toBuilder();
      _tenders = $v.tenders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckoutResult;
  }

  @override
  void update(void Function(CheckoutResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckoutResult build() {
    _$CheckoutResult _$result;
    try {
      _$result = _$v ??
          new _$CheckoutResult._(
              transactionId: transactionId,
              transactionClientId: BuiltValueNullFieldError.checkNotNull(
                  transactionClientId, 'CheckoutResult', 'transactionClientId'),
              locationId: BuiltValueNullFieldError.checkNotNull(
                  locationId, 'CheckoutResult', 'locationId'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'CheckoutResult', 'createdAt'),
              totalMoney: totalMoney.build(),
              totalTipMoney: totalTipMoney.build(),
              tenders: tenders.build());
    } catch (_) {
      late String _$failedField;
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
  final String? tenderId;
  @override
  final String createdAt;
  @override
  final CardDetails? cardDetails;
  @override
  final CashDetails? cashDetails;

  factory _$Tender([void Function(TenderBuilder)? updates]) =>
      (new TenderBuilder()..update(updates)).build();

  _$Tender._(
      {required this.totalMoney,
      required this.tipMoney,
      required this.type,
      this.tenderId,
      required this.createdAt,
      this.cardDetails,
      this.cashDetails})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(totalMoney, 'Tender', 'totalMoney');
    BuiltValueNullFieldError.checkNotNull(tipMoney, 'Tender', 'tipMoney');
    BuiltValueNullFieldError.checkNotNull(type, 'Tender', 'type');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'Tender', 'createdAt');
  }

  @override
  Tender rebuild(void Function(TenderBuilder) updates) =>
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
  _$Tender? _$v;

  MoneyBuilder? _totalMoney;
  MoneyBuilder get totalMoney => _$this._totalMoney ??= new MoneyBuilder();
  set totalMoney(MoneyBuilder? totalMoney) => _$this._totalMoney = totalMoney;

  MoneyBuilder? _tipMoney;
  MoneyBuilder get tipMoney => _$this._tipMoney ??= new MoneyBuilder();
  set tipMoney(MoneyBuilder? tipMoney) => _$this._tipMoney = tipMoney;

  TenderType? _type;
  TenderType? get type => _$this._type;
  set type(TenderType? type) => _$this._type = type;

  String? _tenderId;
  String? get tenderId => _$this._tenderId;
  set tenderId(String? tenderId) => _$this._tenderId = tenderId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  CardDetailsBuilder? _cardDetails;
  CardDetailsBuilder get cardDetails =>
      _$this._cardDetails ??= new CardDetailsBuilder();
  set cardDetails(CardDetailsBuilder? cardDetails) =>
      _$this._cardDetails = cardDetails;

  CashDetailsBuilder? _cashDetails;
  CashDetailsBuilder get cashDetails =>
      _$this._cashDetails ??= new CashDetailsBuilder();
  set cashDetails(CashDetailsBuilder? cashDetails) =>
      _$this._cashDetails = cashDetails;

  TenderBuilder();

  TenderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalMoney = $v.totalMoney.toBuilder();
      _tipMoney = $v.tipMoney.toBuilder();
      _type = $v.type;
      _tenderId = $v.tenderId;
      _createdAt = $v.createdAt;
      _cardDetails = $v.cardDetails?.toBuilder();
      _cashDetails = $v.cashDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tender other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Tender;
  }

  @override
  void update(void Function(TenderBuilder)? updates) {
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
              type:
                  BuiltValueNullFieldError.checkNotNull(type, 'Tender', 'type'),
              tenderId: tenderId,
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'Tender', 'createdAt'),
              cardDetails: _cardDetails?.build(),
              cashDetails: _cashDetails?.build());
    } catch (_) {
      late String _$failedField;
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

  factory _$CashDetails([void Function(CashDetailsBuilder)? updates]) =>
      (new CashDetailsBuilder()..update(updates)).build();

  _$CashDetails._(
      {required this.buyerTenderedMoney, required this.changeBackMoney})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        buyerTenderedMoney, 'CashDetails', 'buyerTenderedMoney');
    BuiltValueNullFieldError.checkNotNull(
        changeBackMoney, 'CashDetails', 'changeBackMoney');
  }

  @override
  CashDetails rebuild(void Function(CashDetailsBuilder) updates) =>
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
  _$CashDetails? _$v;

  MoneyBuilder? _buyerTenderedMoney;
  MoneyBuilder get buyerTenderedMoney =>
      _$this._buyerTenderedMoney ??= new MoneyBuilder();
  set buyerTenderedMoney(MoneyBuilder? buyerTenderedMoney) =>
      _$this._buyerTenderedMoney = buyerTenderedMoney;

  MoneyBuilder? _changeBackMoney;
  MoneyBuilder get changeBackMoney =>
      _$this._changeBackMoney ??= new MoneyBuilder();
  set changeBackMoney(MoneyBuilder? changeBackMoney) =>
      _$this._changeBackMoney = changeBackMoney;

  CashDetailsBuilder();

  CashDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _buyerTenderedMoney = $v.buyerTenderedMoney.toBuilder();
      _changeBackMoney = $v.changeBackMoney.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CashDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CashDetails;
  }

  @override
  void update(void Function(CashDetailsBuilder)? updates) {
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
      late String _$failedField;
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

  factory _$CardDetails([void Function(CardDetailsBuilder)? updates]) =>
      (new CardDetailsBuilder()..update(updates)).build();

  _$CardDetails._({required this.entryMethod, required this.card}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entryMethod, 'CardDetails', 'entryMethod');
    BuiltValueNullFieldError.checkNotNull(card, 'CardDetails', 'card');
  }

  @override
  CardDetails rebuild(void Function(CardDetailsBuilder) updates) =>
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
  _$CardDetails? _$v;

  EntryMethod? _entryMethod;
  EntryMethod? get entryMethod => _$this._entryMethod;
  set entryMethod(EntryMethod? entryMethod) =>
      _$this._entryMethod = entryMethod;

  CardBuilder? _card;
  CardBuilder get card => _$this._card ??= new CardBuilder();
  set card(CardBuilder? card) => _$this._card = card;

  CardDetailsBuilder();

  CardDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entryMethod = $v.entryMethod;
      _card = $v.card.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardDetails;
  }

  @override
  void update(void Function(CardDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardDetails build() {
    _$CardDetails _$result;
    try {
      _$result = _$v ??
          new _$CardDetails._(
              entryMethod: BuiltValueNullFieldError.checkNotNull(
                  entryMethod, 'CardDetails', 'entryMethod'),
              card: card.build());
    } catch (_) {
      late String _$failedField;
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
  @override
  final int? expirationMonth;
  @override
  final int? expirationYear;
  @override
  final String? id;
  @override
  final String? cardholderName;

  factory _$Card([void Function(CardBuilder)? updates]) =>
      (new CardBuilder()..update(updates)).build();

  _$Card._(
      {required this.brand,
      required this.lastFourDigits,
      this.expirationMonth,
      this.expirationYear,
      this.id,
      this.cardholderName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(brand, 'Card', 'brand');
    BuiltValueNullFieldError.checkNotNull(
        lastFourDigits, 'Card', 'lastFourDigits');
  }

  @override
  Card rebuild(void Function(CardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardBuilder toBuilder() => new CardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Card &&
        brand == other.brand &&
        lastFourDigits == other.lastFourDigits &&
        expirationMonth == other.expirationMonth &&
        expirationYear == other.expirationYear &&
        id == other.id &&
        cardholderName == other.cardholderName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, brand.hashCode), lastFourDigits.hashCode),
                    expirationMonth.hashCode),
                expirationYear.hashCode),
            id.hashCode),
        cardholderName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Card')
          ..add('brand', brand)
          ..add('lastFourDigits', lastFourDigits)
          ..add('expirationMonth', expirationMonth)
          ..add('expirationYear', expirationYear)
          ..add('id', id)
          ..add('cardholderName', cardholderName))
        .toString();
  }
}

class CardBuilder implements Builder<Card, CardBuilder> {
  _$Card? _$v;

  Brand? _brand;
  Brand? get brand => _$this._brand;
  set brand(Brand? brand) => _$this._brand = brand;

  String? _lastFourDigits;
  String? get lastFourDigits => _$this._lastFourDigits;
  set lastFourDigits(String? lastFourDigits) =>
      _$this._lastFourDigits = lastFourDigits;

  int? _expirationMonth;
  int? get expirationMonth => _$this._expirationMonth;
  set expirationMonth(int? expirationMonth) =>
      _$this._expirationMonth = expirationMonth;

  int? _expirationYear;
  int? get expirationYear => _$this._expirationYear;
  set expirationYear(int? expirationYear) =>
      _$this._expirationYear = expirationYear;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _cardholderName;
  String? get cardholderName => _$this._cardholderName;
  set cardholderName(String? cardholderName) =>
      _$this._cardholderName = cardholderName;

  CardBuilder();

  CardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _brand = $v.brand;
      _lastFourDigits = $v.lastFourDigits;
      _expirationMonth = $v.expirationMonth;
      _expirationYear = $v.expirationYear;
      _id = $v.id;
      _cardholderName = $v.cardholderName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Card other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Card;
  }

  @override
  void update(void Function(CardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Card build() {
    final _$result = _$v ??
        new _$Card._(
            brand:
                BuiltValueNullFieldError.checkNotNull(brand, 'Card', 'brand'),
            lastFourDigits: BuiltValueNullFieldError.checkNotNull(
                lastFourDigits, 'Card', 'lastFourDigits'),
            expirationMonth: expirationMonth,
            expirationYear: expirationYear,
            id: id,
            cardholderName: cardholderName);
    replace(_$result);
    return _$result;
  }
}

class _$CheckoutParameters extends CheckoutParameters {
  @override
  final Money amountMoney;
  @override
  final bool? skipReceipt;
  @override
  final bool? collectSignature;
  @override
  final bool? allowSplitTender;
  @override
  final bool? delayCapture;
  @override
  final String? note;
  @override
  final BuiltList<AdditionalPaymentType>? additionalPaymentTypes;
  @override
  final TipSettings? tipSettings;

  factory _$CheckoutParameters(
          [void Function(CheckoutParametersBuilder)? updates]) =>
      (new CheckoutParametersBuilder()..update(updates)).build();

  _$CheckoutParameters._(
      {required this.amountMoney,
      this.skipReceipt,
      this.collectSignature,
      this.allowSplitTender,
      this.delayCapture,
      this.note,
      this.additionalPaymentTypes,
      this.tipSettings})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        amountMoney, 'CheckoutParameters', 'amountMoney');
  }

  @override
  CheckoutParameters rebuild(
          void Function(CheckoutParametersBuilder) updates) =>
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
        collectSignature == other.collectSignature &&
        allowSplitTender == other.allowSplitTender &&
        delayCapture == other.delayCapture &&
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
                    $jc(
                        $jc(
                            $jc($jc(0, amountMoney.hashCode),
                                skipReceipt.hashCode),
                            collectSignature.hashCode),
                        allowSplitTender.hashCode),
                    delayCapture.hashCode),
                note.hashCode),
            additionalPaymentTypes.hashCode),
        tipSettings.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CheckoutParameters')
          ..add('amountMoney', amountMoney)
          ..add('skipReceipt', skipReceipt)
          ..add('collectSignature', collectSignature)
          ..add('allowSplitTender', allowSplitTender)
          ..add('delayCapture', delayCapture)
          ..add('note', note)
          ..add('additionalPaymentTypes', additionalPaymentTypes)
          ..add('tipSettings', tipSettings))
        .toString();
  }
}

class CheckoutParametersBuilder
    implements Builder<CheckoutParameters, CheckoutParametersBuilder> {
  _$CheckoutParameters? _$v;

  MoneyBuilder? _amountMoney;
  MoneyBuilder get amountMoney => _$this._amountMoney ??= new MoneyBuilder();
  set amountMoney(MoneyBuilder? amountMoney) =>
      _$this._amountMoney = amountMoney;

  bool? _skipReceipt;
  bool? get skipReceipt => _$this._skipReceipt;
  set skipReceipt(bool? skipReceipt) => _$this._skipReceipt = skipReceipt;

  bool? _collectSignature;
  bool? get collectSignature => _$this._collectSignature;
  set collectSignature(bool? collectSignature) =>
      _$this._collectSignature = collectSignature;

  bool? _allowSplitTender;
  bool? get allowSplitTender => _$this._allowSplitTender;
  set allowSplitTender(bool? allowSplitTender) =>
      _$this._allowSplitTender = allowSplitTender;

  bool? _delayCapture;
  bool? get delayCapture => _$this._delayCapture;
  set delayCapture(bool? delayCapture) => _$this._delayCapture = delayCapture;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  ListBuilder<AdditionalPaymentType>? _additionalPaymentTypes;
  ListBuilder<AdditionalPaymentType> get additionalPaymentTypes =>
      _$this._additionalPaymentTypes ??=
          new ListBuilder<AdditionalPaymentType>();
  set additionalPaymentTypes(
          ListBuilder<AdditionalPaymentType>? additionalPaymentTypes) =>
      _$this._additionalPaymentTypes = additionalPaymentTypes;

  TipSettingsBuilder? _tipSettings;
  TipSettingsBuilder get tipSettings =>
      _$this._tipSettings ??= new TipSettingsBuilder();
  set tipSettings(TipSettingsBuilder? tipSettings) =>
      _$this._tipSettings = tipSettings;

  CheckoutParametersBuilder();

  CheckoutParametersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amountMoney = $v.amountMoney.toBuilder();
      _skipReceipt = $v.skipReceipt;
      _collectSignature = $v.collectSignature;
      _allowSplitTender = $v.allowSplitTender;
      _delayCapture = $v.delayCapture;
      _note = $v.note;
      _additionalPaymentTypes = $v.additionalPaymentTypes?.toBuilder();
      _tipSettings = $v.tipSettings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutParameters other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckoutParameters;
  }

  @override
  void update(void Function(CheckoutParametersBuilder)? updates) {
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
              collectSignature: collectSignature,
              allowSplitTender: allowSplitTender,
              delayCapture: delayCapture,
              note: note,
              additionalPaymentTypes: _additionalPaymentTypes?.build(),
              tipSettings: _tipSettings?.build());
    } catch (_) {
      late String _$failedField;
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
  final bool? showCustomTipField;
  @override
  final bool? showSeparateTipScreen;
  @override
  final BuiltList<int>? tipPercentages;

  factory _$TipSettings([void Function(TipSettingsBuilder)? updates]) =>
      (new TipSettingsBuilder()..update(updates)).build();

  _$TipSettings._(
      {this.showCustomTipField,
      this.showSeparateTipScreen,
      this.tipPercentages})
      : super._();

  @override
  TipSettings rebuild(void Function(TipSettingsBuilder) updates) =>
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
  _$TipSettings? _$v;

  bool? _showCustomTipField;
  bool? get showCustomTipField => _$this._showCustomTipField;
  set showCustomTipField(bool? showCustomTipField) =>
      _$this._showCustomTipField = showCustomTipField;

  bool? _showSeparateTipScreen;
  bool? get showSeparateTipScreen => _$this._showSeparateTipScreen;
  set showSeparateTipScreen(bool? showSeparateTipScreen) =>
      _$this._showSeparateTipScreen = showSeparateTipScreen;

  ListBuilder<int>? _tipPercentages;
  ListBuilder<int> get tipPercentages =>
      _$this._tipPercentages ??= new ListBuilder<int>();
  set tipPercentages(ListBuilder<int>? tipPercentages) =>
      _$this._tipPercentages = tipPercentages;

  TipSettingsBuilder();

  TipSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _showCustomTipField = $v.showCustomTipField;
      _showSeparateTipScreen = $v.showSeparateTipScreen;
      _tipPercentages = $v.tipPercentages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TipSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TipSettings;
  }

  @override
  void update(void Function(TipSettingsBuilder)? updates) {
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
      late String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
