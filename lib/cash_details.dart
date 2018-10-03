import 'money.dart';

class CashDetails {

  final Money buyerTenderedMoney;
  final Money changeBackMoney;

  CashDetails(
    this.buyerTenderedMoney,
    this.changeBackMoney,
  );

  static CashDetails castToCashDetails(Map<dynamic, dynamic> cashDetailsNativeObject) {
    return CashDetails(
      Money.castToMoney(cashDetailsNativeObject['buyerTenderedMoney']),
      Money.castToMoney(cashDetailsNativeObject['changeBackMoney']),
    );
  }
}
