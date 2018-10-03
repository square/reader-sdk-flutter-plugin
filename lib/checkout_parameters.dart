import 'money.dart';
import 'tip_settings.dart';

class CheckoutParameters {

  final Money amountMoney;
  bool skipReceipt = false;
  bool alwaysRequireSignature = true;
  bool allowSplitTender = false;
  String note;
  List<String> additionalPaymentTypes;
  TipSettings tipSettings;

  CheckoutParameters(
    this.amountMoney,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> checkoutParamsMap = Map<String, dynamic>();
    checkoutParamsMap['amountMoney'] = this.amountMoney.toMap();
    checkoutParamsMap['skipReceipt'] = this.skipReceipt;
    checkoutParamsMap['alwaysRequireSignature'] = this.alwaysRequireSignature;
    checkoutParamsMap['allowSplitTender'] = this.allowSplitTender;
    if (this.note != null) {
      checkoutParamsMap['note'] = this.note;
    }
    if (this.additionalPaymentTypes != null) {
      checkoutParamsMap['additionalPaymentTypes'] = this.additionalPaymentTypes;
    }
    if (this.tipSettings != null) {
      checkoutParamsMap['tipSettings'] = this.tipSettings.toMap();
    }
    return checkoutParamsMap;
  }
}