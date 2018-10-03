import 'money.dart';
import 'tender.dart';

class CheckoutResult {

  final String transactionId;
  final String transactionClientId;
  final String locationId;
  final String createdAt;
  final Money totalMoney;
  final Money totalTipMoney;
  final List<Tender> tenders;

  CheckoutResult(
    this.transactionId,
    this.transactionClientId,
    this.locationId,
    this.createdAt,
    this.totalMoney,
    this.totalTipMoney,
    this.tenders,
  );

  static CheckoutResult castToCheckoutResult(Map<dynamic, dynamic> checkoutResultNativeObject) {
    List<Tender> tenderList = List<Tender>();
    List<dynamic> tenderNativeList = checkoutResultNativeObject['tenders'];
    for (var tenderNativeObject in tenderNativeList) {
      tenderList.add(Tender.castToTender(tenderNativeObject));
    }

    return CheckoutResult(
      checkoutResultNativeObject['transactionId'],
      checkoutResultNativeObject['transactionClientId'],
      checkoutResultNativeObject['locationId'],
      checkoutResultNativeObject['createdAt'],
      Money.castToMoney(checkoutResultNativeObject['totalMoney']),
      Money.castToMoney(checkoutResultNativeObject['totalTipMoney']),
      tenderList,
    );
  }
}
