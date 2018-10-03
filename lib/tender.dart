import 'money.dart';
import 'card_details.dart';
import 'cash_details.dart';

class Tender {

  final Money totalMoney;
  final Money tipMoney;
  final String type;
  final String tenderId;
  final String createdAt;
  final CardDetails cardDetails;
  final CashDetails cashDetails;

  Tender(
    this.totalMoney,
    this.tipMoney,
    this.type,
    this.tenderId,
    this.createdAt,
    this.cardDetails,
    this.cashDetails,
  );

  static Tender castToTender(Map<dynamic, dynamic> tenderNativeObject) {
    return Tender(
      Money.castToMoney(tenderNativeObject['totalMoney']),
      Money.castToMoney(tenderNativeObject['tipMoney']),
      tenderNativeObject['type'],
      tenderNativeObject.containsKey('tenderId') ? tenderNativeObject['tenderId'] : null,
      tenderNativeObject['createdAt'],
      tenderNativeObject.containsKey('cardDetails') ? CardDetails.castToCardDetails(tenderNativeObject['cardDetails']) : null,
      tenderNativeObject.containsKey('cashDetails') ? CashDetails.castToCashDetails(tenderNativeObject['cashDetails']) : null,
    );
  }
}
