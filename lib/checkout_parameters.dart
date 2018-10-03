import 'money.dart';
import 'tip_settings.dart';

class CheckoutParameters {

    // var checkoutParams = {
    //   'amountMoney': {
    //     'amount': 100,
    //     'currencyCode': 'USD', // optional, use authorized location's currency code by default
    //   },
    //   // Optional for all following configuration
    //   'skipReceipt': false,
    //   'alwaysRequireSignature': true,
    //   'allowSplitTender': false,
    //   'note': 'Hello 💳 💰 World!',
    //   'tipSettings': {
    //     'showCustomTipField': true,
    //     'showSeparateTipScreen': false,
    //     'tipPercentages': [15, 20, 30],
    //   },
    //   'additionalPaymentTypes': ['cash', 'manual_card_entry', 'other'],
    // };

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