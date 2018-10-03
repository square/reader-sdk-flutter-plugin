import 'money.dart';

class Location {

  final String currencyCode;
  final String businessName;
  final String name;
  final String locationId;
  final bool isCardProcessingActivated;
  final Money maximumCardPaymentAmountMoney;
  final Money minimumCardPaymentAmountMoney;

  Location(
    this.currencyCode,
    this.businessName,
    this.name,
    this.locationId,
    this.isCardProcessingActivated,
    this.maximumCardPaymentAmountMoney,
    this.minimumCardPaymentAmountMoney,
  );

  static Location castToLocation(Map<dynamic, dynamic> locationNativeObject) {
    return Location(
      locationNativeObject['currencyCode'],
      locationNativeObject['businessName'],
      locationNativeObject['name'],
      locationNativeObject['locationId'],
      locationNativeObject['isCardProcessingActivated'],
      Money.castToMoney(locationNativeObject['maximumCardPaymentAmountMoney']),
      Money.castToMoney(locationNativeObject['minimumCardPaymentAmountMoney']),
    );
  }
}
